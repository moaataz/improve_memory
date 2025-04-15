import 'package:flutter/material.dart';
import 'package:improve_memory/constants/objects.dart';

class CardItem extends StatefulWidget {
  CardItem({super.key});
  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  final int tileNumber = randomizer.nextInt(20);
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(
          'assets/images/cards/tile${tileNumber.toString().padLeft(3, '0')}.png'),
      width: 50,
    );
  }
}
