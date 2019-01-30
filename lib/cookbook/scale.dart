import 'package:flutter/material.dart';

class ScaleDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScaleState();
  }
}

class _ScaleState extends State<ScaleDemo> {
  double _width = 200;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Image.network(
          "https://img-blog.csdn.net/20181009115611363?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzIwMzMwNTk1/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70",
          width: _width,
        ),
        onScaleUpdate: (ScaleUpdateDetails e) {
          setState(() {
            _width = 200 * e.scale.clamp(.8, 10.0);
          });
        },
      ),
    );
  }
}
