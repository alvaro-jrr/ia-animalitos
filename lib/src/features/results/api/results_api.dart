import 'dart:convert';

import 'package:ai_animals_lottery/src/core/services/http_service.dart';
import 'package:ai_animals_lottery/src/features/results/models/animal_result.dart';

class ResultsApi {
  /// Gets the results of the day.
  static Future<List<AnimalResult>?> getResults({bool fromToday = true}) async {
    final response = await HttpService.request(
      '/api/api_animalitos.php',
      method: HttpMethod.get,
      queryParameters: {'tipo': '3', if (!fromToday) 'dia': '2'},
      headers: {'Content-Type': 'application/json'},
    );

    if (response == null) return null;

    try {
      final jsonList = jsonDecode(response.body);

      final results = (jsonList as List)
          .map((e) => AnimalResult.fromJson(e))
          .toList();

      return results;
    } catch (e) {
      return null;
    }
  }
}
