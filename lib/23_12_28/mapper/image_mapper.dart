import 'package:untitled/23_12_28/dto/pixabay_dto.dart';
import 'package:untitled/23_12_28/model/image_data.dart';

extension PixabayDto on Hits {
  ImageData toImageData() {
    return ImageData(
      imageUrl: previewURL ??
          'https://pixabay.com/api/?key=41487127-9f22c05657171bf1375d361f2&q=사과%EC%82%AC%EA%B3%BC&image_type=photo',
      tags: tags ?? '',
    );
  }
}
