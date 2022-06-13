#!/bin/bash


if [[ "${UID}" -eq 0 ]]
    then
        tput setaf 2; echo "Setup script is ready! READY TO ROCK!"; tput sgr0
    else
        tput setaf 1; echo "Man, you must enter with sudo priviligence."; tput sgr0
        exit 1
fi

# Main setup for my VMs
main_apps() {
    apt update
    apt install -y net-tools
    apt install -y macchanger
    apt install -y tree
    apt-get install -y git
    apt install -y konsole
    apt install -y keepassxc
    apt-get install -y openssh-server
    apt installl ncdu
}

git_config() {
    mkdir /home/ihor/GitHub
    cd /home/ihor/Git
    # GitHub
    git clone git@github.com:1hkr4m/atlas_devops_iac.git
    git clone git@github.com:1hkr4m/linux-devops.git
    git clone git@github.com:1hkr4m/my-site.git
    git clone git@github.com:1hkr4m/powershell.git
    git clone git@github.com:1hkr4m/python-learn.git
    git clone git@github.com:1hkr4m/shell.git
    git clone git@github.com:1hkr4m/team_international.git
    git clone git@github.com:1hkr4m/team-labs.git
    #git clone git@github.com:1hkr4m/py-cisco.git
    #git clone git@github.com:1hkr4m/ccna.git
    #git clone git@github.com:1hkr4m/leetcode.git

    # BitBucket Team International
    git clone git@bitbucket.org:VaultMR/vaultmr.git
    git clone git@bitbucket.org:VaultMR/vaultmr_devops_confmgmt.git
    git clone git@bitbucket.org:careanalytics/catapult_devops.git
    git clone git@bitbucket.org:VaultMR/vaultmr_devops_iac.git
    #git clone git@bitbucket.org:VaultMR/vaultmr_aws_lambda.git
}

mac_address_conf() {
    ifconfig ens2s0 down
    ifconfig enp2s0 hw ether 00:00:00:00:00:01
    ifconfig enp2s0 up
}

# VisualStudio Code
dev_apps() {
    apt install apt-transport-https
    sudo apt install code
    sudo apt-get install python3.6
}

# Virtualization soft
vm_apps() {
    cd ~
    curl -O https://releases.hashicorp.com/vagrant/2.2.9/vagrant_2.2.9_x86_64.deb
    sudo apt install -y virtualbox
    sudo apt install -y ./vagrant_2.2.9_x86_64.deb
    }

# Other soft
other_apps() {
    sudo apt install synaptic
    sudo apt install terminator
sudo apt install doublecmd-gtk
sudo apt install filezilla
}
