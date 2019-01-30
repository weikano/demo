import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class _AnimateLogo extends AnimatedWidget {
  _AnimateLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        width: animation.value,
        height: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}

class AnimatedWidgetDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatedWidgetState();
  }
}

class _AnimatedWidgetState extends State<AnimatedWidgetDemo>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    animation = Tween(begin: 0.0, end: 300.0).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return _AnimateLogo(
      animation: animation,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
