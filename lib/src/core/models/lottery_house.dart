class LotteryHouse {
  /// The id of the lottery house.
  final String id;

  /// The name of the lottery house.
  final String name;

  const LotteryHouse({required this.id, required this.name});

  /// Returns an instance from the given [json].
  factory LotteryHouse.fromJson(Map<String, dynamic> json) {
    return LotteryHouse(
      id: json['id_loteria'] ?? '',
      name: json['desc_loteria'] ?? '',
    );
  }

  /// Converts this object to a JSON object.
  Map<String, dynamic> toJson() {
    return {'id_loteria': id, 'desc_loteria': name};
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LotteryHouse && other.id == id && other.name == name;
  }

  @override
  int get hashCode => Object.hash(id, name);
}
