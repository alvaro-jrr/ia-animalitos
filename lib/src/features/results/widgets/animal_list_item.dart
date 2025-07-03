import 'package:flutter/material.dart';

import 'package:ai_animals_lottery/src/app.dart';
import 'package:ai_animals_lottery/src/features/results/models/animal_result.dart';

class AnimalListItem extends StatelessWidget {
  /// The [animal] to display.
  final AnimalResult animal;

  const AnimalListItem({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      contentPadding: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      leading: SizedBox.square(
        dimension: 64.0,
        child: _AnimalImage(animal: animal),
      ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 6.0),
        child: Text(
          animal.isPending ? localization.onStandBy : animal.name,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      subtitle: Row(
        children: [
          if (!animal.isPending) ...[
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
                '#${animal.number}',
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
          Text(animal.hour),
        ],
      ),
    );
  }
}

class _AnimalImage extends StatelessWidget {
  /// The [animal] to display.
  final AnimalResult animal;

  const _AnimalImage({required this.animal});

  @override
  Widget build(BuildContext context) {
    final url = animal.image.trim();

    final defaultImage = animal.isPending
        ? const Icon(Icons.hourglass_empty, size: 32.0)
        : const Icon(Icons.pets, size: 32.0);

    if (url.isEmpty) return defaultImage;

    return Image.network(
      url,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return defaultImage;
      },
    );
  }
}
