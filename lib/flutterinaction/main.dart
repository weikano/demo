import 'package:demo/flutterinaction/basics.dart';
import 'package:demo/flutterinaction/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MainEntryPoint());

class MainEntryPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: allRoutes(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter实战samples'),
      ),
      body: ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              EntryItem.fromRouteInfo(context, mainRoutes[index], index),
          itemCount: mainRoutes.length),
    );
  }
}
