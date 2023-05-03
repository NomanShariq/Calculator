import 'package:flutter/material.dart';

class CalculatorScreen extends StatelessWidget {
  final String text;

  const CalculatorScreen({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        alignment: Alignment.bottomRight,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 60.0,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
