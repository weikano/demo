import 'package:flutter/material.dart';

class SingleChildScrollViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var indexes = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    return Scrollbar(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: indexes
                .split("")
                .map((c) => Text(
                      c,
                      textScaleFactor: 2.0,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
