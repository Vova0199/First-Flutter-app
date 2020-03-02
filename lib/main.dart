import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter test app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class _MyHomePageState extends State<MyHomePage> {
  Color bgrColor = Color.fromRGBO(255, 255, 255, 1);

  Random random = new Random();
  String hexColor = "#000000";
  int counter = 0;

  void _incrementCounter() {
    List<String> hexCodes = [
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "A",
      "B",
      "C",
      "D",
      "E",
      "F"
    ];
    hexColor = "#";
    setState(() {
      for (int i = 0; i < 6; i++) {
        String randomElement = hexCodes[random.nextInt(hexCodes.length)];
        hexColor += randomElement;
      }
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Center(
        child: new GestureDetector(
          onTap: () {
            setState(() {
              _incrementCounter();
              bgrColor = new Color.fromRGBO(random.nextInt(256),
                  random.nextInt(256), random.nextInt(256), 1.0);
            });
          },
          child: new Container(
            constraints: BoxConstraints.expand(),
            color: bgrColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Hey there',
                  style: Theme.of(context).textTheme.display3,
                ),
                Text('$counter',
                    style: TextStyle(color: HexColor(hexColor), fontSize: 28)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
