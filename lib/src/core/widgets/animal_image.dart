import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:ai_animals_lottery/src/core/models/animal.dart';

class AnimalImage extends StatelessWidget {
  /// The [animal] to display.
  final Animal? animal;

  /// The [size] of the image.
  final double size;

  const AnimalImage({super.key, required this.animal, required this.size});

  @override
  Widget build(BuildContext context) {
    final url = animal?.imageUrl.trim() ?? '';
    final iconSize = size / 2;

    final defaultImage = animal == null
        ? Icon(Icons.hourglass_empty, size: iconSize)
        : Icon(Icons.pets, size: iconSize);

    if (url.isEmpty) return defaultImage;

    return SizedBox.square(
      dimension: size,
      child: CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.contain,
        placeholder: (context, url) {
          return Skeletonizer(child: defaultImage);
        },
        errorWidget: (context, url, error) => defaultImage,
      ),
    );
  }
}
