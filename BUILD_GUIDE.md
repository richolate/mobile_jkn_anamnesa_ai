# 🚀 Panduan Build & Install APK

## Langkah-langkah Build APK

### Metode 1: Menggunakan Script (Termudah)

1. **Jalankan build script**
   ```powershell
   .\build_apk.ps1
   ```

2. **Pilih jenis build:**
   - `1` - Debug APK (untuk testing cepat)
   - `2` - Release APK (untuk production)
   - `3` - Split APK per ABI (ukuran lebih kecil) ⭐ **Rekomendasi**
   - `4` - App Bundle (untuk Play Store)

3. **Tunggu hingga selesai**
   - Proses memakan waktu 5-10 menit
   - APK akan tersimpan di folder `build/app/outputs/`

### Metode 2: Manual via Command Line

#### Debug APK (untuk testing)
```powershell
flutter build apk --debug
```
Output: `build/app/outputs/flutter-apk/app-debug.apk` (±40-50 MB)

#### Release APK (optimized untuk production)
```powershell
flutter build apk --release
```
Output: `build/app/outputs/flutter-apk/app-release.apk` (±25-30 MB)

#### Split APK per ABI (paling kecil) ⭐ **Rekomendasi**
```powershell
flutter build apk --split-per-abi --release
```
Menghasilkan 3 file:
- `app-armeabi-v7a-release.apk` (~15 MB) - ARM 32-bit
- `app-arm64-v8a-release.apk` (~18 MB) - ARM 64-bit (Paling umum)
- `app-x86_64-release.apk` (~20 MB) - Intel 64-bit

**Pilih `app-arm64-v8a-release.apk` untuk smartphone modern.**

## Install APK di Smartphone

### Cara 1: Via USB (Langsung dari PC)

1. **Enable Developer Mode di Android**
   - Buka `Settings` → `About phone`
   - Tap `Build number` 7 kali
   - Kembali ke `Settings` → `Developer options`
   - Aktifkan `USB debugging`

2. **Sambungkan smartphone ke PC via USB**

3. **Install langsung**
   ```powershell
   flutter install
   ```
   Atau:
   ```powershell
   adb install build/app/outputs/flutter-apk/app-release.apk
   ```

### Cara 2: Transfer File APK

1. **Copy APK ke smartphone**
   - Via USB: Copy file APK ke folder `Download` di smartphone
   - Via Bluetooth/ShareIt: Kirim file APK
   - Via Cloud: Upload ke Google Drive, download di smartphone

2. **Install APK**
   - Buka file manager di smartphone
   - Cari file APK yang sudah di-copy
   - Tap file APK
   - Jika muncul peringatan, pilih `Settings` → Aktifkan `Install from Unknown Sources`
   - Tap `Install`
   - Tunggu hingga selesai
   - Tap `Open` untuk jalankan aplikasi

### Cara 3: Via Email/WhatsApp

1. **Kirim APK via email/WhatsApp ke diri sendiri**
   
2. **Buka di smartphone**
   - Download attachment APK
   - Install seperti Cara 2

## Troubleshooting

### Build gagal: "Gradle build failed"

```powershell
cd android
.\gradlew clean
cd ..
flutter clean
flutter pub get
flutter build apk --release
```

### APK tidak bisa di-install: "App not installed"

- Uninstall versi lama aplikasi terlebih dahulu
- Pastikan storage smartphone cukup (minimal 100 MB free)
- Coba install ulang

### Aplikasi force close saat dibuka

- Pastikan API key Gemini sudah dikonfigurasi di `lib/services/api_config.dart`
- Cek log error: `adb logcat | Select-String "flutter"`

### Ukuran APK terlalu besar

- Gunakan `--split-per-abi` untuk build APK per architecture
- Ukuran akan berkurang dari ~30MB menjadi ~15-18MB

### Performance lambat

- Pastikan build dengan `--release` bukan `--debug`
- Release build sudah include:
  - Code minification (ProGuard)
  - Resource shrinking
  - Optimasi R8

## Tips Optimasi

### Ukuran APK

✅ Sudah dioptimasi:
- ProGuard/R8 enabled untuk minify code
- Resource shrinking enabled
- Split APK per ABI

### Performance

✅ Sudah dioptimasi:
- Remove debug print statements
- Remove unused debug UI
- Code formatting consistency
- Clean code structure

### Build Time

Untuk build lebih cepat saat development:
```powershell
flutter build apk --debug --target-platform android-arm64
```

## Informasi Build

### Build Configuration

- **minSdkVersion**: 21 (Android 5.0+)
- **targetSdkVersion**: Latest
- **compileSdkVersion**: Latest
- **ProGuard**: Enabled (Release only)
- **Minify**: Enabled (Release only)
- **Shrink Resources**: Enabled (Release only)

### App Details

- **Package Name**: `com.example.mobile_jkn`
- **App Name**: Mobile JKN
- **Version**: 4.14.0
- **Build Number**: 1

### Signing

- Debug build: Signed dengan debug key (otomatis)
- Release build: Signed dengan debug key (untuk development)

**Catatan**: Untuk production di Play Store, perlu membuat signing key sendiri.

## Next Steps

### Untuk Play Store Release

1. **Buat signing key**
   ```powershell
   keytool -genkey -v -keystore mobile-jkn-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias mobile-jkn
   ```

2. **Configure signing di `android/app/build.gradle.kts`**

3. **Build App Bundle**
   ```powershell
   flutter build appbundle --release
   ```

4. **Upload ke Play Console**

### Testing Checklist

Sebelum distribusi, test:
- ✅ Install APK di smartphone fisik
- ✅ Test semua fitur utama (Anamnesis, Analisis Gambar, SoulMed, Riwayat)
- ✅ Test koneksi internet
- ✅ Test permission (camera, storage)
- ✅ Test performance (tidak lag)
- ✅ Test pada berbagai ukuran layar

---

**Happy Coding!** 🎉

Untuk pertanyaan lebih lanjut, lihat `README.md`
