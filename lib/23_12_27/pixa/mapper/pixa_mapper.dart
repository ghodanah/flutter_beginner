import '../dto/pixa_dto.dart';
import '../model/image_item.dart';

extension PixaDto on Hits {
  ImageItem toImageItem() {
    return ImageItem(
      pageUrl: previewURL ??
          'https://t1.daumcdn.net/movie/93bdeb491de552e11d7ad8a5dbaecc0ff26086bc',
      tags: tags ?? '',
    );
  }
}
