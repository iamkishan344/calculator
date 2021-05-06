import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // remove for debug icon
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
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
  String oprand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      oprand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "*") {
      num1 = double.parse(output);
      oprand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Already conatains a decimals");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (oprand == "+") {
        _output = (num1 + num2).toString();
      }
      if (oprand == "-") {
        _output = (num1 - num2).toString();
      }
      if (oprand == "*") {
        _output = (num1 * num2).toString();
      }
      if (oprand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      oprand = "";
    } else {
      _output = _output + buttonText;
    }

    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButtoun(String buttonText) {
    return new Expanded(
      child: new OutlineButton(
          padding: new EdgeInsets.all(24.0),
          child: new Text(
            buttonText,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          onPressed: () => buttonPressed(buttonText)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new Container(
            child: new Column(
          children: <Widget>[
            new Container(
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
                new Row(children: [
                  buildButtoun("7"),
                  buildButtoun("8"),
                  buildButtoun("9"),
                  buildButtoun("/")
                ]),
                new Row(children: [
                  buildButtoun("4"),
                  buildButtoun("5"),
                  buildButtoun("6"),
                  buildButtoun("*")
                ]),
                new Row(children: [
                  buildButtoun("1"),
                  buildButtoun("2"),
                  buildButtoun("3"),
                  buildButtoun("-")
                ]),
                new Row(children: [
                  buildButtoun("."),
                  buildButtoun("0"),
                  buildButtoun("00"),
                  buildButtoun("+")
                ]),
                new Row(children: [
                  buildButtoun("CLEAR"),
                  buildButtoun("="),
                ]),
              ],
            )
          ],
        )));
  }
}
