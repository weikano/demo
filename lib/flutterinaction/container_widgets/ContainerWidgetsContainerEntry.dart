import 'package:demo/flutterinaction/basics.dart';
import 'package:demo/flutterinaction/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

class ContainerWidgetsContainerEntry extends BaseEntryPage {
  @override
  Widget createBody() {
    return Column(
      children: <Widget>[
        Text("Transform作用在paint阶段，不会影响widget的layout"),
        Divider(),
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
          child: Transform.translate(
            offset: Offset(
              -20,
              -5,
            ),
            child: Text("Hello world"),
          ),
        ),
        Divider(),
        Divider(),
        Divider(),
        Container(
          color: Colors.black,
          child: Transform(
            alignment: Alignment.topRight,
            transform: Matrix4.skewY(0.3),
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.deepOrange,
              child: Text("Apartment for rent!"),
            ),
          ),
        ),
        Divider(),
        Divider(),
        Divider(),
        Divider(),
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.blue),
          child: Transform.rotate(
            angle: pi / 2,
            child: Text("Transform.rotated"),
          ),
        ),
        Divider(),
        Divider(),
        Divider(),
        Text("RotatedBox作用于layout阶段"),
        Divider(),
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
          child: RotatedBox(
            quarterTurns: 1,
            child: Text("Hello world"),
          ),
        ),
        Text(
          "你好",
          style: TextStyle(color: Colors.green, fontSize: 18),
        ),
      ],
    );
  }

  @override
  String get iconUrl => null;

  @override
  String get routeName => containerWidgetsSub("container");

  @override
  String get title => "Container容器";

  @override
  String get url => "https://book.flutterchina.club/chapter5/container.html";
}
