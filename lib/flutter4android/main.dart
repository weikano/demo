import 'package:flutter/material.dart';
import 'animate.dart';
import 'paint.dart';
import 'isolate_demo.dart';
import 'lifecycle_demo.dart';
import 'textinput.dart';
import 'animate_size.dart';
import 'animated_widget.dart';
import 'animate_builder.dart';
import 'compose_animation.dart';
import 'friendly_chat.dart';
import 'method_channel_demo.dart';
import 'fileio.dart';
import 'http_demo.dart';

main() {
  Widget target = AnimateChild();
//  var target = PaintDemo();
//  var target = IsolateDemo();
//  var target = LifecycleWatcher();
//  var target = TextInputDemo();
  target = AnimateSizeDemo();
  target = AnimatedWidgetDemo();
  target = LogoApp();
  target = ComposeAnimationDemo();
  target = FriendlyChat();
  target = MethodChannelDemo();
  target = FileIODemo();
  target = HttpDemo();

  var theme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.red[700],
    accentColor: Colors.red,
  );
  runApp(MaterialApp(
    title: 'Flutter4Android',
//    theme: theme,
    home: Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Flutter4Android'),
        ),
      ),
      body: target,
    ),
  ));
}
