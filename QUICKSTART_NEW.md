# 🚀 Quick Start Guide

## Setup dalam 5 Menit

### 1️⃣ Clone & Install (1 menit)
```bash
git clone <repository-url>
cd mobile_jkn_anamnesa_ai
flutter pub get
```

### 2️⃣ Setup API Key (2 menit)
```bash
# Copy template
cp .env.example .env

# Edit .env dan masukkan API Key Anda
# Dapatkan API key di: https://makersuite.google.com/app/apikey
```

File `.env`:
```env
GEMINI_API_KEY=AIzaSy...  ← Paste API key Anda di sini
RAG_SERVER_URL=http://localhost:8001
```

### 3️⃣ Run Aplikasi (2 menit)
```bash
flutter run
```

✅ **Sukses jika muncul:** `Configuration loaded successfully`

---

## 📱 Test di Smartphone

### Android via USB:
```bash
# Enable USB Debugging di smartphone
# Hubungkan ke PC via USB
flutter run
```

### Android via WiFi:
```bash
# Di smartphone, enable Wireless Debugging
adb tcpip 5555
adb connect <IP_SMARTPHONE>:5555
flutter run
```

### Build APK:
```bash
flutter build apk --release
# APK ada di: build/app/outputs/flutter-apk/
```

---

## 🌐 Deploy ke Vercel

### Setup (Satu kali saja):
```bash
# Install Vercel CLI
npm i -g vercel

# Login
vercel login

# Set environment variables
vercel env add GEMINI_API_KEY
# Paste API key: AIzaSy...

vercel env add RAG_SERVER_URL
# Paste: https://your-rag-server.com
```

### Deploy:
```bash
vercel --prod
```

---

## ⚡ Perintah Berguna

```bash
# Clean build
flutter clean && flutter pub get

# Run dengan verbose
flutter run -v

# Build APK debug
flutter build apk --debug

# Build APK release
flutter build apk --release

# Build untuk web
flutter build web --release

# Check errors
flutter analyze

# Format code
flutter format .
```

---

## 🐛 Troubleshooting Cepat

### Error: "GEMINI_API_KEY not configured"
```bash
# Pastikan file .env ada dan berisi API key
cat .env

# Restart app setelah edit .env
flutter clean
flutter run
```

### Error: "Failed host lookup"
- Periksa koneksi internet
- Ganti DNS ke 8.8.8.8
- Coba pakai mobile data

### Error: "MissingPluginException"
- Terjadi di web platform
- Sudah diperbaiki dengan conditional imports
- Lihat: WEB_PLATFORM_FIX.md

---

## 📚 Dokumentasi Lengkap

- [ENV_SETUP.md](ENV_SETUP.md) - Setup environment variables lengkap
- [TROUBLESHOOTING_SOCKET_ERROR.md](TROUBLESHOOTING_SOCKET_ERROR.md) - Fix error network
- [WEB_PLATFORM_FIX.md](WEB_PLATFORM_FIX.md) - Fix error web platform
- [README.md](README.md) - Dokumentasi utama

---

## ✅ Checklist

Sebelum mulai development:

- [ ] Flutter SDK sudah terinstall (`flutter --version`)
- [ ] File `.env` sudah dibuat dan berisi API key
- [ ] `flutter pub get` berhasil
- [ ] `flutter run` tidak ada error
- [ ] Console menampilkan "Configuration loaded successfully"
- [ ] Test di smartphone berhasil

Sebelum deploy:

- [ ] Build web berhasil (`flutter build web --release`)
- [ ] Environment variables sudah diset di Vercel
- [ ] Test di Vercel preview URL
- [ ] Semua fitur berfungsi normal

---

## 🎉 Selesai!

Anda siap mulai development! Happy coding! 🚀

**Next Steps:**
1. Explore fitur-fitur yang ada
2. Test di smartphone
3. Customize sesuai kebutuhan
4. Deploy ke production

Need help? Check dokumentasi lengkap atau buka issue di repository.
