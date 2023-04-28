import 'package:flutter/material.dart';

import '../widgets/calculator_button.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late String  text = "";

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.bottomRight,
              child: Text(
                text,
                style: const TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              CustomOutlineButton("7"),
              CustomOutlineButton("8"),
              CustomOutlineButton("9"),
              CustomOutlineButton("x"),
            ],
          ),
          Row(
            children: <Widget>[
              CustomOutlineButton("4"),
              CustomOutlineButton("5"),
              CustomOutlineButton("6"),
              CustomOutlineButton("-"),
            ],
          ),
          Row(
            children: <Widget>[
              CustomOutlineButton("1"),
              CustomOutlineButton("2"),
              CustomOutlineButton("3"),
              CustomOutlineButton("+"),
            ],
          ),
          Row(
            children: <Widget>[
              CustomOutlineButton("C"),
              CustomOutlineButton("0"),
              CustomOutlineButton("."),
              CustomOutlineButton("="),
            ],
          ),
        ],
      ),
    );
  }
}
