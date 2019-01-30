import 'package:demo/flutterinaction/basics.dart';
import 'package:demo/flutterinaction/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BasicWidgetsTextEntry extends BaseEntryPage {
  @override
  String get iconUrl => null;

  @override
  String get routeName => basicWidgetsSub("text");

  @override
  String get title => "文本及样式";

  @override
  Widget createBody() {
    return SingleChildScrollView(
      child: DefaultTextStyle(
        style: TextStyle(
          color: Colors.red,
          fontSize: 20.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              "继承自DefaultTextStyle的Hello world",
              textAlign: TextAlign.center,
            ),
            Text(
              "单行句尾截断" * 6,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "Hello world",
              textScaleFactor: 1.5,
            ),
            Text(
              "Hello world居中显示" * 4,
              textAlign: TextAlign.center,
            ),
            Text(
              "Hello world",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                height: 1.2,
                fontFamily: 'Courier',
                background: Paint()..color = Colors.yellow,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed,
              ),
            ),
            Text.rich(TextSpan(children: [
              TextSpan(text: "Home: "),
              TextSpan(
                text: "https://flutterchina.club",
                style: TextStyle(color: Colors.blue),
              ),
            ])),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement url
  String get url => null;
}
