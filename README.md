# Lightcat Sideloader

A modern Windows app for sideloading onto Meta Quest headsets. Plug in your Quest, drop in an APK, OBB or game folder, and Lightcat installs it over ADB.

Lightcat never blocks what you choose to install. It does warn you that pirated games can get your Meta account banned, and it does not host or link to pirated content.

## Features

- **Home**: headset art, battery ring, storage, USB speed, controller batteries and sleep state, with support for several headsets.
- **Sideload**: drag and drop APKs, OBBs or whole game folders anywhere in the window. Installs run in a queue with live progress.
- **Apps**: everything installed on the headset, with real names and icons. Launch, stop, save the APK to your PC or uninstall.
- **Files**: browse the headset storage, search, upload and download any file or folder.
- **Cast**: live view of the headset on your PC, screenshots and recorded clips (powered by [scrcpy](https://github.com/Genymobile/scrcpy)).
- **Device settings**: refresh rate (up to 207 Hz on Quest 3), foveation, texture resolution, CPU/GPU levels, proximity sensor, Guardian and more.
- **Store and Library**: browse Steam and Meta Quest games, read reviews, and keep your PCVR games in one place.
- **Console**: run shell or ADB commands directly.
- Wireless ADB, battery and storage alerts, a tray icon and automatic updates.

## Requirements

- Windows 10 or 11 (64-bit)
- A Meta Quest headset with developer mode turned on, and USB debugging allowed on the headset when you first plug it in

## Building from source

You need the [Flutter SDK](https://docs.flutter.dev/get-started/install/windows) with Windows desktop support (Visual Studio with the "Desktop development with C++" workload).

```bash
flutter pub get
flutter run -d windows
flutter build windows
```

Lightcat looks for its tools next to the built exe:

```
lightcat_sideloader.exe
platform-tools\adb.exe   (Android SDK Platform Tools)
scrcpy\scrcpy.exe        (scrcpy for Windows, used by Cast)
```

These folders are not part of the repository. Download [Platform Tools](https://developer.android.com/tools/releases/platform-tools) and [scrcpy](https://github.com/Genymobile/scrcpy/releases) and place them there. If `adb.exe` is not found, Lightcat falls back to `adb` on your PATH.

Set `kDemo = true` at the top of `lib/main.dart` to build a demo version with fake headsets, which is handy for working on the UI without a Quest.

## Disclaimer

Lightcat Sideloader is an independent project. It is not affiliated with, endorsed by, or sponsored by Meta or Valve. Meta Quest is a trademark of Meta Platforms, Inc. Steam is a trademark of Valve Corporation.

## License

The source code is released under the [MIT License](LICENSE).

The **Lightcat** name and the Lightcat logo belong to faisaldacoolkid and are **not** covered by the MIT License. You may not use them to name, brand or promote your own projects or forks without permission. If you redistribute a modified version, please give it a different name and logo.
