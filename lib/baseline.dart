import 'package:flutter/material.dart';
import 'Basics.dart';

class BaselineDemo extends StatelessWidget implements GetTitle {
  @override
  String appTitle() => "BaselineDemo";

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Baseline(
              baseline: 25.0,
              baselineType: TextBaseline.alphabetic,
              child: Text(
                'AAAA',
                style: TextStyle(
                  fontSize: 12.0,
                  textBaseline: TextBaseline.alphabetic,
                ),
              ),
            ),
            Baseline(
              baseline: 25.0,
              baselineType: TextBaseline.alphabetic,
              child: Text(
                'BBB',
                style: TextStyle(
                    fontSize: 32.0, textBaseline: TextBaseline.alphabetic),
              ),
            )
          ],
        ));
  }
}
