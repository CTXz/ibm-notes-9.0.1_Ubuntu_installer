#!/bin/bash

# Copyright 2018 Patrick Pedersen <ctx.xda@gmail.com>

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Custom IBM Notes 9.0.1 patcher and installer for Ubuntu 16.04 systems

# Information on usage and execution is available in the README that comes with this file
# This installation script comes WITHOUT any IBM software and must be installed by the user himself

echo "Ubuntu patcher for IBM notes 9.0.1"

if [ $(basename $1) == ibm-notes-9.0.1.i586.deb ]; then

	echo "Installing necessary packages before installation"

	sudo apt-get install libbonobo2-0 libbonoboui2-0 libgconf2-4 libgnomeui-0 libjpeg62 gdebi
	sudo apt-get install libgnome-desktop-*

	echo "Getting necessary unsupported/unofficial dependencies"

	mkdir temp_install

	wget http://security.ubuntu.com/ubuntu/pool/universe/g/gnome-desktop/libgnome-desktop-2-17_2.32.1-2ubuntu1_amd64.deb temp_install/
	wget http://launchpadlibrarian.net/183708483/libxp6_1.0.2-2_amd64.deb temp_install/

	function clean
	{
		sudo rm -R temp_*
		sudo rm libgnome-desktop-2-17_2.32.1-2ubuntu1_amd64.deb*
		sudo rm libxp6_1.0.2-2_amd64.deb*
	}

	sudo gdebi libgnome-desktop-2-17_2.32.1-2ubuntu1_amd64.deb
	if sudo apt-get -qq install libgnome-desktop-2-17; then
		echo "libgnome-desktop-2-17 : successfully installed"
	else
		echo "libgnome-desktop-2-17 : installation unsuccessful"
		clean
		exit 1
	fi

	sudo gdebi libxp6_1.0.2-2_amd64.deb
	if sudo apt-get -qq install libxp6; then
		echo "libxp6 : successfully installed"
	else
		echo "libxp6 : installation unsuccessful"
		clean
		exit 1
	fi

	echo "Patching the ibm-notes-9.0.1 package"
	echo "This may take a while depending on your hardware"

	# Give user time to read echo
	sleep 5

	sudo dpkg -X $1 ./temp_notes_unpacked
	sudo dpkg -e $1 ./temp_notes_unpacked/DEBIAN
	sudo sed -i 's/libcupsys2/libcups2/g' ./temp_notes_unpacked/DEBIAN/control
	sudo sed -i 's/ libgnome-desktop-2 | libgnome-desktop-2-7 | libgnome-desktop-2-11 | libgnome-desktop-2-17 | libgnome-desktop-3-2,//g' ./temp_notes_unpacked/DEBIAN/control
	sudo sed -i 's/ libxp6,//g' ./temp_notes_unpacked/DEBIAN/control
	sudo sed -i 's/libpng12-0/libpng16-16/g' ./temp_notes_unpacked/DEBIAN/control

	sudo dpkg -b temp_notes_unpacked $1

	echo "Done patching"

	clean

	echo "Installing IBM notes 9.0.1"

	# Give user time to read echo
	sleep 5

	sudo gdebi $1

	cd ../

	echo "Successfully installed IBM Notes 9.0.1"

else

	echo "Please open the installer using the ibm-notes-9.0.1 deb package"

fi
