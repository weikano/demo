import 'package:flutter/material.dart';
import 'Basics.dart';

class MyButton extends StatelessWidget implements GetTitle{
  @override
  Widget build(BuildContext context) {

    var button = GestureDetector(
      onTap: () {
        print('clicked mybutton');
      },
      onDoubleTap: () {
        print('double tap');
      },
      child: Container(
        height: 48.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: Center(
          child: Text(
            'Engage'
          ),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle()),
      ),
      body: Center(
        child: button,
      ),
    );
  }

  @override
  String appTitle() {
    return 'MyButtonWithTap';
  }

}