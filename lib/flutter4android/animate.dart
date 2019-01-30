import 'package:flutter/material.dart';

class AnimateChild extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimateChildState();
  }
}

class _AnimateChildState extends State<AnimateChild>
    with TickerProviderStateMixin<AnimateChild> {
  AnimationController controller;
  CurvedAnimation curve;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    curve = CurvedAnimation(
        parent: controller,
        curve: Curves.easeIn,
        reverseCurve: Curves.bounceIn);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: curve,
      builder: (BuildContext context, Widget child) {
        return Center(
            child: SizedBox(
          width: curve.value,
          height: curve.value,
          child: child,
        ));
      },
      child: FlutterLogo(),
    );
//    return Center(
//      child: Container(
//        width: 400,
//        height: 800,
//        child: Column(
//          children: <Widget>[
//            Container(
//              child: FadeTransition(
//                  opacity: curve,
//                  child: Container(
//                    width: 200,
//                    height: 200,
//                    child: FlutterLogo(
//                      size: 50,
//                    ),
//                  )),
//            ),
//            RaisedButton(
//              onPressed: () {
//                if (controller.isCompleted) {
//                  controller.reverse();
//                } else {
//                  controller.forward();
//                }
//              },
//              child: Center(
//                child: Text('animate !'),
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
  }
}
