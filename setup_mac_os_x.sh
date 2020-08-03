while true; do
    read -p "Do you wish to set up Mac OS X?" yn
    
    case $yn in 
        [Yy]* ) echo "Beginning Setup";

                echo "installing homebrew"
                #/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)";

                echo "Checking status of Visual Studio Code";
                ./brew_install_or_upgrade.sh visual-studio-code; echo $?
                echo "Checking status of iterm2"; echo $?
                ./brew_install_or_upgrade.sh iterm2; echo $?
                echo "Checking status of lastpass";
                ./brew_install_or_upgrade.sh lastpass; echo $?
                echo "Checking status of MS Office";
                ./brew_install_or_upgrade.sh microsoft-office; echo $?
                #echo "Checking status of meetingbar";
                #./brew_install_or_upgrade.sh meetingbar; echo $?
                echo "Checking status of Foxit";
                ./brew_install_or_upgrade.sh foxitreader; echo $?
                echo "All installs completed successfully!"
                exit;;

        [Nn]* ) break;;

        * ) echo "Please answer [Y]es or [N]o.";;
    esac

done



