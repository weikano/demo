import 'package:flutter/material.dart';

class _Painter extends CustomPainter {
  final List<Offset> points;
  _Painter({this.points});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(_Painter other) {
    return other.points != points;
  }
}

class PaintDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PaintState();
  }
}

class _PaintState extends State<PaintDemo> {
  List<Offset> _points = <Offset>[];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          RenderBox refBox = context.findRenderObject();
          Offset localPosition = refBox.globalToLocal(details.globalPosition);
          _points = List.from(_points)..add(localPosition);
        });
      },
      onPanEnd: (DragEndDetails detail) {
        _points.add(null);
      },
      child: CustomPaint(
        painter: _Painter(points: _points),
      ),
    );
  }
}
