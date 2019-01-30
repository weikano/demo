import 'package:flutter/material.dart';

class CounterDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CounterState();
  }
}

class _CounterState extends State<CounterDemo> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('you have pushed the button this many times :$_counter'),
          RaisedButton(
            onPressed: _increment,
            child: Text("press me"),
          ),
        ],
      ),
    );
  }
}
