-- Configs
--
import Data.Char (isSpace, toUpper)
import qualified Data.Map as M
import Data.Maybe
import Data.Monoid
import Graphics.X11.ExtraTypes.XF86
import System.Directory
import System.Exit (exitSuccess)
import System.IO (hPutStrLn)
import XMonad
import XMonad.Actions.CycleWS
import XMonad.Actions.SpawnOn
import XMonad.Config.Desktop
-- Hooks
--
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks (avoidStruts, docks, manageDocks)
import XMonad.Hooks.ManageHelpers (doCenterFloat, doFullFloat, isDialog, isFullscreen)
import XMonad.Hooks.Minimize
import XMonad.Hooks.SetWMName
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.WorkspaceHistory
-- Layout Modifiers
--
import XMonad.Layout.Fullscreen
import XMonad.Layout.Gaps
import XMonad.Layout.LayoutModifier
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import qualified XMonad.StackSet as W
-- Utilities
--
import XMonad.Util.EZConfig (additionalKeys, additionalMouseBindings)
import XMonad.Util.NamedActions
import XMonad.Util.NamedScratchpad
import XMonad.Util.Run (runProcessWithInput, safeSpawn, spawnPipe)
import XMonad.Util.SpawnOnce

-- Terminal
--
myTerminal :: String
myTerminal = "alacritty"

-- Fonts
--
myFont :: String
myFont = "xft:Iosevka Nerd Font:pixelsize=11:antialias=true:hinting=true"

-- Browser
--
myBrowser :: String
myBrowser = "firefox"

-- File Manager
--
myFileManager :: String
myFileManager = "pcmanfm"

-- Lockscreen
--
myLockscreen :: String
myLockscreen = "slock"

-- Screenshot
--
myScreenshot :: String
myScreenshot = "flameshot gui"

-- Whether focus follows the mouse pointer.
--
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Whether clicking on a window to focus also passes the click to the window.
--
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- Window border width
--
myBorderWidth = 2

-- ModMask
--
myModMask = mod4Mask

-- Border colors for unfocused and focused windows
--
myNormalBorderColor = "#3b4252"
myFocusedBorderColor = "#cc241d"

mydefaults =
  def
    { terminal = myTerminal
    , focusFollowsMouse = myFocusFollowsMouse
    , clickJustFocuses = myClickJustFocuses
    , borderWidth = myBorderWidth
    , modMask = myModMask
    , workspaces = myWorkspaces
    , normalBorderColor = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    , keys = myKeys
    , mouseBindings = myMouseBindings
    , layoutHook = avoidStruts $ gaps [(L, 10), (R, 10), (U, 10), (D, 10)] $ spacingRaw False (Border 10 0 10 0) True (Border 0 10 0 10) True $ myLayout
    , manageHook = myManageHook
    , startupHook = myStartupHook
    }

myKeys conf@(XConfig {XMonad.modMask = modm}) =
  M.fromList $
    -- launch a terminal
    [((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
    -- launch rofi
    , ((modm, xK_o), spawn "rofi -show drun")
    -- Launch pavucontrol
    , ((modm, xK_v), spawn "pavucontrol")
    -- Launch firefox
    , ((modm, xK_f), spawn myBrowser)
    -- Launch pcmanfm
    , ((modm, xK_s), spawn myFileManager)
    -- Multimedia Keys
    , ((0, xF86XK_AudioMute), spawn $ "pactl -- set-sink-mute 0 toggle")
    , ((0, xF86XK_AudioRaiseVolume), spawn $ "pactl -- set-sink-volume 0 +5%")
    , ((0, xF86XK_AudioLowerVolume), spawn $ "pactl -- set-sink-volume 0 -5%")
    , ((0, xF86XK_AudioPlay), spawn $ "mpc toggle")
    , ((0, xF86XK_AudioNext), spawn $ "mpc next")
    , ((0, xF86XK_AudioPrev), spawn $ "mpc prev")
    -- close focused window
    , ((modm .|. shiftMask, xK_c), kill)
    -- lock screen
    , ((modm .|. shiftMask, xK_l), spawn myLockscreen)
    -- screenshot
    , ((modm .|. shiftMask, xK_p), spawn myScreenshot)
    -- Rotate through the available layout algorithms
    , ((modm, xK_space), sendMessage NextLayout)
    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space), setLayout $ XMonad.layoutHook conf)
    -- Resize viewed windows to the correct size
    , ((modm, xK_n), refresh)
    -- Move focus to the next window
    , ((modm, xK_Tab), windows W.focusDown)
    -- Move focus to the next window
    , ((modm, xK_j), windows W.focusDown)
    -- Move focus to the previous window
    , ((modm, xK_k), windows W.focusUp)
    -- Move focus to the master window
    , ((modm, xK_m), windows W.focusMaster)
    -- Swap the focused window and the master window
    , ((modm, xK_Return), windows W.swapMaster)
    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j), windows W.swapDown)
    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k), windows W.swapUp)
    -- Shrink the master area
    , ((modm, xK_h), sendMessage Shrink)
    -- Expand the master area
    , ((modm, xK_l), sendMessage Expand)
    -- Push window back into tiling
    , ((modm, xK_t), withFocused $ windows . W.sink)
    -- Increment the number of windows in the master area
    , ((modm, xK_comma), sendMessage (IncMasterN 1))
    -- Deincrement the number of windows in the master area
    , ((modm, xK_period), sendMessage (IncMasterN (-1)))
    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    -- , ((modm              , xK_b     ), sendMessage ToggleStruts)
    --
    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q), io (exitSuccess))
    -- Restart xmonad
    , ((modm, xK_q), spawn "xmonad --recompile; xmonad --restart")
    ]
     ++
    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [ ((m .|. modm, k), windows $ f i)
       | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
    ,     (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
    ]
     ++
    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [ ((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
       | (key, sc) <- zip [xK_w, xK_e, xK_r] [0 ..]
    ,     (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
    ]

myMouseBindings (XConfig {XMonad.modMask = modm}) =
  M.fromList $
    -- mod-button1, Set the window to floating mode and move by dragging
    [ ( (modm, button1),
        ( \w ->
            focus w >> mouseMoveWindow w
              >> windows W.shiftMaster
        )
      ),
      -- mod-button2, Raise the window to the top of the stack
      ((modm, button2), (\w -> focus w >> windows W.shiftMaster)),
      -- mod-button3, Set the window to floating mode and resize by dragging
      ( (modm, button3),
        ( \w ->
            focus w >> mouseResizeWindow w
              >> windows W.shiftMaster
        )
      )
      -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

myLayout = avoidStruts $ tiled ||| Mirror tiled ||| Full
  where
    -- default tiling algorithm partitions the screen into two panes
    tiled = Tall nmaster delta ratio

    -- The default number of windows in the master pane
    nmaster = 1

    -- Default proportion of screen occupied by master pane
    ratio = 1 / 2

    -- Percent of screen to increment by when resizing panes
    delta = 3 / 100

-- Workspaces
--
xmobarEscape = concatMap doubleLts
  where
    doubleLts '<' = "<<"
    doubleLts x = [x]

myWorkspaces :: [String]
myWorkspaces = clickable . (map xmobarEscape) $ ["\xe795", "\xe745", "\xfc6e", "\xe7c5", "\xe708", "\xfb6e", "\xf001", "\xf1c8", "\xf166"]
  where
    clickable l = ["<action=xdotool key super+" ++ show (n) ++ ">" ++ ws ++ "</action>" | (i, ws) <- zip [1, 2, 3, 4, 5, 6, 7, 8, 9] l, let n = i]

myManageHook =
  fullscreenManageHook <+> manageDocks
    <+> composeAll
      [ className =? "confirm" --> doCenterFloat
      , className =? "file_progress" --> doCenterFloat
      , className =? "dialog" --> doCenterFloat
      , className =? "download" --> doCenterFloat
      , className =? "error" --> doCenterFloat
      , className =? "mpv" --> doFloat
      , className =? "flameshot-gui" --> doFloat
      , className =? "firefox" --> doShift (myWorkspaces !! 1)
      , className =? "qutebrowser" --> doShift (myWorkspaces !! 1)
      , className =? "Pcmanfm" --> doShift (myWorkspaces !! 2)
      , className =? "Emacs" --> doShift (myWorkspaces !! 3)
      , isFullscreen --> doFullFloat
      ]

myLogHook xmproc = do
  dynamicLogWithPP $
    xmobarPP
      { ppOutput = hPutStrLn xmproc,
        ppTitle = xmobarColor "#b3afc2" "" . shorten 60,
        ppCurrent = xmobarColor "#98be65" "" . wrap "[" "]",
        ppVisible = xmobarColor "#c792ea" "",
        ppSep = "<fc=#cc241d> <fn=1>|</fn> </fc>"
      }

myStartupHook = do
  spawnOnce "lxsession &"
  spawnOnce "~/.fehbg &"
  spawnOnce "mpd &"
  spawnOnce "picom &"
  spawnOnce "conky"
  spawnOnce "mpd-notification -m ~/Music &"
  spawnOnce "redshift -c ~/.config/redshift/redshift.conf &"
  setWMName "LG3D"

main = do
  xmproc <- spawnPipe "xmobar"
  xmonad $ fullscreenSupport $ docks $ ewmh $ mydefaults {logHook = myLogHook xmproc}
