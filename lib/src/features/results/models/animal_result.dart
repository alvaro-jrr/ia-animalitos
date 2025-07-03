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

  const AnimalResult({
    required this.lotteryHouseId,
    required this.hour,
    required this.name,
    required this.image,
    required this.number,
  });

  /// Returns an instance from the given [json].
  factory AnimalResult.fromJson(Map<String, dynamic> json) {
    return AnimalResult(
      lotteryHouseId: json['id_loteria'] ?? '',
      hour: json['desc_hora'] ?? '',
      name: json['desc_animal'] ?? '',
      image: json['imagen'] ?? '',
      number: int.parse(json['id_animal'] ?? '0'),
    );
  }
}
