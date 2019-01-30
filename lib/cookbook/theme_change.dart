import 'package:flutter/material.dart';

class ThemeDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ThemeState();
  }
}

class _ThemeState extends State<ThemeDemo> {
  Color _themeColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Theme(
      data: ThemeData(
        primarySwatch: _themeColor,
        iconTheme: IconThemeData(color: _themeColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.favorite),
              Icon(Icons.airport_shuttle),
              Text("颜色跟随主题"),
            ],
          ),
          Theme(
            data: theme.copyWith(
                iconTheme: theme.iconTheme.copyWith(
              color: Colors.black,
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.favorite),
                Icon(Icons.airport_shuttle),
                Text("颜色固定黑色"),
              ],
            ),
          ),
          RaisedButton(
            child: Text('切换主题'),
            onPressed: () {
              setState(() {
                _themeColor =
                    _themeColor == Colors.teal ? Colors.blue : Colors.teal;
              });
            },
          )
        ],
      ),
    );
  }
}
