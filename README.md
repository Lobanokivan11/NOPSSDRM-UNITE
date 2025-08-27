# NoPsmDrm-Unite

- This is a patches for the "PSM.apk" to run NoPsmDrm-Unite without root at all -


limitations: 
- no PS1 (PlayStation Suite)

- cannot backup any existing games (as the APK has a different signature.)

- on android 10+ ``/sdcard/android/data`` .. is not writable by any apps (but it is writable via ADB and USB transfer ..) 
To get around this the APK was modified to move the contents of /sdcard/psm/download. to its internal data folder on startup.
(it might require running the app twice before it shows up in the main menu though)

- on android 14+ app has to be installed with ``adb install --bypass-low-target-sdk-block`` 

Patching PSM.apk ... (currently only linux is supported for this)
``sudo apt install openjdk-8-jdk diff patch wget bspatch zipalign``
``./build_patched_apk.sh``