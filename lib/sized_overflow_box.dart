import 'package:flutter/material.dart';
import 'Basics.dart';

class SizedOverflowBoxDemo extends StatelessWidget implements GetTitle {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        alignment: Alignment.center,
        color: Colors.green,
        width: 300,
        height: 300,
        child: SizedOverflowBox(
          size: Size(100, 300),
          child: Container(
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  @override
  String appTitle() {
    return 'SizedOverflowBoxDemo';
  }
}
