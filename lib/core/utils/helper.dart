import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

class Helper {
  static double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double deviceWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static Uint8List imageToByteListFloat32(
      img.Image image, int inputSize, double mean, double std) {
    var convertedBytes = Float32List(1 * inputSize * inputSize * 3);
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;
    // for (var i = 0; i < inputSize; i++) {
    //   for (var j = 0; j < inputSize; j++) {
    //     var pixel = image.getPixel(j, i);
    //     buffer[pixelIndex++] = (img.getRed(pixel) - mean) / std;
    //     buffer[pixelIndex++] = (img.getGreen(pixel) - mean) / std;
    //     buffer[pixelIndex++] = (img.getBlue(pixel) - mean) / std;
    //   }
    // }
    return convertedBytes.buffer.asUint8List();
  }
}
