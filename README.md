# IA Animalitos

## Getting Started

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Setup

1. Clone the repository.
2. Install [fvm](https://fvm.app/)
3. Run `fvm install` in the project root. This will install the proper flutter version for the app.
4. Create `.env.dev` and `.env.prod` based on the `.env.example`
5. Execute `fvm dart run build_runner build --delete-conflicting-outputs`

## Run the App

### Development

- Debug: `fvm flutter run -t lib/main.dart --flavor=development`
- Release: `fvm flutter run -t lib/main.dart --release --flavor=development`

### Production

- Debug: `fvm flutter run -t lib/main.dart --flavor=production`
- Release: `fvm flutter run -t lib/main.dart --release --flavor=production`

## Build

### Android

- Development: `fvm flutter build apk -t lib/main.dart --flavor=development`
- Production: `fvm flutter build apk -t lib/main.dart --flavor=production`

### App Bundle

- Development: `fvm flutter build appbundle --target-platform android-arm,android-arm64,android-x64 -t lib/main_dev.dart --flavor=development`

- Production: `fvm flutter build appbundle --target-platform android-arm,android-arm64,android-x64 -t lib/main_prod.dart --flavor=production`

### iOS

- Development: `fvm flutter build ios -t lib/main.dart --flavor=development`
- Production: `fvm flutter build ios -t lib/main.dart --flavor=production`
