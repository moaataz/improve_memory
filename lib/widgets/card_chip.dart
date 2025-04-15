import 'package:flutter/material.dart';

class CardChip extends StatelessWidget {
  const CardChip({
    super.key,
    required this.cardCount,
    required this.icon,
    required this.onPressed,
  });

  final int cardCount;
  final Widget icon;
  final void Function(int) onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed(cardCount);
      },
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 75,
        alignment: Alignment.center,
        height: 75,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: const Color.fromARGB(255, 161, 161, 161),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              cardCount.toString(),
              style: TextStyle(fontSize: 18),
            ),
            icon,
          ],
        ),
      ),
    );
  }
}
