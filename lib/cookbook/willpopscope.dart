import 'package:flutter/material.dart';

class WillPopScopeDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WillPopScopeState();
  }
}

class _WillPopScopeState extends State<WillPopScopeDemo> {
  DateTime _lastTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Center(
        child: Text('1秒内点击两次返回按键退出'),
      ),
      onWillPop: () async {
        var _now = DateTime.now();
        if (_lastTime == null ||
            _now.difference(_lastTime) > Duration(seconds: 1)) {
          _lastTime = _now;
          return false;
        }
        return true;
      },
    );
  }
}
