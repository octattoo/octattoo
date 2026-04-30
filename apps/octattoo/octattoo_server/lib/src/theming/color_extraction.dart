import 'dart:typed_data';

import 'package:material_color_utilities/material_color_utilities.dart';

/// Extracts the dominant color from raw ARGB pixel data.
///
/// [pixels] is a flat list of bytes in ARGB order (4 bytes per pixel).
/// Returns an ARGB int of the most prominent color.
Future<int> extractDominantColorFromPixels(
    Uint8List pixels, int width, int height) async {
  final pixelCount = width * height;
  final argbPixels = <int>[];

  for (var i = 0; i < pixelCount; i++) {
    final offset = i * 4;
    final a = pixels[offset];
    final r = pixels[offset + 1];
    final g = pixels[offset + 2];
    final b = pixels[offset + 3];
    argbPixels.add((a << 24) | (r << 16) | (g << 8) | b);
  }

  final result = await QuantizerCelebi().quantize(argbPixels, 1);
  return result.colorToCount.keys.first;
}
