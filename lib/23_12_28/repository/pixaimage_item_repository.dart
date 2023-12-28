import 'package:untitled/23_12_28/data_source/pixabay_api.dart';
import 'package:untitled/23_12_28/mapper/image_mapper.dart';
import 'package:untitled/23_12_28/model/image_data.dart';
import 'package:untitled/23_12_28/repository/item_repository.dart';

class PixabayImageItemRepository implements ItemRepository {
  final _api = PixabayApi();

  @override
  Future<List<ImageData>> getImageItems(String query) async {
    final dto = await _api.getImagesResult(query);

    if (dto.hits == null) {
      return [];
    }
    return dto.hits!.map((e) => e.toImageData()).toList();
  }

}