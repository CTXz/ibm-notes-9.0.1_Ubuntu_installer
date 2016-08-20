# Custom IBM Notes 9.0.1 patcher and installer for Ubuntu 16.04 systems

IBM Notes has been available to the Linux Operating System since 2007, and has been out as a Ubuntu compatible debian package since 2008.

Unfortunately Ubuntu has a tendecy to deprecate many packages at each major update, some of them unfortunately even being dependencies. Some of those deprecated dependencies are required by IBM Notes and must be either installed manually or edited to use a newer version of the required dependencies.

Fortunately enough it is possible to get IBM Notes running after a slight modification of the deb package.

To achieve those modifications easily with only the matter of a single execution, I have decided to write a small script that will run the necessary "patches", and then install a fixed (or non-broken) package of IBM Notes 9.0.1.

## Usage

Installing IBM Notes 9.0.1 using the script is fairly simple

#### Before you start

Before you start make sure that you have :

* Ubuntu 16.04 installed
* The IBM Notes deb package/tar downloaded from the official IBM Notes download site (Download file will look somewhat like this : NOTES_9.0.1_LINUX_DI_EN.tar)
* The Installation script downloaded

#### From GUI

To install IBM Notes 9.0.1 via graphical user interface such as an GUI file manager and a simple drag and drop, run the following steps :

1 - Extract the IBM deb tar to any directory (make sure you remember where), in the end you will have 7 different files, 5 of them being deb packages (activites, feedreader, notes, opensocial, sametime + a license file and a broken "smartupgrade" script)

2 - To keep things simpler, copy the Ubuntu-16.04_IBM-Notes-9.0.1.sh installation script into the the extracted directory

3 - Finally, drag ONLY the ibm-notes-9.0.1.i586.deb file into the Ubuntu-16.04_IBM-Notes-9.0.1.sh file/icon

#### From Command line

1 - Extract the IBM deb tar to any directory using the tar xvf command

Example
```
tar xvf NOTES_9.0.1_LINUX_DI_EN.tar -C IBM
```

2 - Run the insllation script 

Syntax : \[path to Ubuntu-16.04_IBM-Notes-9.0.1.sh\] \[path to ibm-notes-9.0.1.i586.deb\]

Example
```
./Ubuntu-16.04_IBM-Notes-9.0.1.sh IBM/ibm-notes-9.0.1.i586.deb
```

###
