import 'package:demo/flutterinaction/basics.dart';
import 'package:demo/flutterinaction/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BasicWidgetsImageIconEntry extends BaseEntryPage {
  var _width = 100.0;
  @override
  Widget createBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Image(
            image: AssetImage("assets/avatar.png"),
            width: _width,
          ),
          Divider(),
          Image.asset(
            "assets/avatar.png",
            width: _width,
          ),
          Divider(),
          Image(
            image: NetworkImage(
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
            width: _width,
          ),
          Divider(),
          Image.network(
            "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
            width: _width,
          ),
          Divider(),
          Image.asset(
            "assets/avatar.png",
            width: _width,
            fit: BoxFit.fill,
          ),
          Divider(),
          Image.asset(
            "assets/avatar.png",
            width: _width,
            fit: BoxFit.contain,
          ),
          Divider(),
          Image.asset(
            "assets/avatar.png",
            width: _width,
            fit: BoxFit.cover,
          ),
          Divider(),
          Image.asset(
            "assets/avatar.png",
            width: _width,
            fit: BoxFit.fitWidth,
          ),
          Divider(),
          Image.asset(
            "assets/avatar.png",
            width: _width,
            fit: BoxFit.fitHeight,
          ),
          Divider(),
          Image.asset(
            "assets/avatar.png",
            width: _width,
            fit: BoxFit.scaleDown,
          ),
          Divider(),
          Image.asset(
            "assets/avatar.png",
            width: _width,
            fit: BoxFit.none,
          ),
          Divider(),
          Image.asset(
            "assets/avatar.png",
            width: _width,
            color: Colors.blue,
            colorBlendMode: BlendMode.difference,
          ),
          Divider(),
          Text(
            "使用图标\uE914\uE000\uE90D",
            style: TextStyle(
                fontFamily: "MaterialIcons",
                fontSize: 24.0,
                color: Colors.green),
          ),
          Icon(Icons.access_alarm),
        ],
      ),
    );
  }

  @override
  String get iconUrl => null;

  @override
  String get routeName => basicWidgetsSub("image_icon");

  @override
  String get title => "图片和Icon";

  @override
  // TODO: implement url
  String get url => null;
}
