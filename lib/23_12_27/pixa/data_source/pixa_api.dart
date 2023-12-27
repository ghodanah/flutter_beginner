import 'dart:convert';

import '../dto/PixaDto.dart';
import 'package:http/http.dart' as http;

class PixaApi {
  Future<PixaDto> getImagesResult(String query) async {
    final response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=41487127-9f22c05657171bf1375d361f2&q=$query&image_type=photo'));
    return PixaDto.fromJson(jsonDecode(response.body));
  }
}