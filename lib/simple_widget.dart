import 'package:flutter/material.dart';

class SimpleWidget extends StatelessWidget {
  final Widget title;
  SimpleWidget({this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(
        color: Colors.blue[500],
      ),
      child: Row(
        children: <Widget>[
          IconButton(icon: Icon(Icons.menu), onPressed: null, tooltip: 'Navigation menu',),
          Expanded(child: title),
          IconButton(icon: Icon(Icons.search), onPressed: null, tooltip: 'Search',)
        ],
      ),
    );
  }
}

class SimpleWidgetScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          SimpleWidget(
            title: Text(
              'ExampleTitle',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          Expanded(child: Center(
            child: Text('Hello world'),
          )),
        ],
      ),
    );
  }

}

main()=>runApp(new MaterialApp(
  title: 'MyApp',
  home: SimpleWidgetScaffold(),
));