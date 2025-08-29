import 'package:flutter/material.dart';

class ButtonStyleResource {
  static ButtonStyle a = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(left: Radius.circular(30))));
  static ButtonStyle circularLeftButtonStyle = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(left: Radius.circular(30))));
  static ButtonStyle circularRightButtonStyle = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(30))));
}
