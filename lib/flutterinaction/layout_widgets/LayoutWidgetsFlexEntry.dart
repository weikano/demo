import 'package:demo/flutterinaction/basics.dart';
import 'package:demo/flutterinaction/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LayoutWidgetsFlexEntry extends BaseEntryPage {
  @override
  Widget createBody() {
    return Column(
      children: <Widget>[
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: 30,
                color: Colors.red,
              ),
            ),
            Expanded(
              child: Container(
                height: 30,
                color: Colors.green,
              ),
              flex: 2,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            height: 200,
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Text(
                    "Expanded中如果flex不为null，那么里面的child如果有设置高度也是无效的，只会以flex为准。剩余空间=Flex高度-非Flexible(Expaned为Flexible)的控件高度，然后再根据Expanded的flex划分高度。"),
                Expanded(
                  flex: 2,
                  child: Container(
//                    height: 300,
                    color: Colors.red,
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
//                    height: 30.0,
                    color: Colors.green,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  String get iconUrl => null;

  @override
  String get routeName => layoutWidgetsSub("flex");

  @override
  String get title => "弹性布局Flex";

  @override
  String get url => "https://book.flutterchina.club/chapter4/flex.html";
}
