if which git > /dev/null; then
    git clone https://github.com/sstephenson/bats.git
else
    echo "git is required to install BATS"
    exit 1
fi

if [[ $EUID == 0 ]]; then
    export SUDO=""
else
    export SUDO="sudo"
    if ! which sudo > /dev/null; then
    echo "root access is required - install sudo or run as root"
    exit 1
    fi
fi

cd bats || exit 1
$SUDO ./install.sh /usr/local
cd ..
rm -rf bats
bats --version
