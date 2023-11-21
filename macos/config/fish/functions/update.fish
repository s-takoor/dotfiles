function update
    # Update Homebrew
    brew update

    # Update formulae
    set outdated_formulae (brew outdated)
    if test -n "$outdated_formulae"
        echo "Updating outdated formulae..."
        brew upgrade
        brew cleanup --prune=all
    else
        echo "No outdated formulae found."
    end

    # Update casks
    set outdated_casks (brew outdated --cask)
    if test -n "$outdated_casks"
        echo "Updating outdated casks..."
        brew upgrade --cask --greedy
        brew cleanup --prune=all
    else
        echo "No outdated casks found."
    end

    # Run brew doctor
    brew doctor
end

