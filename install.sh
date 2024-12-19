#!/bin/bash
set -e

DOTFILES="$HOME/.dotfiles"
SCRIPTS_DIR="$HOME/scripts/dwm"

# Create scripts directory if it doesn't exist
mkdir -p "$SCRIPTS_DIR"

# Function to create a symlink with backup
create_symlink() {
    local source="$1"
    local target="$2"
    
    # If target already exists
    if [ -e "$target" ]; then
        # If it's already the correct symlink, skip
        if [ -L "$target" ] && [ "$(readlink "$target")" = "$source" ]; then
            echo "Correct symlink already exists: $target -> $source"
            return
        fi
        
        # Backup existing file/directory
        local backup="${target}.backup.$(date +%Y%m%d_%H%M%S)"
        echo "Backing up $target to $backup"
        mv "$target" "$backup"
    fi
    
    # Create symlink
    echo "Creating symlink: $target -> $source"
    ln -s "$source" "$target"
}

# Create symlinks for dotfiles
echo "Creating symlinks for dotfiles..."
create_symlink "$DOTFILES/.bashrc" "$HOME/.bashrc"
create_symlink "$DOTFILES/.xinitrc" "$HOME/.xinitrc"

# Create symlinks for DWM scripts
echo -e "\nCreating symlinks for DWM scripts..."
for script in dwm.sh dwmup.sh fcitx.sh monitor_init.sh status.sh stup.sh surfup.sh wallpaper.sh; do
    create_symlink "$DOTFILES/scripts/dwm/$script" "$SCRIPTS_DIR/$script"
done

# Make scripts executable
echo -e "\nMaking scripts executable..."
chmod +x "$SCRIPTS_DIR/"*

echo -e "\nDone! Your dotfiles have been linked.\n"
echo "Note: Backup files were created for any existing files that were replaced."
echo "You can find them with: find $HOME -name '*.backup.*'"
