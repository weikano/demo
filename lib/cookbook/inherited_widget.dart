import 'package:flutter/material.dart';

class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({
    @required this.data,
    Widget child,
  }) : super(child: child);

  //保存点击次数
  int data;

  static ShareDataWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    return oldWidget.data == data;
  }
}

class _TestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestState();
  }
}

class _TestState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(ShareDataWidget.of(context).data.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('Dependencies changed');
  }
}

class InheritedWidgetTestDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InheritedState();
  }
}

class _InheritedState extends State<InheritedWidgetTestDemo> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShareDataWidget(
        data: count,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: _TestWidget(),
            ),
            RaisedButton(
              child: Text('Increment'),
              onPressed: () {
                setState(() {
                  ++count;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
