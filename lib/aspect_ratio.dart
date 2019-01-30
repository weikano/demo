import 'package:flutter/material.dart';
import 'Basics.dart';

class AspectRatioDemo extends StatelessWidget implements GetTitle {
  @override
  String appTitle() => 'AspectRatioDemo';

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        color: Colors.green,
        alignment: Alignment.center,
        width: 300,
        child: AspectRatio(
          aspectRatio: 3.0,
          child: Container(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
