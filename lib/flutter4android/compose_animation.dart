import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class _ComposeAnimationWidget extends AnimatedWidget {
  final Tween<double> _size = Tween(begin: 0.0, end: 300.0);
  final Tween<double> _alpha = Tween(begin: 0.0, end: 1.0);

  _ComposeAnimationWidget({Animation<double> animation})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Opacity(
        opacity: _alpha.evaluate(animation),
        child: Container(
          height: _size.evaluate(animation),
          width: _size.evaluate(animation),
          child: FlutterLogo(),
        ),
      ),
    );
  }
}

class ComposeAnimationDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ComposeAnimationState();
  }
}

class _ComposeAnimationState extends State<ComposeAnimationDemo>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return _ComposeAnimationWidget(
      animation: animation,
    );
  }
}
