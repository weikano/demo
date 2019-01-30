import 'package:flutter/material.dart';

class _StaggerAnimation extends StatelessWidget {
  _StaggerAnimation({Key key, this.controller}) : super(key: key) {
    height = Tween<double>(begin: 30.0, end: 200.0)
        .animate(CurvedAnimation(parent: controller, curve: INTERNAL));
    color = ColorTween(begin: Colors.green, end: Colors.red)
        .animate(CurvedAnimation(parent: controller, curve: INTERNAL));
    padding = Tween<EdgeInsets>(
            begin: const EdgeInsets.only(left: 20.0),
            end: const EdgeInsets.only(left: 100.0))
        .animate(CurvedAnimation(parent: controller, curve: INTERNAL));
  }

  static const INTERNAL = Curves.fastOutSlowIn;
//      const Interval(0.2, 1.0, curve: Curves.fastOutSlowIn);
  final Animation<double> controller;
  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<Color> color;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: padding.value,
      child: Container(
        color: color.value,
        width: 50.0,
        height: height.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}

class StaggerDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StaggerState();
  }
}

class StaggerState extends State<StaggerDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
  }

  Future<Null> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled {}
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _playAnimation();
      },
      child: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            border: Border.all(
              color: Colors.black.withOpacity(.5),
            ),
          ),
          child: _StaggerAnimation(
            controller: _controller,
          ),
        ),
      ),
    );
  }
}
