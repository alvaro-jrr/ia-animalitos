import 'package:flutter/material.dart';

import 'package:ai_animals_lottery/src/app.dart';
import 'package:ai_animals_lottery/src/core/widgets/animal_image.dart';
import 'package:ai_animals_lottery/src/features/results/models/animal_result.dart';

class AnimalListItem extends StatelessWidget {
  /// The [result] to display.
  final AnimalResult result;

  const AnimalListItem({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final animal = result.animal;

    return ListTile(
      contentPadding: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      leading: AnimalImage(animal: animal, size: 64.0),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 6.0),
        child: Text(
          animal?.name ?? localization.onStandBy,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      subtitle: Row(
        children: [
          if (animal != null) ...[
            // Number.
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 2.0,
              ),
              decoration: ShapeDecoration(
                color: theme.colorScheme.primaryContainer.withValues(
                  alpha: 0.25,
                ),
                shape: StadiumBorder(),
              ),
              child: Text(
                '#${animal.id}',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(width: 8.0),
          ],
          // Time of the result.
          Icon(Icons.schedule, size: 16.0),
          const SizedBox(width: 4.0),
          Text(result.hour),
        ],
      ),
    );
  }
}
