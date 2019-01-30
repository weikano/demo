import 'package:demo/flutterinaction/basics.dart';
import 'package:demo/flutterinaction/const.dart';
import 'package:flutter/widgets.dart';

class ContainerWidgetsPaddingEntry extends BaseEntryPage {
  @override
  Widget createBody() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("Hello world"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text("I am Jack"),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
            child: Text("Your friend"),
          ),
        ],
      ),
    );
  }

  @override
  String get iconUrl => null;

  @override
  String get routeName => containerWidgetsSub("padding");

  @override
  String get title => "Padding";

  @override
  String get url => "https://book.flutterchina.club/chapter5/padding.html";
}
