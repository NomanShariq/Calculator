import 'package:calculator_app/screens/calculator_screen.dart';
import 'package:calculator_app/widgets/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      theme: themeProvider.getTheme(),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        actions: [
          PopupMenuButton<ThemeData>(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: ThemeData.light(),
                child: const Text("Light Theme"),
              ),
              PopupMenuItem(
                value: ThemeData.dark(),
                child: const Text("Dark Theme"),
              ),
            ],
            onSelected: (themeData) {
              themeProvider.setTheme(themeData);
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.dark_mode),
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            CalculatorScreen(text: text),
            Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
                border: Border(
                  top: BorderSide(
                    width: 1.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              child: Column(
                children: [
                  Divider(
                    color: Colors.transparent,
                  ),
                  Row(
                    children: <Widget>[
                      customOutlineButton("C"),
                      customOutlineButton("( )"),
                      customOutlineButton("%"),
                      customOutlineButton("➗"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      customOutlineButton("7"),
                      customOutlineButton("8"),
                      customOutlineButton("9"),
                      customOutlineButton("x"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      customOutlineButton("4"),
                      customOutlineButton("5"),
                      customOutlineButton("6"),
                      customOutlineButton("-"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      customOutlineButton("1"),
                      customOutlineButton("2"),
                      customOutlineButton("3"),
                      customOutlineButton("+"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      customOutlineButton("+/-"),
                      customOutlineButton("0"),
                      customOutlineButton("."),
                      customOutlineButton("="),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customOutlineButton(String val) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      height: 80,
      width: 102,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: (Colors.white),
        ),
        onPressed: () => btnClicked(val),
        child: Text(
          val,
          style: const TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

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
        btnText == "➗" ||
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
      if (opp == "➗") {
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
      res = int.parse(text + btnText).toString();
    }
    setState(() {
      text = res;
    });
  }
}
