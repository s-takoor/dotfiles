function doom-emacs-sync
    echo "Syncing Doom Emacs..."
    doom sync
    echo "Running Doom Emacs doctor..."
    doom doctor
end

# Alias for doom-emacs-sync function
alias sync 'doom-emacs-sync'
