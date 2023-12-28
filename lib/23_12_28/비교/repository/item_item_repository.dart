
import 'package:untitled/23_12_28/%EB%B9%84%EA%B5%90/data_source/pixabay_api.dart';
import 'package:untitled/23_12_28/%EB%B9%84%EA%B5%90/mapper/image_mapper.dart';
import 'package:untitled/23_12_28/%EB%B9%84%EA%B5%90/model/image_item.dart';


abstract interface class ImageItemRepository {
  Future<List<ImageItem>> getImageItems(String query);
}

class PixabayImageItemRepository implements ImageItemRepository {
  final _api = PixabayApi();

  @override
  Future<List<ImageItem>> getImageItems(String query) async {
    final dto = await _api.getImagesResult(query);

    if (dto.hits == null) {
      return [];
    }

    return dto.hits!.map((e) => e.toImageItem()).toList();
  }
}