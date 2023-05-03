import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int first, second;
  late String res, text = "";
  late String opp;

  void btnClicked(String btnText) {
    if (btnText == "CE") {
      if (text.isNotEmpty) {
        text = text.substring(0, text.length - 1);
      }
    }
    if (btnText == "C") {
      res = "";
      text = "";
      first = 0;
      second = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "÷" ||
        btnText == "%" ||
        btnText == "." ||
        btnText == "+/-") {
      first = int.parse(text);
      res = "";
      opp = btnText;
    } else if (btnText == "=") {
      second = int.parse(text);
      if (opp == "+") {
        res = (first + second).toString();
      }
      if (opp == "-") {
        res = (first - second).toString();
      }
      if (opp == "x") {
        res = (first * second).toString();
      }
      if (opp == "÷") {
        res = (first ~/ second).toString();
      }
      if (opp == "%") {
        res = (first % second).toString();
      }
    } else if (btnText == ".") {
      if (!text.contains(".")) {
        text = text + btnText;
      }
    } else if (btnText == "+/-") {
      if (text.startsWith("-")) {
        text = text.substring(1);
      } else {
        text = "-" + text;
      }
    } else {
      res = "";
      text = text + btnText;
    }
    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
