import 'package:http/http.dart' as http;

import 'package:ai_animals_lottery/src/core/utils/flavor_settings.dart';

/// The HTTP methods.
enum HttpMethod { get, post, put, delete, patch }

class HttpService {
  /// Performs a request to the given [endpoint].
  static Future<http.Response?> request(
    String endpoint, {
    required HttpMethod method,
    String? baseUrl,
    Map<String, String>? headers,
    Object? body,
  }) async {
    // Build the URL.
    final url = Uri.https(
      baseUrl ?? FlavorSettings.instance.values.baseApiUrl,
      endpoint,
    );

    final response = _executeRequest(
      url: url,
      method: method,
      headers: headers,
      body: body,
    );

    return response;
  }

  /// Executes the request.
  static Future<http.Response?> _executeRequest({
    required Uri url,
    required HttpMethod method,
    Map<String, String>? headers,
    Object? body,
  }) async {
    try {
      return switch (method) {
        HttpMethod.get => await http.get(url, headers: headers),
        HttpMethod.post => await http.post(url, headers: headers, body: body),
        HttpMethod.put => await http.put(url, headers: headers, body: body),
        HttpMethod.delete => await http.delete(url, headers: headers),
        HttpMethod.patch => await http.patch(url, headers: headers, body: body),
      };
    } catch (e) {
      return null;
    }
  }
}
