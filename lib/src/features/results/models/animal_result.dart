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

  /// The image path.
  final String imagePath;

  /// The image URL.
  final String imageUrl;

  /// Whether the result is pending.
  final bool isPending;

  const AnimalResult({
    required this.lotteryHouseId,
    required this.hour,
    required this.name,
    required this.imagePath,
    required this.imageUrl,
    required this.number,
    this.isPending = false,
  });

  /// Returns an instance from the given [json].
  factory AnimalResult.fromJson(Map<String, dynamic> json) {
    String imageUrl = '';
    final lotteryHouseId = json['id_loteria'] ?? '';
    final imagePath = json['imagen'] ?? '';

    // Build the image URL.
    if (imagePath.isNotEmpty) {
      imageUrl = Uri.https(
        FlavorSettings.instance.values.baseApiUrl,
        '/imagenes/$lotteryHouseId/$imagePath',
      ).toString();
    }

    return AnimalResult(
      lotteryHouseId: lotteryHouseId,
      hour: json['desc_hora'] ?? '',
      name: json['desc_animal'] ?? '',
      imagePath: imagePath,
      imageUrl: imageUrl,
      number: json['id_animal'] is String
          ? int.tryParse(json['id_animal']) ?? 0
          : 0,
      isPending: json['id_animal'] == null,
    );
  }
}
