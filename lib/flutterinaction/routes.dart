import 'package:demo/flutterinaction/animation/AnimationEntryPage.dart';
import 'package:demo/flutterinaction/basic_widgets/BasicWidgetsButtonEntry.dart';
import 'package:demo/flutterinaction/basic_widgets/BasicWidgetsEntryPage.dart';
import 'package:demo/flutterinaction/basic_widgets/BasicWidgetsImageIconEntry.dart';
import 'package:demo/flutterinaction/basic_widgets/BasicWidgetsTextEntry.dart';
import 'package:demo/flutterinaction/basic_widgets/BasicWidgetsTextFormEntry.dart';
import 'package:demo/flutterinaction/basic_widgets/BasicWidgetsToggleEntry.dart';
import 'package:demo/flutterinaction/container_widgets/ContainerWidgetsConstrainedBoxEntry.dart';
import 'package:demo/flutterinaction/container_widgets/ContainerWidgetsContainerEntry.dart';
import 'package:demo/flutterinaction/container_widgets/ContainerWidgetsDecoratedBoxEntry.dart';
import 'package:demo/flutterinaction/container_widgets/ContainerWidgetsEntryPage.dart';
import 'package:demo/flutterinaction/container_widgets/ContainerWidgetsPaddingEntry.dart';
import 'package:demo/flutterinaction/container_widgets/ContainerWidgetsTransformEntry.dart';
import 'package:demo/flutterinaction/custom_widgets/CustomWidgetsEntryPage.dart';
import 'package:demo/flutterinaction/event_notification/EventNotificationEntryPage.dart';
import 'package:demo/flutterinaction/file_network/FileNetworkEntryPage.dart';
import 'package:demo/flutterinaction/fuction_widgets/FuctionWidgetsEntryPage.dart';
import 'package:demo/flutterinaction/layout_widgets/LayoutWidgetsEntryPage.dart';
import 'package:demo/flutterinaction/layout_widgets/LayoutWidgetsFlexEntry.dart';
import 'package:demo/flutterinaction/layout_widgets/LayoutWidgetsRowColumnEntry.dart';
import 'package:demo/flutterinaction/layout_widgets/LayoutWidgetsStackPositionedEntry.dart';
import 'package:demo/flutterinaction/layout_widgets/LayoutWidgetsWrapFlowEntry.dart';
import 'package:demo/flutterinaction/main.dart';
import 'package:demo/flutterinaction/scroll_widgets/ScrollWidgetsEntryPage.dart';
import 'package:flutter/widgets.dart';

abstract class RouteInfo {
  String get title;

  String get routeName;

  String get iconUrl;

  String get url => null;
}

class RouteData {
  final String title;
  final String routeName;
  final String iconUrl;
  WidgetBuilder builder;

  RouteData.fromRouteInfo(RouteInfo info)
      : title = info.title,
        iconUrl = info.iconUrl,
        routeName = info.routeName {
    builder = (BuildContext context) => info as Widget;
  }
}

///所有的页面route信息
Map<RouteInfo, List<RouteInfo>> _routesTree = <RouteInfo, List<RouteInfo>>{
  BasicWidgetsEntryPage(): <RouteInfo>[
    BasicWidgetsTextEntry(),
    BasicWidgetsButtonEntry(),
    BasicWidgetsImageIconEntry(),
    BasicWidgetsToggleEntry(),
    BasicWidgetsTextFormEntry(),
  ],
  LayoutWidgetsEntryPage(): <RouteInfo>[
    LayoutWidgetsRowColumnEntry(),
    LayoutWidgetsFlexEntry(),
    LayoutWidgetsWrapFlowEntry(),
    LayoutWidgetsStackPositionedEntry(),
  ],
  ContainerWidgetsEntryPage(): <RouteInfo>[
    ContainerWidgetsPaddingEntry(),
    ContainerWidgetsConstrainedBoxEntry(),
    ContainerWidgetsDecoratedBoxEntry(),
    ContainerWidgetsTransformEntry(),
    ContainerWidgetsContainerEntry(),
  ],
  ScrollWidgetsEntryPage(): <RouteInfo>[],
  FunctionWidgetsEntryPage(): <RouteInfo>[],
  EventNotificationEntryPage(): <RouteInfo>[],
  AnimationEntryPage(): <RouteInfo>[],
  CustomWidgetsEntryPage(): <RouteInfo>[],
  FileNetworkEntryPage(): <RouteInfo>[],
};

///首页route信息
List<RouteData> mainRoutes = _routesTree.keys
    .map((RouteInfo info) => RouteData.fromRouteInfo(info))
    .toList();

Map<String, WidgetBuilder> buildMainRoutes() {
  Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{};
  mainRoutes.forEach((RouteData item) {
    routes[item.routeName] = item.builder;
  });
  return routes;
}

Map<String, WidgetBuilder> allRoutes() {
  Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    "/": (BuildContext context) {
      return Home();
    }
  };
  _routesTree.keys.forEach((RouteInfo key) {
    routes[key.routeName] = RouteData.fromRouteInfo(key).builder;
    var values = _routesTree[key];
    values.forEach((RouteInfo value) {
      routes[value.routeName] = RouteData.fromRouteInfo(value).builder;
    });
  });
  return routes;
}

///次级页面route信息
List<RouteData> subRouteData(RouteInfo info) => _routesTree[info]
    .map((RouteInfo info) => RouteData.fromRouteInfo(info))
    .toList();

Map<String, WidgetBuilder> subRoutes(RouteInfo info) {
  Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{};
  var sub = subRouteData(info);
  if (sub != null) {
    sub.forEach((RouteData info) {
      routes[info.routeName] = info.builder;
    });
  }
  return routes;
}
