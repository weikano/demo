import 'package:flutter/material.dart';

class ShrineApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ShrineState();
  }
}

class _ShrineState extends State<ShrineApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Image.asset('assets/diamond.png'),
            Column(
              children: <Widget>[
                SizedBox(height: 16.0),
                Text('SHRINE'),
              ],
            ),
            SizedBox(
              height: 120.0,
            ),
          ],
        ),
      ),
    );
  }
}
