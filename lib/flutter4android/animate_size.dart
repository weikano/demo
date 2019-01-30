import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class AnimateSizeDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimateSizeDemo();
  }
}

class _AnimateSizeDemo extends State<AnimateSizeDemo>
    with TickerProviderStateMixin {
  AnimationController controller;

//	CurvedAnimation curved;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
//    curved = CurvedAnimation(parent: controller, curve: Curves.elasticIn);
    animation = Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener(() {
        setState(() {
          //todo
        });
      })
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          controller.reset();
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
