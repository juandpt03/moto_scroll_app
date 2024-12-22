import 'package:flutter/material.dart';
import 'package:moto_scroll_app/data/models/image.dart';

class BackgroundImage extends StatelessWidget {
  final AppImage currentImage;

  const BackgroundImage({
    required this.currentImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.memory(
        currentImage.imageBytes,
        fit: BoxFit.cover,
        gaplessPlayback: true,
      ),
    );
  }
}
