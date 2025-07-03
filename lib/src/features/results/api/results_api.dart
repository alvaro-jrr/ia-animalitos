import 'dart:convert';

import 'package:ai_animals_lottery/src/core/services/http_service.dart';
import 'package:ai_animals_lottery/src/features/results/models/day_results.dart';

class ResultsApi {
  /// Gets the results of the day.
  static Future<DayResults?> getDayResults() async {
    final response = await HttpService.request(
      '/api/api_animalitos.php',
      method: HttpMethod.get,
      queryParameters: {'tipo': '3'},
      headers: {'Content-Type': 'application/json'},
    );

    if (response == null) return null;

    try {
      final jsonList = jsonDecode(response.body);

      final dayResults = DayResults.fromJson(jsonList);

      return dayResults;
    } catch (e) {
      return null;
    }
  }
}
