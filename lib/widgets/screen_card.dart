import 'package:flutter/material.dart';

class ScreenCard extends StatelessWidget {
  const ScreenCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onPressed,
  });
  final String imagePath;
  final String title;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Card(
          color: Colors.grey[350],
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5,
            children: [
              Image.asset(imagePath, scale: 10),
              SizedBox(
                width: double.infinity,
                child: Text(
                  title,
                  style: TextStyle(fontSize: 25, color: Colors.brown),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Material(
            child: InkWell(
              onTap: onPressed,
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.transparent,
          ),
        ),
      ],
    );
  }
}
