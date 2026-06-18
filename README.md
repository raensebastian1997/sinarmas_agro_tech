# SMART Reverse Counting API

Backend Spring Boot untuk menghitung selisih positif antara angka dan angka yang dibalik.

## Arsitektur

- `domain`: aturan bisnis murni, tanpa dependency Spring.
- `application`: use case dan boundary aplikasi.
- `infrastructure`: REST controller, DTO HTTP, konfigurasi bean, dan error handler.

## Endpoint

`POST /api/v1/reverse-difference`

Request:

```json
{
  "number": "1.2"
}
```

Response:

```json
{
  "originalInput": "1.2",
  "normalizedNumber": "12",
  "reversedNumber": "21",
  "difference": "9"
}
```

Karakter selain digit akan diabaikan, sehingga `1.2` atau `1,2` diproses sebagai `12`.

## Menjalankan

```bash
./gradlew bootRun
```

## Test

```bash
./gradlew test
```



# SINARMAS Mobile Flutter

Aplikasi Flutter untuk menghitung selisih antara angka input dan angka kebalikannya.

## Prasyarat

Pastikan software berikut sudah terpasang:

- Flutter SDK `3.38.7` atau versi stable yang kompatibel dengan Dart `3.10.7`
- Dart SDK sudah termasuk di dalam Flutter
- Android Studio untuk menjalankan aplikasi di Android emulator/device
- JDK 17 untuk build Android
- Xcode dan CocoaPods untuk menjalankan aplikasi di iOS/macOS
- Google Chrome untuk menjalankan aplikasi di web

Cek instalasi Flutter:

```bash
flutter --version
flutter doctor
```

Jika `flutter doctor` masih menampilkan error, selesaikan dulu bagian yang bermasalah sebelum menjalankan aplikasi.

## Setup Project

Masuk ke folder project:

```bash
cd "SINARMAS Mobile Flutter"
```

Ambil semua dependency:

```bash
flutter pub get
```

## Menjalankan Aplikasi

Cek daftar device yang tersedia:

```bash
flutter devices
```

Jalankan aplikasi ke device default:

```bash
flutter run
```

Atau pilih target device tertentu:

```bash
flutter run -d <device_id>
```

Contoh target yang umum dipakai:

```bash
flutter run -d chrome
flutter run -d macos
flutter run -d emulator-5554
```

Untuk Android, pastikan emulator sudah menyala atau device fisik sudah terhubung dengan USB debugging aktif.

Untuk iOS, pastikan simulator sudah menyala atau device fisik sudah terhubung. Jika ada masalah dependency native iOS, jalankan:

```bash
cd ios
pod install
cd ..
```

## Menjalankan Test dan Analisis

Jalankan unit/widget test:

```bash
flutter test
```

Jalankan static analysis:

```bash
flutter analyze
```

## Build Release

Build APK Android:

```bash
flutter build apk --release
```

Build Android App Bundle:

```bash
flutter build appbundle --release
```

Build Web:

```bash
flutter build web --release
```

Build iOS:

```bash
flutter build ios --release
```

Build macOS:

```bash
flutter build macos --release
```

Catatan: build iOS dan macOS membutuhkan konfigurasi signing di Xcode.

## Struktur Project

```text
lib/
  main.dart
  core/
    theme/
  features/
    reverse_number/
      domain/
      presentation/
test/
  features/
  widget_test.dart
assets/
  brand/
```

## Troubleshooting

Jika dependency atau build bermasalah, coba bersihkan project lalu ambil dependency ulang:

```bash
flutter clean
flutter pub get
```

Jika Android gagal build karena Java, pastikan JDK yang aktif adalah JDK 17.

Jika device tidak muncul, jalankan:

```bash
flutter devices
flutter doctor
```

