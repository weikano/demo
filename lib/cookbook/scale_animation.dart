import 'package:flutter/material.dart';

const URL =
    "https://img-blog.csdn.net/20181009115611363?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzIwMzMwNTk1/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70";

class ScaleAnimationDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScaleAnimationState();
  }
}

class _ScaleAnimationState extends State<ScaleAnimationDemo>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceIn);
    _animation = Tween(begin: 64.0, end: 300.0).animate(_animation)
      ..addListener(() => setState(() => {}));
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Image.network(
          "https://img-blog.csdn.net/20181009115611363?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzIwMzMwNTk1/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70",
          width: _animation.value,
          height: _animation.value,
        ),
        onTap: () {
          print(_controller.value);
          print(_controller.status);
          if (_controller.isDismissed) {
            _controller.forward();
          } else if (_controller.isCompleted) {
            _controller.reverse();
          }
        },
      ),
    );
  }
}

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Animation<double> animation}) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Image.network(
        "https://img-blog.csdn.net/20181009115611363?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzIwMzMwNTk1/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70",
        width: animation.value,
        height: animation.value,
      ),
    );
  }
}

class AnimatedImageDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatedImageState();
  }
}

class _AnimatedImageState extends State<AnimatedImageDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.elasticInOut);
    _animation = Tween(begin: 64.0, end: 300.0).animate(_animation);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedImage(
        animation: _animation,
      ),
      onTap: () {
        if (_controller.isDismissed) {
          _controller.forward();
        } else if (_controller.isCompleted) {
          _controller.reverse();
        }
      },
    );
  }
}

class _GrowTransition extends StatelessWidget {
  _GrowTransition({this.animation, this.child});

  Animation<double> animation;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget child) {
          return Container(
            child: child,
            height: animation.value,
            width: animation.value,
          );
        },
      ),
    );
  }
}

class GrowTransitionDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GrowTransitionState();
  }
}

class _GrowTransitionState extends State<GrowTransitionDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
    _animation = Tween(begin: 60.0, end: 300.0).animate(_animation);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: _GrowTransition(
        animation: _animation,
        child: Image.network(URL),
      ),
      onTap: () {
        if (_controller.isCompleted) {
          _controller.reverse();
        } else if (_controller.isDismissed) {
          _controller.forward();
        }
      },
    );
  }
}
