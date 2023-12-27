import 'package:flutter/material.dart';

class ImageItemWidget extends StatelessWidget {
  const ImageItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.network('https://t1.daumcdn.net/movie/93bdeb491de552e11d7ad8a5dbaecc0ff26086bc',
      fit: BoxFit.cover,),
    );
  }
}
