import 'package:ai_animals_lottery/src/core/utils/flavor_settings.dart';

class AnimalResult {
  /// The id of the lottery house.
  final String lotteryHouseId;

  /// The number of the animal.
  final int number;

  /// The hour of the results.
  final String hour;

  /// The animal name.
  final String name;

  /// The image of the animal.
  final String image;

  /// Whether the result is pending.
  final bool isPending;

  const AnimalResult({
    required this.lotteryHouseId,
    required this.hour,
    required this.name,
    required this.image,
    required this.number,
    this.isPending = false,
  });

  /// Returns an instance from the given [json].
  factory AnimalResult.fromJson(Map<String, dynamic> json) {
    String image = '';
    final lotteryHouseId = json['id_loteria'] ?? '';

    // Build the image URL.
    if (json['imagen'] is String) {
      image = Uri.https(
        FlavorSettings.instance.values.baseApiUrl,
        '/imagenes/$lotteryHouseId/${json['imagen']}',
      ).toString();
    }

    return AnimalResult(
      lotteryHouseId: lotteryHouseId,
      hour: json['desc_hora'] ?? '',
      name: json['desc_animal'] ?? '',
      image: image,
      number: json['id_animal'] is String
          ? int.tryParse(json['id_animal']) ?? 0
          : 0,
      isPending: json['id_animal'] == null,
    );
  }
}
