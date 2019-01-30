import 'package:demo/flutterinaction/basics.dart';
import 'package:demo/flutterinaction/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContainerWidgetsDecoratedBoxEntry extends BaseEntryPage {
  @override
  Widget createBody() {
    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.red, Colors.orange[700]]),
            borderRadius: BorderRadius.circular(3),
            boxShadow: [
              BoxShadow(
                  color: Colors.black45, offset: Offset(2, 2), blurRadius: 4.0),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 18),
          child: Text(
            "Login",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  String get iconUrl => null;

  @override
  String get routeName => containerWidgetsSub("decorated");

  @override
  String get title => "装饰容器DecoratedBox";

  @override
  String get url => "https://book.flutterchina.club/chapter5/decoratedbox.html";
}
