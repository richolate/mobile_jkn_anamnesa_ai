# Script untuk Build APK Mobile JKN
# Jalankan di PowerShell

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Mobile JKN - APK Build Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Menu pilihan
Write-Host "Pilih jenis build:" -ForegroundColor Yellow
Write-Host "1. Debug APK (untuk testing)" -ForegroundColor White
Write-Host "2. Release APK (untuk production)" -ForegroundColor White
Write-Host "3. Split APK per ABI (ukuran kecil)" -ForegroundColor White
Write-Host "4. App Bundle (untuk Play Store)" -ForegroundColor White
Write-Host ""

$choice = Read-Host "Masukkan pilihan (1-4)"

Write-Host ""
Write-Host "Memulai build..." -ForegroundColor Green
Write-Host ""

switch ($choice) {
    "1" {
        Write-Host "Building Debug APK..." -ForegroundColor Yellow
        flutter build apk --debug
        Write-Host ""
        Write-Host "✓ Debug APK berhasil dibuat!" -ForegroundColor Green
        Write-Host "Lokasi: build\app\outputs\flutter-apk\app-debug.apk" -ForegroundColor Cyan
    }
    "2" {
        Write-Host "Building Release APK..." -ForegroundColor Yellow
        flutter build apk --release
        Write-Host ""
        Write-Host "✓ Release APK berhasil dibuat!" -ForegroundColor Green
        Write-Host "Lokasi: build\app\outputs\flutter-apk\app-release.apk" -ForegroundColor Cyan
    }
    "3" {
        Write-Host "Building Split APK per ABI..." -ForegroundColor Yellow
        flutter build apk --split-per-abi --release
        Write-Host ""
        Write-Host "✓ Split APK berhasil dibuat!" -ForegroundColor Green
        Write-Host "Lokasi: build\app\outputs\flutter-apk\" -ForegroundColor Cyan
        Write-Host "  - app-armeabi-v7a-release.apk (ARM 32-bit)" -ForegroundColor White
        Write-Host "  - app-arm64-v8a-release.apk (ARM 64-bit) - Paling umum" -ForegroundColor White
        Write-Host "  - app-x86_64-release.apk (Intel 64-bit)" -ForegroundColor White
    }
    "4" {
        Write-Host "Building App Bundle..." -ForegroundColor Yellow
        flutter build appbundle --release
        Write-Host ""
        Write-Host "✓ App Bundle berhasil dibuat!" -ForegroundColor Green
        Write-Host "Lokasi: build\app\outputs\bundle\release\app-release.aab" -ForegroundColor Cyan
    }
    default {
        Write-Host "Pilihan tidak valid!" -ForegroundColor Red
        exit
    }
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Cara Install di Smartphone:" -ForegroundColor Yellow
Write-Host "1. Transfer file APK ke smartphone" -ForegroundColor White
Write-Host "2. Buka file APK di smartphone" -ForegroundColor White
Write-Host "3. Izinkan 'Install from Unknown Sources'" -ForegroundColor White
Write-Host "4. Install aplikasi" -ForegroundColor White
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Tanya apakah ingin membuka folder output
$open = Read-Host "Buka folder output? (y/n)"
if ($open -eq "y" -or $open -eq "Y") {
    if ($choice -eq "4") {
        Invoke-Item "build\app\outputs\bundle\release\"
    } else {
        Invoke-Item "build\app\outputs\flutter-apk\"
    }
}
