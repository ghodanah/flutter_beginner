import 'package:untitled/23_12_27/pixa/data_source/pixa_api.dart';
import 'package:untitled/23_12_27/pixa/mapper/pixa_mapper.dart';
import 'package:untitled/23_12_27/pixa/model/image_item.dart';

abstract interface class ImageItemRepository{
  Future<List<ImageItem>> getImageItems(String query);
}

class PixaImageItemRepository implements ImageItemRepository {
  final _api = PixaApi();

  @override
  Future<List<ImageItem>> getImageItems(String query) async {
    final dto = await _api.getImagesResult(query);

    if (dto.hits == null) {
      return [];
    }
    return dto.hits!.map((e) => e.toImageItem()).toList();
  }}