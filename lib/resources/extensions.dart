import 'package:flutter/material.dart';

extension S40Image on Image {
  static Image asset(String asset) {
    return Image.asset(
      asset,
      width: 40,
      height: 40,
    );
  }
}

extension S50Image on Image {
  static Image asset(String asset) {
    return Image.asset(
      asset,
      width: 50,
      height: 50,
    );
  }
}

extension S100Image on Image {
  static Image asset(String asset) {
    return Image.asset(
      asset,
      width: 100,
      height: 100,
    );
  }
}

extension MediaQueryShortCut on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}
