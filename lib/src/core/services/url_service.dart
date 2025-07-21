import 'package:url_launcher/url_launcher.dart';

class UrlService {
  /// The mode to launch a URL.
  static const launchMode = LaunchMode.externalApplication;

  /// Opens a URL.
  static Future<void> openUrl(Uri uri) async {
    await launchUrl(uri, mode: launchMode);
  }

  /// Opens a URL string.
  static Future<void> openUrlString(String url) async {
    final uri = Uri.tryParse(url);

    if (uri == null) return;

    await launchUrl(uri, mode: launchMode);
  }
}
