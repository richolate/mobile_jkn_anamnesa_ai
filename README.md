# Mobile JKN – AI-Powered Health Companion

A mobile health application built with **Flutter** that integrates **AI-driven anamnesis**, **medical image analysis**, and a **RAG-based health chatbot**. Designed to enhance early detection, streamline self-assessment, and support users with credible medical insights.

---

## 🚀 Quick Start

### **Prerequisites**
- Flutter SDK 3.32.5+
- Dart SDK 3.8.1+
- Google Gemini API Key — Obtain from: https://makersuite.google.com/app/apikey

### **Installation**
```bash
git clone https://github.com/richolate/mobile_jkn_anamnesi_ai.git
cd mobile_jkn_anamnesa_ai

flutter pub get

cp .env.example .env


flutter run
```

---

## 📱 Features

### **🤖 AI Anamnesis System**
- Smart question flow (6–18 questions)
- Automatic symptom interpretation
- Medical recommendations & red flags
- Export anamnesis result to PDF

### **🔬 Medical Image Analysis**
- Supports X-ray, MRI, CT scan, and other medical images
- Vision analysis using Google Gemini
- Abnormality detection with explanations
- PDF report generation with annotated results

### **💬 SoulMed – RAG Health Chatbot**
- Conversational Q&A with Retrieval-Augmented Generation
- Reliable health information
- Stored chat history
- Connects to custom RAG backend server

### **📝 Consultation History**
- View all previous anamnesis and medical-image analyses
- Reopen and export reports
- Delete consultation records

---

## 🛠 Tech Stack

| Category | Technology |
|---------|------------|
| Framework | Flutter 3.32.5 |
| Language | Dart 3.8.1 |
| AI Engine | Google Gemini (Text & Vision) + RAG Validation |
| RAG Server | Custom Medical Knowledge Base |
| Database | SQLite (mobile) + SharedPreferences (web) |
| PDF Engine | `pdf` package |
| Image Processing | `image_picker` |
| Environment Config | flutter_dotenv |

### AI Architecture
```
User Input → RAG Server (Validation) → Gemini AI (Elaboration) → Final Output
```
- **RAG Server**: Validates medical information from knowledge base
- **Gemini AI**: Elaborates and explains validated information
- **Fallback**: If RAG unavailable, uses Gemini directly

### Core Dependencies
```yaml
dependencies:
  google_generative_ai: ^0.2.3
  sqflite: ^2.3.0
  shared_preferences: ^2.2.2
  pdf: ^3.11.1
  flutter_dotenv: ^5.2.1
  image_picker: ^1.0.7
  share_plus: ^10.1.2
```

---

## 📂 Project Structure
```
lib/
├── main.dart
├── models/
├── screens/
├── services/
├── widgets/
└── utils/
```
A clean and modular architecture separating logic, UI, database, AI services, and helpers.

---

## 🚧 Build & Deployment

### Android
```bash
flutter build apk --release
flutter build apk --split-per-abi --release
```

### Web (Vercel)

**Local Build:**
```bash
flutter build web --release \
  --dart-define=GEMINI_API_KEY="your_key" \
  --dart-define=RAG_SERVER_URL="http://localhost:8001"
```

**Vercel Deployment:**

1. **Set Environment Variables** di Vercel Dashboard:
   - Go to: Project → Settings → Environment Variables
   - Add variables (pilih **All** environments):
     - `GEMINI_API_KEY` (required) ← Your API key
     - `RAG_SERVER_URL` (optional)
     - `GEMINI_MODEL` (optional)

2. **Push ke GitHub:**
   ```bash
   git push origin master
   ```

3. **Vercel auto-deploy** menggunakan `scripts/vercel-build.sh`

⚠️ **PENTING:** Environment variables di Vercel akan di-compile ke dalam JavaScript menggunakan `--dart-define`

---

## 🔧 Configuration

### Environment Variables (`.env`)
```env
GEMINI_API_KEY=your_api_key_here
RAG_SERVER_URL=your_rag_server_url_here
GEMINI_MODEL=gemini-2.0-flash-lite
API_TIMEOUT=120
RAG_TIMEOUT=120
```
⚠️ File `.env` untuk **local development only** - tidak di-commit ke Git

### Vercel Environment Variables
Set these in Vercel Dashboard → Project → Settings → Environment Variables:
- `GEMINI_API_KEY` (required) ← Your Gemini API key
- `RAG_SERVER_URL` (required) ← Your RAG server URL
- `GEMINI_MODEL` (optional) ← Default: `gemini-2.0-flash-lite`
- `API_TIMEOUT` (optional) ← Default: `120`
- `RAG_TIMEOUT` (optional) ← Default: `120`

### Android Network Permissions
```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
<application android:usesCleartextTraffic="true" />
```

---

## 🐛 Troubleshooting

**Build Issues**
```bash
flutter clean
flutter pub get
```

**API Errors**
- Verify API key
- Check internet connection
- Regenerate API key if necessary

**Blank/Gray Screen di Web (Vercel)**

Jika halaman menampilkan layar kosong abu-abu:

1. **Check Environment Variables di Vercel:**
   - Pastikan `GEMINI_API_KEY` sudah di-set
   - Pilih scope **Production + Preview + Development**

2. **Check Browser Console (F12):**
   - Look for error: `GEMINI_API_KEY is empty`
   - Look for error: `Failed to load .env`
   - Network errors ke Google API

3. **Redeploy dari Vercel:**
   - Go to Deployments → Latest → ⋯ → Redeploy

4. **Verify Build Logs:**
   ```
   ✅ Creating .env file from environment variables...
   ✅ Building web with environment variables...
   ✅ GEMINI_API_KEY=AIza... (first 4 chars shown)
   ```

5. **Clear Cache:**
   - Browser: Ctrl+Shift+Delete
   - Vercel: Settings → Git → Clear Build Cache

---

## 🧪 Development
```bash
dart format .
flutter analyze
flutter test
```

### Commit Convention
- `feat:` new feature
- `fix:` bug fix
- `refactor:` code rework
- `docs:` documentation
- `perf:` performance improvements
- `style:` UI/UX adjustments

---

## 📄 Additional Docs
- `.env.example` – Environment template
- `FIX_SUMMARY.md` – Build & version notes

---

## 📌 License
This project is licensed under the MIT License.

---

For improvements, optimizations, or a more advanced GitHub presentation (badges, release notes, CI/CD setup), feel free to request!