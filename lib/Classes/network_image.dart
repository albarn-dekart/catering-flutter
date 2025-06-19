import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:catering_app/Classes/api_config.dart';

class NetworkImageWidget extends StatelessWidget {
  final String filename;
  final double size;

  const NetworkImageWidget({
    super.key,
    required this.filename,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: CachedNetworkImage(
          imageUrl: ApiConfig.image(filename),
          width: size,
          height: size,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            color: Colors.grey[200],
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          errorWidget: (context, url, error) => Container(
            color: Colors.grey[200],
            child: const Icon(Icons.broken_image, size: 50),
          ),
        ));
  }
}
