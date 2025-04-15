import 'package:flutter/material.dart';
import 'package:improve_memory/constants/objects.dart';
import 'package:math_expressions/math_expressions.dart';

class MathCalculationScreen extends StatefulWidget {
  const MathCalculationScreen({super.key});
  @override
  State<MathCalculationScreen> createState() => _MathCalculationScreenState();
}

String degree = '99';

class _MathCalculationScreenState extends State<MathCalculationScreen> {
  // final List<num> numbers = [];
  String operator = '+';
  String result = '';
  // {
  //   if (numbers.isEmpty) {
  //     return '';
  //   }
  //   var collectedResult = '';
  //   for (var i in numbers) {
  //     collectedResult += '$i$operator';
  //   }

  //   collectedResult = collectedResult.substring(0, collectedResult.length - 1);
  //   return collectedResult;
  // }

  final List<String> lowPriorityOperators = ['+', '-'];
  final List<String> highPriorityOperators = ['x', '/'];

  String calculate(String result) {
    ExpressionParser p = GrammarParser();
    Expression exp = p.parse(result.replaceAll('x', '*'));
    ContextModel cm = ContextModel();

    final resultDouble = exp.evaluate(EvaluationType.REAL, cm) as double;
    return resultDouble.toStringAsFixed(2);
  }

  var key = ValueKey(false);

  @override
  void dispose() {
    degree = '99';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('math question screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(children: [
                  Container(
                    alignment: Alignment.center,
                    color: const Color.fromARGB(255, 125, 196, 255),
                    height: 100,
                    width: 230,
                    child: Text(
                      result,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          result = '';
                        });
                      },
                      icon: Icon(Icons.refresh))
                ]),
                Column(
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            result = calculate(result);
                          });
                        },
                        child: Text('calculate')),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            key = ValueKey(!key.value);
                          });
                        },
                        child: Text('scramble'))
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          if (degree == '9999') {
                            return;
                          }
                          setState(() {
                            degree += '9';
                            key = ValueKey(!key.value);
                          });
                        },
                        icon: Icon(Icons.arrow_upward)),
                    Text(degree),
                    IconButton(
                        onPressed: () {
                          if (degree == '9') {
                            return;
                          }
                          setState(() {
                            degree = degree.substring(0, degree.length - 1);
                            key = ValueKey(!key.value);
                          });
                        },
                        icon: Icon(Icons.arrow_downward))
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        operator = '+';
                      });
                    },
                    icon: Text(
                      '+',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        operator = '-';
                      });
                    },
                    icon: Text(
                      '-',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        operator = 'x';
                      });
                    },
                    icon: Text(
                      'x',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        operator = '/';
                      });
                    },
                    icon: Text(
                      '/',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  Spacer(),
                  Text(
                    'operator: $operator',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            NumbersGrid(
              addNumber: (number) {
                setState(() {
                  result += result.isEmpty ? '$number' : '$operator$number';
                });
              },
              key: key,
              degree: int.parse(degree),
            ),
          ],
        ),
      ),
    );
  }
}

class NumbersGrid extends StatefulWidget {
  const NumbersGrid({
    super.key,
    required this.addNumber,
    required this.degree,
  });
  final int degree;
  final void Function(num) addNumber;

  @override
  State<NumbersGrid> createState() => _NumbersGridState();
}

class _NumbersGridState extends State<NumbersGrid> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 4,
        children: [
          for (int i = 0; i < 4; i++)
            for (int i = 0; i < 8; i++)
              NumberButton(
                addNumber: widget.addNumber,
              ),
        ],
      ),
    );
  }
}

class NumberButton extends StatefulWidget {
  const NumberButton({
    super.key,
    required this.addNumber,
  });
  final void Function(int) addNumber;

  @override
  State<NumberButton> createState() => _NumberButtonState();
}

class _NumberButtonState extends State<NumberButton> {
  int number = 0;
  @override
  void initState() {
    final degreeInt = int.parse(degree);
    final randomNumber =
        faker.randomGenerator.integer(degreeInt, min: (degreeInt ~/ 10) + 1);
    number = randomNumber;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => widget.addNumber(number),
      icon: Text(number.toString()),
    );
  }
}
