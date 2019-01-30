import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MethodChannelDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MethodChannelState();
  }
}

class _MethodChannelState extends State<MethodChannelDemo> {
  TextEditingController _controller = TextEditingController();
  static const platform = const MethodChannel('com.wkswind.demo/battery');
  String _batteryLevel = 'Unknown';
  String _msg = 'Unknown';

  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at ${result / 100}%.';
    } on PlatformException catch (e) {
      batteryLevel = 'Failed to get battery level:${e.message}';
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  Future<Null> _otherMethod(String method) async {
    String msg;
    try {
      msg = await platform.invokeMethod(method);
    } on PlatformException catch (e) {
      msg = 'Failed to invoke method:${e.message}.';
    }
    setState(() {
      _msg = msg;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: 'input method name',
                          ),
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {
                          _otherMethod(_controller.text);
                        },
                        child: Text('Invoke'),
                      )
                    ],
                  ),
                  Text(_msg),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
