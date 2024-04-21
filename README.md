# ThriftyCash

![version](https://img.shields.io/badge/version-1.0.0-blue.svg)

## Getting Started 🚀

To run the app first you need to create a env.json file.

env.json file should look like this.

```sh
{
 "SUPABASE_URL": "https://xxxxxxxxxxxxxxx.supabase.co",
 "SUPABASE_ANON_KEY": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
  "API_KEY": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
}
```

you check example-env.json file in root directory.

Then either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh

 flutter run --dart-define-from-file=env.json

```

_\*This App works on iOS, Android._

---

## Building APk

To build apk you need to run this following commands:

```sh

 flutter build apk --split-per-abi --dart-define-from-file=env.json

 // for signed build
 flutter build appbundle --dart-define-from-file=env.json

```

Removing the --split-per-abi flag results in a fat APK that contains your code compiled for all the target ABIs. Such APKs are larger in size than their split counterparts, causing the user to download native binaries that are not applicable to their device’s architecture.

## File Structure

Within the download you'll find the following directories and files:

```
root/
├── android
├── assets
├── build
├── ios
├── lib
│   ├── common
│   ├── constants
│   ├── core
│   ├── data
│   ├── feature
│   ├── routes
│   ├── themes
│   └── main.dart
├── ThrifyCash.iml
├── pubspec.lock
├── pubspec.yaml
├── env.json
└── test
```

## TODO:

[ ] Homepage UI
[ ] Display Data Properly
[ ] CRUD trx offline
[ ] Sync CRUD

## Running Tests 🧪

until now no test added [sad]

## screenshot

![login](https://github.com/7ANV1R/ThriftyCash/assets/35481593/d4004f9f-e767-470b-afe4-edd1c816c9d4)
