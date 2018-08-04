# "modern" OS deployment (mOSD)
"Modern" also means **simplified**, that's why I will give you an example on how to setup Windows 10 with just the original source (ISO) and a few scripts… Like in the "old" days, where unattended setup was the standard way to setup an OS. 

All the files of this "example" are published on: https://github.com/rzander/mOSD
# Quick Start
If you want to see **mOSD** (modern OSD) in action, just do:

* **download** the original Windows 10 ISO (MSDN or VL Portal)
* **extract the ISO** to your disk (or mount the ISO and copy the content to a writable Directory)
* **download mOSD.exe** from https://github.com/rzander/mOSD/releases/latest and copy it into the extracted ISO folder.
* **run mOSD.exe** to extract the content from the file.
* **rename** autounattend_[**your language**].xml to **autounattend.xml**.
* **start** rzTools\CreateISO.cmd as admin to create a new c:\W10.iso
* **use** rzTools\\[rufus.exe](https://rufus.akeo.ie) to create a bootable USB stick from the c:\W10.iso
* **boot** W10.ISO or the created USB Stick...

>Note: The system will automatically poweroff at the end of the setup before OOBE is starting. 

# Why do we need that?
Because it's:

* **super fast** (Win10, Office356, 7-Zip, AdobeReader, Chrome, VSCode … in **less than 15min** on a VM)
* independent
 * loads all files from a local media (USB) and/or internet
 * does not require any Servers -> great for Desaster-Recovery scenarios
 * independent of the OS Build, and Language
* Out of the box
 * useful to reproduce Issues from Corp. Images (without any GPO's etc.)
 * performance benchmarks (compare an OutOfBox W10 vs your corporate W10)
* Easy to create
 * just follow the [Quick Start](Quick Start) guide. 
* fully unattended
 * An end user will be able to rebuild a client.
