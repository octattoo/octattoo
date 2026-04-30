import 'dart:typed_data';

import 'package:test/test.dart';

import 'package:octattoo_server/src/theming/color_extraction.dart';

void main() {
  group('extractDominantColor', () {
    test('returns dominant color from solid-color image', () async {
      // Create a minimal 2x2 PNG-like image that is solid red (0xFFFF0000)
      // Using raw ARGB pixel data for a 2x2 image
      final pixels = Uint8List.fromList([
        // 4 pixels of solid red (ARGB)
        0xFF, 0xFF, 0x00, 0x00,
        0xFF, 0xFF, 0x00, 0x00,
        0xFF, 0xFF, 0x00, 0x00,
        0xFF, 0xFF, 0x00, 0x00,
      ]);

      final color = await extractDominantColorFromPixels(pixels, 2, 2);

      // Should be close to red — quantization may shift slightly
      final r = (color >> 16) & 0xFF;
      final g = (color >> 8) & 0xFF;
      final b = color & 0xFF;
      expect(r, greaterThan(200));
      expect(g, lessThan(50));
      expect(b, lessThan(50));
    });
  });
}
