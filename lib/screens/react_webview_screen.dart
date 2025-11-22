import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../utils/app_theme.dart';

/// Screen untuk menampilkan konten React menggunakan WebView
/// File ini adalah contoh implementasi untuk integrasi React di masa depan
class ReactWebViewScreen extends StatefulWidget {
  final String title;
  final String url;

  const ReactWebViewScreen({super.key, required this.title, required this.url});

  @override
  State<ReactWebViewScreen> createState() => _ReactWebViewScreenState();
}

class _ReactWebViewScreenState extends State<ReactWebViewScreen> {
  InAppWebViewController? webViewController;
  double progress = 0;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
        backgroundColor: AppTheme.primaryBlue,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              webViewController?.reload();
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri(widget.url)),
            initialSettings: InAppWebViewSettings(
              useShouldOverrideUrlLoading: true,
              mediaPlaybackRequiresUserGesture: false,
              allowsInlineMediaPlayback: true,
              // Enable JavaScript
              javaScriptEnabled: true,
              // Enable DOM Storage
              domStorageEnabled: true,
              // Enable Database
              databaseEnabled: true,
              // Allow mixed content
              mixedContentMode: MixedContentMode.MIXED_CONTENT_ALWAYS_ALLOW,
            ),
            onWebViewCreated: (controller) {
              webViewController = controller;

              // Setup JavaScript handler untuk komunikasi dengan React
              controller.addJavaScriptHandler(
                handlerName: 'flutterHandler',
                callback: (args) {
                  return {'status': 'success', 'data': 'Data from Flutter'};
                },
              );
            },
            onLoadStart: (controller, url) {
              setState(() {
                isLoading = true;
              });
            },
            onLoadStop: (controller, url) async {
              setState(() {
                isLoading = false;
              });

              // Inject JavaScript untuk setup komunikasi
              await controller.evaluateJavascript(
                source: '''
                // Setup window.flutter object untuk komunikasi
                window.flutter = {
                  postMessage: function(message) {
                    window.flutter.callHandler('flutterHandler', message);
                  }
                };
                
                // Notify React app bahwa Flutter bridge sudah ready
                if (window.dispatchEvent) {
                  window.dispatchEvent(new Event('flutterReady'));
                }
              ''',
              );
            },
            onProgressChanged: (controller, progress) {
              setState(() {
                this.progress = progress / 100;
              });
            },
            onConsoleMessage: (controller, consoleMessage) {},
          ),

          // Loading indicator
          if (isLoading)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppTheme.primaryBlue,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Loading ${(progress * 100).toInt()}%',
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),

          // Progress bar
          if (progress < 1.0)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey[200],
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppTheme.primaryBlue,
                ),
              ),
            ),
        ],
      ),

      // Floating action button untuk testing komunikasi
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Send message ke React app
          await webViewController?.evaluateJavascript(
            source:
                '''
            // Trigger event di React app
            if (window.receiveFlutterMessage) {
              window.receiveFlutterMessage({
                type: 'FLUTTER_MESSAGE',
                payload: {
                  message: 'Hello from Flutter!',
                  timestamp: ${DateTime.now().millisecondsSinceEpoch}
                }
              });
            }
          ''',
          );

          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Message sent to React app'),
                duration: Duration(seconds: 2),
              ),
            );
          }
        },
        backgroundColor: AppTheme.primaryBlue,
        child: const Icon(Icons.send, color: Colors.white),
      ),
    );
  }
}
