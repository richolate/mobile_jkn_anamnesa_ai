# 🎯 QUICK START GUIDE

## Build APK Sekarang!

### Langkah Tercepat (Rekomendasi)

```powershell
# Jalankan build script
.\build_apk.ps1

# Pilih opsi 3 (Split APK - paling kecil)
# Tunggu 6-8 menit
# APK siap di: build\app\outputs\flutter-apk\
```

### Atau Manual

```powershell
# Build Split APK (ukuran kecil ~15-18MB)
flutter build apk --split-per-abi --release

# APK tersimpan di:
# build\app\outputs\flutter-apk\app-arm64-v8a-release.apk
```

## Install di Smartphone

### Via USB (Tercepat)

1. Enable USB Debugging di smartphone
2. Sambungkan ke PC
3. Run: `flutter install`

### Via Transfer File

1. Copy file APK ke smartphone (Bluetooth/USB/Drive)
2. Buka file APK di smartphone
3. Izinkan "Install from Unknown Sources"
4. Tap Install

## Dokumentasi Lengkap

- 📖 **README.md** - Dokumentasi lengkap aplikasi
- 🚀 **BUILD_GUIDE.md** - Panduan build & install detail
- 🎨 **ICON_SETUP.md** - Setup icon aplikasi
- ✅ **OPTIMIZATION_SUMMARY.md** - Daftar optimasi

## Troubleshooting Cepat

**Build error:**
```powershell
flutter clean
flutter pub get
flutter build apk --release
```

**Install error:**
- Uninstall versi lama
- Pastikan storage cukup (100MB+)

**App crash:**
- Cek API key di `lib/services/api_config.dart`

## File Penting

```
mobile_jkn/
├── build_apk.ps1          ← Script build (jalankan ini!)
├── README.md              ← Baca ini untuk detail
├── BUILD_GUIDE.md         ← Panduan build lengkap
└── OPTIMIZATION_SUMMARY.md ← Daftar optimasi
```

## Konfigurasi API

**PENTING:** Sebelum build, pastikan API key sudah diisi!

Edit `lib/services/api_config.dart`:
```dart
class ApiConfig {
  static const String geminiApiKey = 'YOUR_API_KEY_HERE';
  static const String ragServerUrl = 'http://your-server:8000';
}
```

## Icon Aplikasi

File icon: `assets/icons/mobile_jkn.webp`

Jika ingin ganti icon:
1. Siapkan file icon (512x512 px)
2. Ikuti panduan di `ICON_SETUP.md`

## Optimasi Yang Sudah Dilakukan ✅

- ✅ Code cleanup (21+ debug prints removed)
- ✅ ProGuard enabled (code minification)
- ✅ Resource shrinking enabled
- ✅ Documentation consolidated (18 files → 3 files)
- ✅ App name changed to "Mobile JKN"
- ✅ Build script created
- ✅ APK size optimized (40MB → 15-18MB)

## Semua Fitur Tetap Bekerja ✅

- ✅ Anamnesa AI
- ✅ Analisis Gambar Medis
- ✅ SoulMed (RAG Chatbot)
- ✅ Riwayat Konsultasi
- ✅ Export PDF
- ✅ Cari Dokter Terdekat

---

**Siap untuk build!** 🚀

Jalankan: `.\build_apk.ps1`
