import 'package:flutter/material.dart';

class NotificationListenerDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NotificationListenerState();
  }
}

class _NotificationListenerState extends State<NotificationListenerDemo> {
  int _progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: NotificationListener(
        onNotification: (ScrollNotification notification) {
          setState(() {
            _progress = (notification.metrics.pixels *
                100 ~/
                notification.metrics.maxScrollExtent);
          });
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ListView.builder(
              itemCount: 50,
              itemExtent: 50,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('item $index'),
                );
              },
            ),
            CircleAvatar(
              radius: 30,
              child: Text("$_progress %"),
              backgroundColor: Colors.black45,
            ),
          ],
        ),
      ),
    );
  }
}
