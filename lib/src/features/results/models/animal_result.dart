class AnimalResult {
  /// The animal number.
  final int number;

  /// The animal name.
  final String name;

  /// The time of the result.
  final DateTime time;

  const AnimalResult({
    required this.number,
    required this.name,
    required this.time,
  });

  /// Returns an instance from the given [json].
  factory AnimalResult.fromJson(Map<String, dynamic> json) {
    return AnimalResult(
      number: json['number'] ?? -1,
      name: json['name'] ?? '',
      time: json['time'] is String
          ? DateTime.tryParse(json['time']) ?? DateTime.now()
          : DateTime.now(),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AnimalResult &&
        other.number == number &&
        other.name == name &&
        other.time == time;
  }

  @override
  int get hashCode => Object.hash(number, name, time);
}
