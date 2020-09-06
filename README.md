# dotfiles

My dotfiles

Check https://dotfiles.github.io/ for more information

## Stow

### Usage

#### Stow new config files

1. Generate new folder structure for your programm:  

    Lets say the config files for your programm is stored under: ~/.config/myProgramm/.myConfigFile:

        cd ~/dotfiles
        mkdir myProgramm
        cd myProgramm
        mkdir .config
        cd .config
        mkdir myProgramm

    So the folder structure inside the ~/dotfiles folder should look like:

        /myProgramm/.config/myProgram/

2. Move the original config file to the ~/dotfiles folder

        mv ~/.config/myProgramm/.myConfigFile ~/dotfiles/myProgramm/.config/myProgram/.myConfigFile

3. Delete old programm folder

        cd ~/.config/
        rm -R myProgramm

4. Stow the config file from the ~/dotfiles folder

        stow myProgramm

    This will generate all necessary symlinks.

### UnStow 

If you made some mistakes or you just want to revert the symlinks, you can use:

    stow -D myProgamm

## Resources

Documentation: https://www.gnu.org/software/stow/manual/stow.html
