import 'package:flutter/material.dart';

class DragDropDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DragDropState();
  }
}

class _DragDropState extends State<DragDropDemo> {
  double _top = 0, _left = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(
              child: Text('A'),
            ),
            onPanDown: (DragDownDetails e) {
              print(e);
            },
            onPanUpdate: (DragUpdateDetails e) {
              setState(() {
                _top += e.delta.dy;
                _left += e.delta.dx;
              });
            },
            onPanEnd: (DragEndDetails e) {},
          ),
        ),
      ],
    );
  }
}
