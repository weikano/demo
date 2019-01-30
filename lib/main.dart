import 'package:flutter/material.dart';
import 'tutorial_home.dart';
import 'my_button.dart';
import 'card_dmoe.dart';
import 'container_demo.dart';
import 'sized_overflow_box.dart';
import 'overflow_box_demo.dart';
import 'aspect_ratio.dart';
import 'baseline.dart';
import 'row.dart';
import 'codelabs/app.dart';

void main() {
//  var home = TutorialHome();
//  var home = CardDemo();
//  var home = OverflowBoxDemo();
//  var home = SizedOverflowBoxDemo();
//  var home = AspectRatioDemo();
//  var home = BaselineDemo();
//  var home = RowDemo();
//  var home = RowFixDemo();
//  runApp(MaterialApp(
//    title: home.appTitle(),
//    home: Scaffold(
//      appBar: AppBar(
//        title: Text(home.appTitle()),
//      ),
//      body: home,
//    ),
//  ));
//  runApp(ShrineApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41'),
        ],
      ),
    );

    Column buildButtonColumn(IconData icon, String label) {
      var color = Theme.of(context).primaryColor;
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    var buttonSection = Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    var textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text('''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''', softWrap: true),
    );

    var body = ListView(
      children: <Widget>[
        Image.asset(
          'images/lake.png',
          width: 600.0,
          height: 240.0,
          fit: BoxFit.cover,
        ),
        titleSection,
        buttonSection,
        textSection
      ],
      // padding: EdgeInsets.only(left: 8.0, right: 8.0),
      // padding: EdgeInsets.all(0.0),
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: body,
      ),
    );
  }
}
