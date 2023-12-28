import 'package:flutter/material.dart';
import 'package:untitled/23_12_28/model/image_data.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key, required this.imageData});

  final ImageData imageData;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.network(
        imageData.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
