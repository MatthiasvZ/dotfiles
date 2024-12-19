if [ $USER == 'root' ]; then
	pushd /opt/surf/
	make install
	make clean
	popd
else
	echo "ERROR: This script has to be run as root"
fi

