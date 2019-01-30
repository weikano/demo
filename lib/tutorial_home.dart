import 'package:flutter/material.dart';
import 'Basics.dart';

class TutorialHome extends StatelessWidget implements GetTitle{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: null,
          tooltip: 'NavigationMenu',
        ),
        title: Text('ExampleTitle'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'search',
            onPressed: null,
          ),
        ],
      ),
      body: Center(
        child: Text('Hello world'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  String appTitle() {
    return 'tutorial_home';
  }
}

main() {
  runApp(MaterialApp(
    title: 'tutorial',
    home: TutorialHome(),
  ));
}
