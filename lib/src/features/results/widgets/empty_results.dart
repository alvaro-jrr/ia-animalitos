import 'package:flutter/material.dart';

class EmptyResults extends StatelessWidget {
  /// The description to display when there are no results.
  final String description;

  /// The text to display on the retry button.
  final String retryText;

  /// The callback to call when the retry button is pressed.
  final VoidCallback onRetry;

  const EmptyResults({
    super.key,
    required this.description,
    required this.retryText,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(description),
        const SizedBox(height: 16),
        FilledButton(onPressed: onRetry, child: Text(retryText)),
      ],
    );
  }
}
