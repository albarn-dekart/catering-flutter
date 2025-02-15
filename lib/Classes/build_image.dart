import 'package:flutter/material.dart';

Widget buildImage(String? imageFile, double size) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(8.0),
    child: imageFile != null
        ? Image.asset(
            'images/$imageFile',
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.broken_image, size: 50),
            width: size,
            height: size,
            fit: BoxFit.cover,
          )
        : Container(
            width: size,
            height: size,
            color: Colors.grey[200],
            child: const Icon(Icons.fastfood, size: 50),
          ),
  );
}
