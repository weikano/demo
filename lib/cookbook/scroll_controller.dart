import 'package:flutter/material.dart';

class ScrollControllerDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScrollControllerState();
  }
}

class _ScrollControllerState extends State<ScrollControllerDemo> {
  ScrollController _controller = ScrollController();
  bool _showBtn = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.offset);
      if (_controller.offset < 1000 && _showBtn) {
        setState(() {
          _showBtn = false;
        });
      } else if (_controller.offset >= 1000 && _showBtn == false) {
        setState(() {
          _showBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scrollbar(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('item $index'),
              );
            },
            controller: _controller,
            itemExtent: 50.0,
            itemCount: 100,
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: FloatingActionButton(
            onPressed: () {
              if (!_showBtn) {
                return;
              }
              _controller.animateTo(0,
                  duration: Duration(milliseconds: 200), curve: Curves.easeIn);
            },
            child: Icon(Icons.arrow_upward),
          ),
        ),
      ],
    );
  }
}
