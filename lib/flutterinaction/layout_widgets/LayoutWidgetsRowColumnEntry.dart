import 'package:demo/flutterinaction/basics.dart';
import 'package:demo/flutterinaction/const.dart';
import 'package:flutter/widgets.dart';

class LayoutWidgetsRowColumnEntry extends BaseEntryPage {
  @override
  Widget createBody() {
    return Column(
      //测试Row对齐方式，排除Column默认居中对齐的干扰
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(" 1st hello world "),
            Text(" 1st I am Jack "),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(" 2nd hello world "),
            Text(" 2nd I am Jack "),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          textDirection: TextDirection.rtl,
          children: <Widget>[
            Text(" 3rd hello world "),
            Text(" 3rd I am Jack "),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.up,
          children: <Widget>[
            Text(
              " 4th hello world ",
              style: TextStyle(fontSize: 30.0),
            ),
            Text(" 4th I am Jack "),
          ],
        ),
      ],
    );
  }

  @override
  String get iconUrl => null;

  @override
  String get routeName => layoutWidgetsSub("row");

  @override
  String get title => "线性布局Row、Column";

  @override
  String get url =>
      "https://book.flutterchina.club/chapter4/row_and_column.html";
}
