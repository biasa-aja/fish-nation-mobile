import 'dart:developer';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
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

  static Future<XFile?> compressImage(XFile? file) async {
    log("size then : ${await file?.length()}");

    final filePath = file?.path ?? "";
    final lastIndex = filePath.lastIndexOf(RegExp(r'.png|.jp'));
    final splitted = filePath.substring(0, (lastIndex));
    final outPath = "${splitted}_out${filePath.substring(lastIndex)}";

    if (lastIndex == filePath.lastIndexOf(RegExp(r'.png'))) {
      final compressedImage = await FlutterImageCompress.compressAndGetFile(
          filePath, outPath,
          minWidth: 1000,
          minHeight: 1000,
          quality: 70,
          format: CompressFormat.png);

      log("size now : ${await compressedImage?.length()}");

      return compressedImage;
    } else {
      final compressedImage = await FlutterImageCompress.compressAndGetFile(
        filePath,
        outPath,
        minWidth: 1000,
        minHeight: 1000,
        quality: 70,
      );

      log("size now : ${await compressedImage?.length()}");

      return compressedImage;
    }
  }
}
