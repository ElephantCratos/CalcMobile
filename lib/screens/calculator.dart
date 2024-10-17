import 'package:flutter/material.dart';
import 'package:namer_app/widgets/operation_button.dart';
import '../services/calc_logic.dart';
import '../widgets/number_button.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  CalculatorScreenState createState() => CalculatorScreenState();
}

class CalculatorScreenState extends State<CalculatorScreen> {
  String output = "0";
  String expression = "";
  CalcLogic calcLogic = CalcLogic();

  void _onButtonPressed(String buttonText) {
    setState(() {
      output = calcLogic.handleInput(buttonText);
      expression = calcLogic.getExpression();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Калькулятор'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(12),
              alignment: Alignment.bottomRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    expression,
                    style: TextStyle(fontSize: 24, color: Colors.grey),
                  ),
                  Text(
                    output,
                    style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () => _onButtonPressed("C"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFF4040),
                        padding: EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: Text(
                        "C",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  child: OperationButton(
                    text: "**",
                    onPressed: () => _onButtonPressed("**"),
                  ),
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                NumberButton(
                  text: "7",
                  onPressed: () => _onButtonPressed("7"),
                ),
                NumberButton(
                  text: "8",
                  onPressed: () => _onButtonPressed("8"),
                ),
                NumberButton(
                  text: "9",
                  onPressed: () => _onButtonPressed("9"),
                ),
                OperationButton(
                  text: "/",
                  onPressed: () => _onButtonPressed("/"),
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                NumberButton(
                  text: "4",
                  onPressed: () => _onButtonPressed("4"),
                ),
                NumberButton(
                  text: "5",
                  onPressed: () => _onButtonPressed("5"),
                ),
                NumberButton(
                  text: "6",
                  onPressed: () => _onButtonPressed("6"),
                ),
                OperationButton(
                  text: "*",
                  onPressed: () => _onButtonPressed("*"),
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                NumberButton(
                  text: "1",
                  onPressed: () => _onButtonPressed("1"),
                ),
                NumberButton(
                  text: "2",
                  onPressed: () => _onButtonPressed("2"),
                ),
                NumberButton(
                  text: "3",
                  onPressed: () => _onButtonPressed("3"),
                ),
                OperationButton(
                  text: "-",
                  onPressed: () => _onButtonPressed("-"),
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                NumberButton(
                  text: "0",
                  onPressed: () => _onButtonPressed("0"),
                ),
                NumberButton(
                  text: ".",
                  onPressed: () => _onButtonPressed("."),
                ),
                OperationButton(
                  text: "=",
                  onPressed: () => _onButtonPressed("="),
                ),
                OperationButton(
                  text: "+",
                  onPressed: () => _onButtonPressed("+"),
                ),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
