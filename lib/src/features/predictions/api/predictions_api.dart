import 'dart:convert';

import 'package:ai_animals_lottery/src/core/services/http_service.dart';
import 'package:ai_animals_lottery/src/features/predictions/models/prediction.dart';

class PredictionsApi {
  /// Gets the predictions of the day.
  static Future<List<Prediction>> getPredictions() async {
    final response = await HttpService.request(
      '/api/api_animalitos.php',
      method: HttpMethod.get,
      queryParameters: {'tipo': '2'},
      headers: {'Content-Type': 'application/json'},
    );

    if (response == null) return [];

    try {
      final jsonList = jsonDecode(response.body);

      final predictions = jsonList is List
          ? jsonList.map((json) => Prediction.fromJson(json)).toList()
          : <Prediction>[];

      return predictions;
    } catch (e) {
      return [];
    }
  }
}
