# Custom IBM Notes 9.0.1 patcher and installer for Ubuntu systems

A simple patcher script that fixes broken dependencies required by the IBM Notes Debian package.

## Overview

Unfortunately Ubuntu has a tendency to deprecate a variety of packages with each major update. Packages that aren't distributed by Ubuntu's aptitude package manager, such as the IBM Notes Debian package, may suffer badly from these changes as they often depend on certain packages.

Fortunately enough it is possible to get IBM Notes running after a slight modification to the deb package.

As nobody likes to manually patch the packages dependency list, I have decided to write a small script that applies the necessary patches to the package, and then installs it.

## Usage

Installing IBM Notes 9.0.1 using the script is fairly simple

#### Requirements

Before you start, ensure that you have :

* The IBM Notes deb package/tar downloaded from the official IBM Notes download site (Download file will look somewhat like this : NOTES_9.0.1_LINUX_DI_EN.tar)
* The Installation script downloaded

#### GUI

To install IBM Notes 9.0.1 via a graphical user interface such as an GUI file manager, proceed with the following steps :

1. Extract the IBM deb tar to any directory
2. To keep things simpler, copy the Ubuntu_IBM-Notes-9.0.1.sh installation script into the the extracted directory
3. Finally, drag the *ibm-notes-9.0.1.i586.deb* file into the Ubuntu_IBM-Notes-9.0.1.sh file/icon

#### CLI

1. Extract the IBM deb tar to any directory using the tar xvf command

Example
```
$ tar xvf NOTES_9.0.1_LINUX_DI_EN.tar -C IBM
```

2. Run the installation script (as root)

**Syntax:**
```
# Ubuntu_IBM-Notes-9.0.1.sh <path to ibm notes deb package>
```

**Example:**
```
sudo bash Ubuntu_IBM-Notes-9.0.1.sh IBM/ibm-notes-9.0.1.i586.deb
```
