import 'package:flutter/material.dart';

import 'package:ai_animals_lottery/src/features/results/models/lottery_house.dart';

class ResultListHeader extends StatelessWidget {
  /// The lottery house.
  final LotteryHouse lotteryHouse;

  /// The background color.
  final Color? backgroundColor;

  /// The padding.
  final EdgeInsetsGeometry padding;

  const ResultListHeader({
    super.key,
    required this.lotteryHouse,
    this.backgroundColor,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      color: backgroundColor,
      child: Text(
        lotteryHouse.name,
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}
