#!/bin/sh
if [ ! -f "PSM.apk" ]; then 
	echo "Downloading PSM.apk"
	wget http://psmreborn.com/psm-android/Psm1.7.0.apk -O PSM.apk
fi

echo "Unpacking PSM.apk"
java -jar apktool.jar d PSM.apk -o PSM

echo "Applying java patches ..."
for file in patches/*.patch; do 
	if [ -f "$file" ]; then 
		patch --directory=PSM/ --strip=1<$file;
	fi
done

echo "Including extra smali files ..."
cp -rv include/* PSM/smali/

echo "Applying Android 5.x patch ..."
bspatch PSM/lib/armeabi/libdefault.so PSM/lib/armeabi/libdefault_real.so patches/android_5.bpatch

echo "Copying NoPsmDrm libraries."
cp -rv lib/* PSM/lib/armeabi/

echo "Rebuilding APK ..."
java -jar apktool.jar b PSM -o PSM_patched.apk

echo "Signing APK ..."
zipalign -p 4 PSM_patched.apk PSM_patched_align.apk
apksigner sign --ks-key-alias lob --ks sign.keystore --ks-pass pass:369852 --key-pass pass:369852 --v1-signing-enabled true --v2-signing-enabled true --v3-signing-enabled true --v4-signing-enabled true PSM_patched_align.apk


rm PSM_patched.apk
mv PSM_patched_align.apk PSM_NoPsmDrm_NoRoot.apk
echo "Patching complete"