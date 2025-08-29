import 'package:flutter/material.dart';

class FlippingCardButtonText extends StatelessWidget {
  const FlippingCardButtonText(
      {required this.remainingSeconds, required this.allFlipped, super.key});
  final int remainingSeconds;
  final bool allFlipped;
  @override
  Widget build(BuildContext context) {
    return Text(
      remainingSeconds == 0
          ? allFlipped
              ? 'restart'
              : 'show'
          : remainingSeconds.toString(),
    );
  }
}
