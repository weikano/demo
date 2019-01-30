import 'package:flutter/material.dart';
import 'Basics.dart';

class RowDemo extends StatelessWidget implements GetTitle {
  @override
  String appTitle() => 'RowDemo';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(
            'Deliver features faster',
            textAlign: TextAlign.center,
          )),
          Expanded(
            child: Text(
              'Craft beautiful UIS',
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
              child: FittedBox(
            child: const FlutterLogo(),
            fit: BoxFit.contain,
          )),
        ],
      ),
//      child: Row(
//        children: <Widget>[
//          Expanded(
//              child: Text(
//            'Deliver features faster',
//            textAlign: TextAlign.center,
//          )),
//          Expanded(
//            child: Text(
//              'Craft beautiful UIS',
//              textAlign: TextAlign.center,
//            ),
//          ),
//          Expanded(
//              child: FittedBox(
//            child: const FlutterLogo(),
//            fit: BoxFit.contain,
//          )),
//        ],
//      ),
    );
  }
}

class RowFixDemo extends StatelessWidget implements GetTitle {
  @override
  String appTitle() => 'RowFixDemo';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          const FlutterLogo(),
          const Expanded(
            child: const Text(
                'Flutter\'s hot reload helps you quickly and easily experiment , build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android.'),
          ),
          const Expanded(
            child: const Text(
                'Flutter\'s hot reload helps you quickly and easily experiment , build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android.'),
          ),
          const Icon(Icons.sentiment_very_satisfied),
        ],
      ),
    );
  }
}
