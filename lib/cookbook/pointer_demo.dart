import 'package:flutter/material.dart';

class PointerDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PointerState();
  }
}

class _PointerState extends State<PointerDemo> {
  PointerEvent _event;
  void _refreshEvent(PointerEvent event) {
    setState(() {
      _event = event;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          _event?.toString() ?? "",
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.blue,
      ),
      onPointerDown: _refreshEvent,
      onPointerMove: _refreshEvent,
      onPointerUp: _refreshEvent,
    );
  }
}
