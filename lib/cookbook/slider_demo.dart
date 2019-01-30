import 'package:flutter/material.dart';

class SlideDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SlideDemoState(onChanged: (double) {
      print('slide value is $double');
    });
  }
}

class _SlideDemoState extends State<SlideDemo> {
  _SlideDemoState({this.onChanged});
  final ValueChanged<double> onChanged;
  double _value = 0.0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        child: Slider(
          value: _value,
          min: 0,
          max: 100,
          onChanged: (double) {
            setState(() {
              _value = double;
            });
            onChanged(double);
          },
          divisions: 10,
        ),
      ),
    );
  }
}
