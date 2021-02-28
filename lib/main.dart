import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = true;
    return MaterialApp(
      title: 'Taps',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _baseCounter=0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      if(_counter>108){
        _counter = 1;
        _baseCounter++;
      }
    });
  }

  void _clearCounter() {
    setState(() {
      _counter = 0;
      _baseCounter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: InkWell(
          onTap: _incrementCounter,
          onLongPress: _clearCounter,
          child: Stack(children: [
            Positioned(
              top: width * 0.09,
              left: width * 0.01,
              child: Container(
                  child: Text('$_baseCounter',style: TextStyle(color: Colors.black38, fontSize: width * 0.1,)),
              )
            ),
            Container(
                alignment: Alignment.center,
                child: Text('$_counter',style: TextStyle(color: Colors.black38, fontSize: width * 0.5),)
            ),
            Positioned(
              bottom: width * 0.01,
              right: width * 0.01,
              child: Container(
                  child: Text('Tap to Increment\nLong Press to reset', 
                  textAlign: TextAlign.right, 
                  style: TextStyle(color: Colors.black38, fontSize: width * 0.03,),)
                  ),
            )
          ])),
    );
  }
}
