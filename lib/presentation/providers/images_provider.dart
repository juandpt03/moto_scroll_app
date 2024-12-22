import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moto_scroll_app/data/models/image.dart';
import 'package:moto_scroll_app/data/services/image_service.dart';

final imagesServiceProvider = Provider<ImageService>((ref) {
  return ImageService();
});

final imagesProvider = StateNotifierProvider<ImageNotifier, ImageState>((ref) {
  return ImageNotifier(
    ref.read(imagesServiceProvider),
  );
});

class ImageNotifier extends StateNotifier<ImageState> {
  final ImageService _imageService;

  ImageNotifier(this._imageService) : super(ImageState()) {
    getImages();
  }

  void getImages() {
    final images = _imageService.getImages();
    state = state.copyWith(images: images);
    updateCurrentImage(0.0);
  }

  void updateCurrentImage(double scrollFraction) {
    if (state.images.isEmpty) {
      state = state.copyWith(currentImage: null);
      return;
    }

    final frame = (scrollFraction * state.images.length)
        .clamp(0, state.images.length - 1)
        .toInt();
    state = state.copyWith(currentImage: state.images[frame]);
  }
}

class ImageState {
  final List<AppImage> images;
  final AppImage? currentImage;

  ImageState({this.images = const [], this.currentImage});

  ImageState copyWith({
    List<AppImage>? images,
    AppImage? currentImage,
  }) =>
      ImageState(
        images: images ?? this.images,
        currentImage: currentImage ?? this.currentImage,
      );
}
