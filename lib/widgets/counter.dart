import 'dart:async';

import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  Counter({super.key, required this.pickedDuration});

  final Duration pickedDuration;

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  late ValueNotifier<Duration> durationNotifier;

  Timer? timer;
  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => countOne());
  }

  Widget buildTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildDigit(hours),
        const Text(
          ':',
          style: TextStyle(fontSize: 40),
        ),
        buildDigit(minutes),
        const Text(
          ':',
          style: TextStyle(fontSize: 40),
        ),
        buildDigit(seconds),
      ],
    );
  }

  @override
  void initState() {
    durationNotifier = ValueNotifier<Duration>(widget.pickedDuration);

    startTimer();
    super.initState();
  }

  void countOne() {
    final seconds = durationNotifier.value.inSeconds - 1;
    if (seconds <= 0) {
    } else {
      setState(() {
        durationNotifier.value = Duration(seconds: seconds);
      });
    }
  }

  Widget buildDigit(String digit) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 50),
      child: Text(
        digit,
        key: ValueKey<String>(digit),
        style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Duration>(
      valueListenable: durationNotifier,
      builder: (ctx, duration, _) => buildTime(duration),
    );
  }
}
