import 'package:demo/flutterinaction/basics.dart';
import 'package:demo/flutterinaction/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContainerWidgetsConstrainedBoxEntry extends BaseEntryPage {
  final _redBox =
      const DecoratedBox(decoration: const BoxDecoration(color: Colors.red));

  @override
  Widget createBody() {
    return Column(
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(minWidth: double.infinity, minHeight: 50),
          child: Container(
            child: _redBox,
            height: 5.0,
          ),
        ),
        Divider(),
        SizedBox(
          width: 80,
          height: 80,
          child: _redBox,
        ),
        Divider(),
        ConstrainedBox(
          constraints: BoxConstraints(minWidth: 60, minHeight: 100),
          child: UnconstrainedBox(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 20, minWidth: 90),
              child: _redBox,
            ),
          ),
        )
      ],
    );
  }

  @override
  String get iconUrl => null;

  @override
  String get routeName => containerWidgetsSub("constrained_box");

  @override
  String get title => "布局限制类容器ConstrainedBox";

  @override
  String get url =>
      "https://book.flutterchina.club/chapter5/constrainedbox_and_sizebox.html";
}
