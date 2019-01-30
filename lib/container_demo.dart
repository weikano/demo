import 'package:flutter/material.dart';
import 'Basics.dart';

class ContainerDemo extends StatelessWidget implements GetTitle {
  @override
  String appTitle() => 'ContainerDemo';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Directionality(
          textDirection: TextDirection.rtl, child: Text('hello world')),
      transform: Matrix4.rotationZ(1.17),
    );
//    return Container(
//      constraints: BoxConstraints.expand(
//          height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0),
//      padding: const EdgeInsets.all(8.0),
//      color: Colors.teal.shade700,
//      alignment: Alignment.center,
//      child: Text(
//        'Hello World',
//        style:
//            Theme.of(context).textTheme.display1.copyWith(color: Colors.white),
//      ),
//      foregroundDecoration: BoxDecoration(
//          image: DecorationImage(
//        image: NetworkImage(
//            'https://cdn.jsdelivr.net/gh/flutterchina/website@1.0/images/flutter-mark-square-100.png'),
//        centerSlice: Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
//      )),
//      transform: Matrix4.rotationZ(0.0),
//    );
  }
}
