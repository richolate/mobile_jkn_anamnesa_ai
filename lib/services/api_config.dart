import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConfig {
  // Load environment variables
  static Future<void> initialize() async {
    try {
      await dotenv.load(fileName: ".env");
    } catch (e) {
      print('Warning: Could not load .env file: $e');
      print('Using fallback configuration');
    }
  }

  // Gemini API Key - Loaded from .env file
  // Get your API key from: https://makersuite.google.com/app/apikey
  static String get geminiApiKey {
    return dotenv.env['GEMINI_API_KEY'] ??
        const String.fromEnvironment('GEMINI_API_KEY', defaultValue: '');
  }

  // RAG Server Endpoint - Loaded from .env file
  // Options:
  // 1. Local development: 'http://localhost:8001'
  // 2. Cloud Run: 'https://rag-medical-api-xxxxx.run.app'
  // 3. Railway: 'https://rag-medical-api.railway.app'
  // 4. Vercel: 'https://your-rag-api.vercel.app'
  //
  // FALLBACK: If RAG server unavailable, app will use Gemini AI automatically
  static String get ragServerUrl {
    return dotenv.env['RAG_SERVER_URL'] ??
        const String.fromEnvironment(
          'RAG_SERVER_URL',
          defaultValue: 'http://localhost:8001',
        );
  }

  // Model Configuration
  static String get geminiModel {
    return dotenv.env['GEMINI_MODEL'] ??
        const String.fromEnvironment(
          'GEMINI_MODEL',
          defaultValue: 'gemini-2.0-flash-lite',
        );
  }

  // Timeouts
  static int get apiTimeout {
    final timeout =
        dotenv.env['API_TIMEOUT'] ??
        const String.fromEnvironment('API_TIMEOUT', defaultValue: '120');
    return int.tryParse(timeout) ?? 120;
  }

  static int get ragTimeout {
    final timeout =
        dotenv.env['RAG_TIMEOUT'] ??
        const String.fromEnvironment('RAG_TIMEOUT', defaultValue: '120');
    return int.tryParse(timeout) ?? 120;
  }

  // Image Analysis Configuration
  static const int maxImageSize = 10 * 1024 * 1024; // 10MB
  static const List<String> allowedImageTypes = [
    'image/jpeg',
    'image/jpg',
    'image/png',
    'image/webp',
  ];

  // Validation
  static bool get isConfigured {
    return geminiApiKey.isNotEmpty;
  }

  static String get configStatus {
    if (!isConfigured) {
      return 'ERROR: GEMINI_API_KEY not configured. Please set it in .env file or environment variables.';
    }
    return 'Configuration loaded successfully';
  }
}
