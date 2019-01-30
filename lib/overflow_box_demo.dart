import 'package:flutter/material.dart';
import 'Basics.dart';

class OverflowBoxDemo extends StatelessWidget implements GetTitle {
  @override
  String appTitle() => 'OverflowBoxDemo';

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        alignment: Alignment.center,
        color: Colors.green,
        width: 300,
        height: 300,
        child: OverflowBox(
          maxWidth: double.infinity,
          maxHeight: double.infinity,
          child: Container(
            width: 200,
            height: 800,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
