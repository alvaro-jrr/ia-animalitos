class AnimalResult {
  /// The id of the lottery house.
  final int lotteryHouseId;

  /// The animal number.
  final int number;

  /// The animal name.
  final String name;

  /// The time of the result.
  final DateTime time;

  /// The image of the animal.
  final String image;

  const AnimalResult({
    required this.lotteryHouseId,
    required this.number,
    required this.name,
    required this.time,
    required this.image,
  });

  /// Returns an instance from the given [json].
  factory AnimalResult.fromJson(Map<String, dynamic> json) {
    return AnimalResult(
      number: json['number'] ?? -1,
      name: json['name'] ?? '',
      time: json['time'] is String
          ? DateTime.tryParse(json['time']) ?? DateTime.now()
          : DateTime.now(),
      image: json['image'] ?? '',
      lotteryHouseId: json['lottery_house_id'] ?? -1,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AnimalResult &&
        other.number == number &&
        other.name == name &&
        other.time == time &&
        other.image == image &&
        other.lotteryHouseId == lotteryHouseId;
  }

  @override
  int get hashCode => Object.hash(number, name, time, image, lotteryHouseId);
}
