function brew-upgrade
    if command -q brew
        echo "Updating Homebrew packages..."
        brew update && brew upgrade --cask --greedy
    else
        echo "Homebrew is not installed."
    end
end

# Alias for brew-upgrade function
alias upgrade 'brew-upgrade'

