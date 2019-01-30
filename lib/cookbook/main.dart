import 'package:flutter/material.dart';
import 'form_demo.dart';
import 'slider_demo.dart';
import 'image_demo.dart';
import 'list_demo.dart';
import 'counter.dart';
import 'padding.dart';
import 'container.dart';
import 'single_child_scrollview.dart';
import 'inifinite_listview.dart';
import 'grid_fixcrossaxiscount.dart';
import 'custom_scrollview.dart';
import 'scroll_controller.dart';
import 'notification_listener.dart';
import 'willpopscope.dart';
import 'inherited_widget.dart';
import 'theme_change.dart';
import 'pointer_demo.dart';
import 'drag_drop.dart';
import 'scale.dart';
import 'scale_animation.dart';
import 'hero_animation.dart';
import 'stagger_animation.dart';

main() {
  Widget body = SlideDemo();
  body = FormDemo();
  body = ImageFadeIn();
  body = ImageCacheDemo();
  body = ListDemo();
  body = CounterDemo();
  body = PaddingDemo();
  body = ContainerDemo();
  body = SingleChildScrollViewDemo();
  body = InfiniteListViewDemo();
  body = GridWithFixCrossAxisCountDemo();
  body = ScrollControllerDemo();
  body = NotificationListenerDemo();

  body = Padding(
    padding: const EdgeInsets.all(12.0),
    child: Row(
      children: <Widget>[
        Icon(Icons.favorite),
        SizedBox(
          width: 12,
        ),
        Flexible(
          fit: FlexFit.tight,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'asdfajsdfkljasdklfjasdfjas;dfjasldfjadfasdfasfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasfasfdasdfasf',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Icon(Icons.thumb_up),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
//  body = WillPopScopeDemo();
//  body = InheritedWidgetTestDemo();
//  body = ThemeDemo();
//  body = PointerDemo();
//  body = DragDropDemo();
//  body = ScaleDemo();
//  body = CustomScrollViewDemo();
//  body = ScaleAnimationDemo();
//  body = AnimatedImageDemo();
//  body = HeroAnimationRoute();
//  body = StaggerDemo();
//  body = GrowTransitionDemo();
  runApp(MaterialApp(
    title: 'Cookbook',
    home: Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Cookbook'),
        ),
      ),
      body: body,
    ),
  ));
}
