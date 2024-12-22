import 'package:moto_scroll_app/core/constants/images.dart';
import 'package:moto_scroll_app/data/models/image.dart';

class ImageService {
  List<AppImage> getImages() {
    final imagesList = images
        .map(
          (image) => AppImage.fromJson(image),
        )
        .toList();

    return imagesList;
  }
}
