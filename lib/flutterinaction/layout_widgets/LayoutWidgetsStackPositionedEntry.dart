import 'package:demo/flutterinaction/basics.dart';
import 'package:demo/flutterinaction/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LayoutWidgetsStackPositionedEntry extends BaseEntryPage {
  @override
  Widget createBody() {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            child: Text(
              "Hello world",
              style: TextStyle(color: Colors.red),
            ),
          ),
          Positioned(
            child: Text("I am Jack"),
            left: 18,
          ),
          Positioned(
            child: Text("Your friend"),
            top: 18,
          ),
        ],
      ),
    );
  }

  @override
  String get iconUrl => null;

  @override
  String get routeName => layoutWidgetsSub("stack_positioned");

  @override
  String get title => "层叠布局Stack、Positioned";

  @override
  String get url => "https://book.flutterchina.club/chapter4/stack.html";
}
