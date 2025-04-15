import 'package:flutter/material.dart';
import 'package:improve_memory/widgets/counter.dart';
import 'package:lottie/lottie.dart';

class FocusScreen extends StatefulWidget {
  const FocusScreen({super.key});

  @override
  State<FocusScreen> createState() => _FocusScreenState();
}

class _FocusScreenState extends State<FocusScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  Duration duration = Duration(minutes: 0);
  final _formKey = GlobalKey<FormState>();
  int minutes = 0;
  int hours = 0;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, lowerBound: 0.0, upperBound: 1.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String get timeInHours {
    if (duration.inHours <= 9) {
      return '0${duration.inHours.toString()}';
    }
    return duration.inHours.toString();
  }

  void startFocusSession() {
    _formKey.currentState!.save();
    if (hours > 0 || minutes > 0) {
      setState(() {
        duration = Duration(hours: hours, minutes: minutes);
        _controller.duration = duration;
        _controller.reverse();
      });
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('start a focus session')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: CircleAvatar(
              radius: 150,
              backgroundColor: const Color.fromARGB(80, 255, 0, 0),
              child: Lottie.asset(
                'assets/animations/focus_animation.lottie.json',
                controller: _controller,
                onLoaded: (compositon) {
                  _controller.value = 20.0;
                },
                backgroundLoading: false,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: duration.inSeconds > 0 ? 55 : 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (duration.inSeconds > 0)
                  Counter(pickedDuration: duration)
                else
                  ElevatedButton(
                    child: Text('start'),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.27,
                            child: Card(
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      spacing: 5,
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          width: 50,
                                          height: 50,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              label: Text('00'),
                                              counterText: '',
                                            ),
                                            keyboardType: TextInputType.number,
                                            onSaved: (val) {
                                              hours =
                                                  int.tryParse(val ?? '0') ?? 0;
                                            },
                                          ),
                                        ),
                                        Text(
                                          ':',
                                          style: TextStyle(fontSize: 35),
                                        ),
                                        Container(
                                          color: Colors.white,
                                          width: 50,
                                          height: 50,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              label: Text('00'),
                                              counterText: '',
                                            ),
                                            maxLength: 2,
                                            keyboardType: TextInputType.number,
                                            onSaved: (val) {
                                              minutes =
                                                  int.tryParse(val ?? '0') ?? 0;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      spacing: 5,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('cancel'),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            startFocusSession();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.deepOrange,
                                            foregroundColor:
                                                const Color.fromARGB(
                                                    255, 255, 237, 232),
                                          ),
                                          child: Text('accept'),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                      // _controller.value = 0.0;
                      // _controller.forward();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
