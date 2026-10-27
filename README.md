# Lightcat Sideloader

Sideloading app for Meta Quest on Windows. Plug in your Quest, drag in an APK, OBB or game folder and it installs it over ADB.

It doesn't block anything you want to install. It will warn you that pirated games can get your Meta account banned, and it doesn't host or link any pirated stuff.

## What it does

- **Home** - battery, storage, USB speed, controller batteries, sleep state. Works with more than one headset.
- **Sideload** - drag APKs, OBBs or whole game folders anywhere in the window. Installs go in a queue with progress.
- **Apps** - everything on the headset with real names and icons. Open, stop, save the APK to your PC or uninstall.
- **Files** - browse the headset, search, upload and download files and folders.
- **Cast** - see the headset on your PC, take screenshots and record clips (uses [scrcpy](https://github.com/Genymobile/scrcpy)).
- **Device settings** - refresh rate (up to 207 Hz on Quest 3), foveation, texture size, CPU/GPU levels, proximity sensor, Guardian and more.
- **Store / Library** - browse Steam and Quest games, read reviews, keep your PCVR games in one place.
- **Console** - run adb or shell commands.
- Wireless ADB, battery and storage alerts, tray icon, auto updates.

## You need

- Windows 10 or 11 (64-bit)
- A Quest with developer mode on. Allow USB debugging on the headset the first time you plug it in.

## Building it

Install [Flutter](https://docs.flutter.dev/get-started/install/windows) with Windows desktop support (Visual Studio with "Desktop development with C++").

```bash
flutter pub get
flutter run -d windows
flutter build windows
```

The app looks for these next to the exe:

```
lightcat_sideloader.exe
platform-tools\adb.exe   (Android Platform Tools)
scrcpy\scrcpy.exe        (scrcpy for Windows, for Cast)
```

They're not in the repo, grab [Platform Tools](https://developer.android.com/tools/releases/platform-tools) and [scrcpy](https://github.com/Genymobile/scrcpy/releases) and drop them there. If adb isn't there it falls back to `adb` on your PATH.

### Installer

Made with [Inno Setup 6](https://jrsoftware.org/isinfo.php). It packs `platform-tools` and `scrcpy` with the app and expects them in `C:\src\platform-tools` and `C:\src\scrcpy` (use `/DToolsDir=...` if yours are somewhere else).

```bash
flutter build windows
ISCC installer\lightcat.iss
```

You get `build\installer\LightcatSetup-<version>.exe`.

### Pushing an update

1. Bump the version in `pubspec.yaml`, `kVersion` in `lib/main.dart` and `MyAppVersion` in `installer/lightcat.iss`.
2. Build the installer and put it on a GitHub release tagged `v<version>`.
3. Update `latest.json` on `main` with the new version, the download link and the installer's SHA-256 (`certutil -hashfile LightcatSetup-<version>.exe SHA256`).

The app checks `latest.json` every few hours and shows the update.

There's also a demo mode with fake headsets for working on the UI without a Quest, set `kDemo = true` at the top of `lib/main.dart`.

## Not affiliated

This is my own project, it has nothing to do with Meta or Valve. Meta Quest is a trademark of Meta Platforms, Inc. and Steam is a trademark of Valve Corporation.

## License

Code is [MIT](LICENSE).

The **Lightcat** name and logo are mine and are **not** part of the MIT license. Don't use them for your own projects or forks without asking me. If you share a modified version, give it a different name and logo.
