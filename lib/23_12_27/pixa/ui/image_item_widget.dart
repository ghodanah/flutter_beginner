import 'package:flutter/material.dart';
import 'package:untitled/23_12_27/pixa/model/image_item.dart';

class ImageItemWidget extends StatelessWidget {
  final ImageItem imageItem;

  const ImageItemWidget({
    super.key,
    required this.imageItem,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.network(
        imageItem.pageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
