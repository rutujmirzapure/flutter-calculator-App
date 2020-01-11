import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttontext) {
    if (buttontext == "CLEAR") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttontext == "+" ||
        buttontext == "-" ||
        buttontext == "*" ||
        buttontext == "/") {
      num1 = double.parse(output);

      operand = buttontext;
      _output = "0";
    } else if (buttontext == ".") {
      if (_output.contains(".")) {
        print("already contains a decimals");
        return;
      } else {
        _output = _output + buttontext;
      }
    } else if (buttontext == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "*") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttontext;
    }
    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttontext) {
    return new Expanded(
      child: new OutlineButton(
        padding: new EdgeInsets.all(24.0),
        child: new Text(buttontext,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        onPressed: () => buttonPressed(buttontext),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new Container(
            child: Column(
          children: <Widget>[
            Container(
                alignment: Alignment.centerRight,
                padding:
                    new EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                child: new Text(
                  output,
                  style: new TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            new Expanded(
              child: new Divider(),
            ),
            Column(
              children: [
                Row(
                  children: <Widget>[
                    buildButton("9"),
                    buildButton("8"),
                    buildButton("7"),
                    buildButton("/")
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("6"),
                    buildButton("5"),
                    buildButton("4"),
                    buildButton("*")
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("3"),
                    buildButton("2"),
                    buildButton("1"),
                    buildButton("-")
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("."),
                    buildButton("0"),
                    buildButton("00"),
                    buildButton("+")
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("CLEAR"),
                    buildButton("="),
                  ],
                ),
              ],
            )
          ],
        )));
  }
}
