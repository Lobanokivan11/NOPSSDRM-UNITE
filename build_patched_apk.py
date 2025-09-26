import os
import subprocess
import glob
import shutil

if not os.path.isfile("PSM.apk"):
    print("Downloading PSM.apk")
    subprocess.run(["wget", "http://psmreborn.com/psm-android/Psm1.7.0.apk", "-O", "PSM.apk"], check=True)

print("Unpacking PSM.apk")
subprocess.run(["java", "-jar", "apktool.jar", "d", "PSM.apk", "-o", "PSM"], check=True)

print("Applying java patches ...")
for file in glob.glob("patches/*.patch"):
    if os.path.isfile(file):
        with open(file, 'r') as patch_file:
            subprocess.run(["patch", "--directory=PSM/", "--strip=1"], stdin=patch_file, check=True)

print("Including extra smali files ...")
shutil.copytree("include", "PSM/smali", dirs_exist_ok=True)

print("Applying Android 5.x patch ...")
subprocess.run([
    "bspatch",
    "PSM/lib/armeabi/libdefault.so",
    "PSM/lib/armeabi/libdefault_real.so",
    "patches/android_5.bpatch"
], check=True)

print("Copying NoPsmDrm libraries.")
shutil.copytree("lib", "PSM/lib/armeabi", dirs_exist_ok=True)

print("Rebuilding APK ...")
subprocess.run(["java", "-jar", "apktool.jar", "b", "PSM", "-o", "PSM_patched.apk"], check=True)

print("Signing APK ...")
subprocess.run(["zipalign", "-p", "4", "PSM_patched.apk", "PSM_patched_align.apk"], check=True)
subprocess.run([
    "apksigner", "sign",
    "--ks-key-alias", "lob",
    "--ks", "sign.keystore",
    "--ks-pass", "pass:369852",
    "--key-pass", "pass:369852",
    "--v1-signing-enabled", "true",
    "--v2-signing-enabled", "true",
    "--v3-signing-enabled", "true",
    "--v4-signing-enabled", "true",
    "PSM_patched_align.apk"
], check=True)

os.remove("PSM_patched.apk")
os.rename("PSM_patched_align.apk", "PSM_NoPsmDrm_NoRoot.apk")
print("Patching complete")
