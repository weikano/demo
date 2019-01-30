import 'package:flutter/material.dart';

const AVATAR =
    "https://secure.gravatar.com/avatar/0197faa18a080b5a6bc7ed34ea2edf43";

class HeroAnimationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: InkWell(
        child: Hero(
          tag: "avatar",
          child: ClipOval(
            child: Image.network(
              AVATAR,
              width: 50.0,
              height: 50.0,
            ),
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(pageBuilder: (BuildContext context,
                Animation animation, Animation secondary) {
              return FadeTransition(
                opacity: animation,
                child: HeroAnimationRouteB(),
              );
            }),
          );
        },
      ),
    );
  }
}

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.grey,
      child: Hero(
        tag: "avatar",
        child: GestureDetector(
          child: Image.network(AVATAR),
          onTap: () {
            Navigator.pop(context, true);
          },
        ),
      ),
    );
  }
}
