import 'package:demo/flutterinaction/basics.dart';
import 'package:demo/flutterinaction/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BasicWidgetsButtonEntry extends BaseEntryPage {
  @override
  Widget createBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("DisabledRaisedButton，没有设置onPressed"),
          ),
          RaisedButton(
            child: Text("RaisedButton"),
            onPressed: () {},
          ),
          FlatButton(
            child: Text("DisabledFlatButton，没有设置onPressed"),
          ),
          FlatButton(
            child: Text("FlatButton"),
            onPressed: () {},
          ),
          OutlineButton(
            onPressed: null,
            child: Text("DisabledOutlineButton"),
          ),
          OutlineButton(
            onPressed: () {},
            child: Text("OutlineButton"),
          ),
          IconButton(icon: Icon(Icons.thumb_up), onPressed: null),
          IconButton(
            icon: Icon(Icons.thumb_up),
            onPressed: () {},
          ),
          RaisedButton(
            onPressed: () {},
            child: Text("自定义button，基于RaisedButton"),
            color: Colors.blue, //normal状态的颜色
            highlightColor: Colors.blue[700], //按下去的颜色
            colorBrightness:
                Brightness.dark, //主题是dark还是light，这里会影响到child中Text的字体颜色
            splashColor: Colors.grey, //ripple color
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //按钮形状
          ),
        ],
      ),
    );
  }

  @override
  String get iconUrl => null;

  @override
  String get routeName => basicWidgetsSub("button");

  @override
  String get title => "按钮";

  @override
  String get url => null;
}
