// import 'package:flutter/widgets.dart';

// class FlippingCardsViewModel with ChangeNotifier{
//   int cardsLength = 0;
//   bool isStarted = false;
//   void startTimer() {
//     timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {
//         notifier.value = Duration(seconds: notifier.value.inSeconds - 1);
//       });
//       if (notifier.value == Duration.zero) {
//         setState(() {
//           isFlipped = !isFlipped;
//         });
//         timer.cancel();
//       }
//     });
//   }
//   void cardChipButton(int val) {
//       cardsLength = val;
//       isStarted = true;
//     startTimer();
//     notifyListeners();
//   }
// }
