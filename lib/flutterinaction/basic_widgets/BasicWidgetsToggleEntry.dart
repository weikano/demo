import 'package:demo/flutterinaction/basics.dart';
import 'package:demo/flutterinaction/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BasicWidgetsToggleEntry extends BaseEntryStatePage {
  @override
  String get iconUrl => null;

  @override
  String get routeName => basicWidgetsSub("toggle");

  @override
  String get title => "单选开关和复选框";

  @override
  BaseEntryPageState createStateImpl() {
    return _State();
  }

  @override
  // TODO: implement url
  String get url => null;
}

class _State extends BaseEntryPageState<BasicWidgetsToggleEntry> {
  bool _switchSelected = false;
  bool _checkboxSelected;

  @override
  Widget createBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Divider(),
          Switch(
            value: _switchSelected,
            onChanged: (value) {
              setState(() {
                _switchSelected = value;
              });
            },
          ),
          Divider(),
          Checkbox(
              tristate: true,
              value: _checkboxSelected,
              onChanged: (value) {
                setState(() {
                  _checkboxSelected = value;
                });
              }),
        ],
      ),
    );
  }
}
