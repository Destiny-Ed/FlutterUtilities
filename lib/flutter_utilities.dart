library flutter_utilities;

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;

/// A Calculator.
class FlutterUtilities {
  ///IMAGE DIMENSION
  /*
   * Generate the width and height dimension from any image
   * (Assets) (Network) (File) (Memory)
   */
  ///USAGE
  /// ```dart
  /// FlutterUtilities().getImageDimension(Image.asset('assets/image.png'),
  ///  requiredWidth : "520", requiredHeight : "200").then((value){
  ///   print(value);
  /// });
  /// [getImage] method
  Future<Map<String, dynamic>> getImageDimension(ImageProvider? image,
      {String? requiredWidth, String? requiredHeight}) async {
    Completer<ui.Image> completer = Completer<ui.Image>();
    image!
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo image, bool _) {
      completer.complete(image.image);
    }));
    ui.Image info = await completer.future;

    String width = info.width.toString();
    String height = info.height.toString();

    if (width == requiredWidth && height == requiredHeight) {
      ///Required Dimension
      final body = {
        'message': 'Image Dimension is $width x $height',
        'status': true
      };
      return body;
    } else {
      final body = {
        'message': 'Image Dimension is $width x $height',
        'status': false
      };
      return body;
    }
  }

  ///TEXT ELIPSIS

  String textEllipsis(String? text, int maxLength, String endText) {
    return text.toString().length > maxLength
        ? '${text.toString().substring(0, maxLength)}$endText'
        : text.toString();
  }

  ///GET STRING INITIAL
  ///

  String getInitialText(String text) {
    if (text == "") {
      return "";
    } else {
      final shorten = text.substring(0, 1).toUpperCase();
      return shorten;
    }
  }

  ///Email validator
  bool isEmailValid(String email) {
    bool isEmailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email); //This variable returns true if email is valid
      //and false if email is not valid

    return isEmailValid;
  }
}

///Capitalize the initial of a text
/// ```dart
/// "Hello".capitalize();
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
