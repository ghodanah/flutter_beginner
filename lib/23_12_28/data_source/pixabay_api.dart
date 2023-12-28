import 'dart:convert';
import 'package:http/http.dart' as http;

import '../dto/pixabay_dto.dart';

class PixabayApi {
  Future<PixabayDto> getImagesResult(String query) async {
    final response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=41487127-9f22c05657171bf1375d361f2&q=$query&image_type=photo'));
    return PixabayDto.fromJson(jsonDecode(response.body));
  }
}