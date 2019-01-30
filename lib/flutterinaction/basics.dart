import 'package:demo/flutterinaction/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class EntryItem extends StatelessWidget {
  final RouteData route;
  final int index;
  final BuildContext context;

  EntryItem.fromRouteInfo(this.context, this.route, this.index);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: index % 2 == 0 ? Colors.transparent : Colors.grey[300],
      ),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(route.title),
        ),
        onTap: () {
          _jump();
        },
      ),
    );
  }

  void _jump() {
    Navigator.of(context).pushNamed(route.routeName);
  }
}

///sub列表
abstract class BaseSubEntryPage extends StatelessWidget implements RouteInfo {
  @override
  Widget build(BuildContext context) {
    var items = subRouteData(this);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            EntryItem.fromRouteInfo(context, items[index], index),
        itemCount: items.length,
      ),
    );
  }
}

///sub页面
abstract class BaseEntryPage extends StatelessWidget implements RouteInfo {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.open_in_browser),
              tooltip: "对应网页链接",
              onPressed: url == null ? null : _openInBrowser),
        ],
      ),
      body: createBody(),
    );
  }

  Widget createBody();

  void _openInBrowser() async {
    if (await canLaunch(url)) {
      launch(url);
    }
  }
}

abstract class BaseEntryStatePage extends StatefulWidget implements RouteInfo {
  BaseEntryPageState createStateImpl();

  @override
  State<StatefulWidget> createState() => createStateImpl();
}

abstract class BaseEntryPageState<T extends BaseEntryStatePage>
    extends State<T> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
//          leading: BackButton(),
        ),
        body: createBody(context),
      ),
    );
  }

  Widget createBody(BuildContext context);
}
