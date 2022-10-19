# 📱 DACCKSCAM

A mobile application that tracks the driving habits of Aussie drivers to help them improve their driving or overcome their bad driving habtis. 

## 🔧 Setting up Local Development (App):
Required:
- Git bash
- Latest version of Android Studio
- Flutter version >3.0.0
- Dart SDK version >= 2.18.2

```bash
$ git clone https://github.com/Kevin-Au-Duong/DACCKSCAM-DECO3801-S2-2022-UQ.git
```

Set up guide for development:
1. Install Flutter through the git command line, ensure to get stable branch. Ensure that the Flutter version is 3.3.1 or newer. Link: https://docs.flutter.dev/development/tools/sdk/releases?tab=windows
2. Add the Flutter path variable according to the instructions on the Flutter installation website 
3. Go to the ~/flutter/bin directory, open a cmd instance and run “flutter doctor” 
4. Install Android Studio. Ensure latest version. 
5. Install Flutter plugin on Android Studio 
6. Choose open project from VCS on Android Studio with the git link provided above
7. Go to Device Manager on the right or bottom side bar menu and create virtual device 
8. Choose “Nexus 6” from device list and use Android 11.0 or later
9. Start the virtual device 
10. Click build to start emulating the app 

## 🔨 Building the .APK (App):
1. Choose `Build` on the top left action menu bar
2. Choose sub-menu `Flutter`
3. Choose `Build APK`

Now you have an .APK file which you can run on an Android device/emulator!

__*Note that the .APK file will only run on any Android system later than Lollipop (5.0), but the accompanied simulation will only run on systems that are using ARMv7 CPU architecture or support ARMv7 .APK files.*__

