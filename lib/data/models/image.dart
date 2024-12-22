import 'dart:convert';
import 'dart:typed_data';

class AppImage {
  final String id;
  final int width;
  final int height;
  final Uint8List imageBytes;

  AppImage({
    required this.id,
    required this.width,
    required this.height,
    required this.imageBytes,
  });

  factory AppImage.fromJson(
    Map<String, dynamic> json,
  ) {
    final bytes = base64Decode(json["p"].split(',')[1]);
    return AppImage(
      id: json["id"],
      width: json["w"],
      height: json["h"],
      imageBytes: bytes,
    );
  }
}
