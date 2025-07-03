class LotteryHouse {
  /// The id of the lottery house.
  final int id;

  /// The name of the lottery house.
  final String name;

  const LotteryHouse({required this.id, required this.name});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LotteryHouse && other.id == id && other.name == name;
  }

  @override
  int get hashCode => Object.hash(id, name);
}
