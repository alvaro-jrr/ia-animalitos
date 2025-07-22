import 'package:ai_animals_lottery/src/core/utils/flavor_settings.dart';

class Animal {
  /// The id of the animal.
  final String id;

  /// The id of the lottery house.
  final String lotteryHouseId;

  /// The animal name.
  final String name;

  /// The image URL.
  final String imageUrl;

  const Animal({
    required this.id,
    required this.lotteryHouseId,
    required this.name,
    required this.imageUrl,
  });

  /// Returns an [Animal] from the given [json].
  factory Animal.fromJson(Map<String, dynamic> json) {
    final id = json['id_animal'] ?? '';
    final lotteryHouseId = json['id_loteria'] ?? '';

    return Animal(
      id: id,
      lotteryHouseId: lotteryHouseId,
      name: json['desc_animal'] ?? '',
      imageUrl: Uri.https(
        FlavorSettings.instance.values.baseApiUrl,
        '/imagenes/$lotteryHouseId/$id.png',
      ).toString(),
    );
  }

  /// Converts this object to a JSON object.
  Map<String, dynamic> toJson() {
    return {'id_animal': id, 'id_loteria': lotteryHouseId, 'desc_animal': name};
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Animal &&
        other.id == id &&
        other.lotteryHouseId == lotteryHouseId &&
        other.name == name &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode => Object.hash(id, lotteryHouseId, name, imageUrl);
}
