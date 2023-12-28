import 'package:untitled/23_12_28/model/image_data.dart';

abstract interface class ItemRepository {
  Future<List<ImageData>> getImageItems(String query);
}