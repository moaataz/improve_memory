import 'package:flutter/material.dart';

class EyeSkimmingScreen extends StatelessWidget {
  const EyeSkimmingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('eye skimming screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 209, 209, 209),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/questions_icon.png',
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'test your reading\nspeed',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          )
        ],
      ),
    );
  }
}
