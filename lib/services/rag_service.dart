import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_config.dart';

/// RAG (Retrieval-Augmented Generation) Service
/// Handles medical knowledge validation from RAG server
class RagService {
  static final RagService _instance = RagService._internal();
  factory RagService() => _instance;
  RagService._internal();

  /// Query the RAG server for medical knowledge validation
  ///
  /// [query] - The medical query to validate
  /// Returns RAG response with validated medical information
  Future<RagResponse> queryMedicalKnowledge(String query) async {
    try {
      final baseUrl = ApiConfig.ragServerUrl;
      final timeout = Duration(seconds: ApiConfig.ragTimeout);

      // Encode query for URL
      final encodedQuery = Uri.encodeComponent(query);
      final url = Uri.parse('$baseUrl/query?q=$encodedQuery');

      print('🔍 RAG Query: $query');
      print('📡 RAG URL: $url');

      final response = await http.get(url).timeout(timeout);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        print('✅ RAG Response received');

        return RagResponse(
          success: true,
          query: jsonData['query'] ?? query,
          response: jsonData['response'] ?? '',
          sources: _parseSources(jsonData['sources']),
        );
      } else {
        print('❌ RAG Error: ${response.statusCode}');
        return RagResponse(
          success: false,
          query: query,
          response: '',
          errorMessage: 'Server error: ${response.statusCode}',
        );
      }
    } catch (e) {
      print('❌ RAG Exception: $e');
      return RagResponse(
        success: false,
        query: query,
        response: '',
        errorMessage: 'Connection error: $e',
      );
    }
  }

  /// Query RAG for symptoms analysis
  Future<RagResponse> analyzeSymptoms(List<String> symptoms) async {
    final query =
        'Gejala: ${symptoms.join(', ')}. Apa kemungkinan penyakitnya?';
    return queryMedicalKnowledge(query);
  }

  /// Query RAG for anamnesis context
  Future<RagResponse> getAnamnesisContext({
    required String mainComplaint,
    required Map<String, String> patientInfo,
    required List<Map<String, String>> qaHistory,
  }) async {
    // Build comprehensive query
    final buffer = StringBuffer();
    buffer.writeln('Keluhan Utama: $mainComplaint');

    if (patientInfo.isNotEmpty) {
      buffer.writeln(
        'Data Pasien: ${patientInfo.entries.map((e) => '${e.key}: ${e.value}').join(', ')}',
      );
    }

    if (qaHistory.isNotEmpty) {
      buffer.writeln('Riwayat Anamnesis:');
      for (var qa in qaHistory) {
        buffer.writeln('- ${qa['question']}: ${qa['answer']}');
      }
    }

    buffer.writeln(
      'Berdasarkan data di atas, apa diagnosis dan rekomendasi medis?',
    );

    return queryMedicalKnowledge(buffer.toString());
  }

  /// Query RAG for medical image context
  Future<RagResponse> getMedicalImageContext(String imageDescription) async {
    final query =
        'Analisis gambar medis: $imageDescription. Apa kondisi yang terlihat dan rekomendasi medis?';
    return queryMedicalKnowledge(query);
  }

  /// Parse sources from response
  List<String> _parseSources(dynamic sources) {
    if (sources == null) return [];
    if (sources is List) {
      return sources.map((s) => s.toString()).toList();
    }
    return [];
  }

  /// Check if RAG server is available
  Future<bool> isServerAvailable() async {
    try {
      final baseUrl = ApiConfig.ragServerUrl;
      final url = Uri.parse('$baseUrl/query?q=test');

      final response = await http.get(url).timeout(const Duration(seconds: 10));

      return response.statusCode == 200;
    } catch (e) {
      print('RAG Server unavailable: $e');
      return false;
    }
  }
}

/// RAG Response Model
class RagResponse {
  final bool success;
  final String query;
  final String response;
  final List<String> sources;
  final String? errorMessage;

  RagResponse({
    required this.success,
    required this.query,
    required this.response,
    this.sources = const [],
    this.errorMessage,
  });

  /// Check if response has valid medical content
  bool get hasContent => response.isNotEmpty;

  @override
  String toString() {
    return 'RagResponse(success: $success, query: $query, response: ${response.substring(0, response.length > 100 ? 100 : response.length)}...)';
  }
}
