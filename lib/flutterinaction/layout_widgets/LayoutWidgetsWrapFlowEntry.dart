import 'package:demo/flutterinaction/basics.dart';
import 'package:demo/flutterinaction/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LayoutWidgetsWrapFlowEntry extends BaseEntryPage {
  @override
  Widget createBody() {
    return Column(
      //测试Row对齐方式，排除Column默认居中对齐的干扰
      children: <Widget>[
        Text("这是Wrap"),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          alignment: WrapAlignment.start,
          children: <Widget>[
            Chip(
              avatar: CircleAvatar(
                child: Text("A"),
                backgroundColor: Colors.blue,
              ),
              label: Text("Hamilton"),
            ),
            Chip(
              avatar: CircleAvatar(
                child: Text("M"),
                backgroundColor: Colors.blue,
              ),
              label: Text("Mulligan"),
            ),
            Chip(
              avatar: CircleAvatar(
                child: Text("H"),
                backgroundColor: Colors.blue,
              ),
              label: Text("Lafayette"),
            ),
            Chip(
              avatar: CircleAvatar(
                child: Text("J"),
                backgroundColor: Colors.blue,
              ),
              label: Text("Laurens"),
            ),
          ],
        ),
        Text("这是flow，通过delegate来绘制children"),
        Flow(
          delegate: _Delegate(),
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              color: Colors.red,
            ),
            Container(
              width: 80,
              height: 80,
              color: Colors.green,
            ),
            Container(
              width: 80,
              height: 80,
              color: Colors.blue,
            ),
            Container(
              width: 80,
              height: 80,
              color: Colors.yellow,
            ),
            Container(
              width: 80,
              height: 80,
              color: Colors.brown,
            ),
            Container(
              width: 80,
              height: 80,
              color: Colors.purple,
            ),
          ],
        )
      ],
    );
  }

  @override
  String get iconUrl => null;

  @override
  String get routeName => layoutWidgetsSub("wrap_flow");

  @override
  String get title => "流式布局wrap、flow";

  @override
  String get url =>
      "https://book.flutterchina.club/chapter4/wrap_and_flow.html";
}

class _Delegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = 0.0;
    var y = 0.0;
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
        x = w;
      } else {
        x = 0;
        y += context.getChildSize(i).height;
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
        x += context.getChildSize(i).width;
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(double.infinity, 200);
  }
}
