# ThriftyCash


 ![version](https://img.shields.io/badge/version-1.0.0-blue.svg) 
 
 
 ## Getting Started 🚀
 
To run the app use the following commands:

```sh

 flutter run

```

_\*App ThrifyCash works on iOS, Android._

---

## Building APk

To build apk you need to run this following commands:

```sh

 flutter build apk --split-per-abi

 // for signed build
 flutter build appbundle

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


## Running Tests 🧪

until now no test added [sad]
