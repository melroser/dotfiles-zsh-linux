#!/bin/zsh
#
# setup.sh
#

dir=`pwd`/homedir                   			# dotfiles directory
time_stamp=$(date +%Y-%m-%d-%T)				# Timestamp for Backup dir
backup="${HOME}/.backup_dotfiles_zsh/${time_stamp}"	# old dotfiles backup directory
dotfiles="aliases_zsh antigenrc vimrc zshenv zshrc"	# list of files/folders to symlink in homedir

########## Backup & Install Custom ZSH Dotfiles
#
# create folder for the backup
echo "Creating directory $backup for backup of any existing dotfiles in ~ ..."
mkdir -p $backup
echo "done"

# cd to the dotfiles directory
echo "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in user's home to dotfiles_old, then symlink
# every file inside ./homedir/
for file in $dotfiles; do
    echo "Moving  ~/.$file to $backup ..."
    mv ~/.$file $backup
    echo "Creating symlink $dir/$file --> ~/.$file ..."
    ln -s $dir/$file ~/.$file
    echo "Linked $file"
done

