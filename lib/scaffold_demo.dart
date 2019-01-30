import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart';
import 'tab_bar.dart';

//main() => runApp(ScaffoldDemo());
//main() => runApp(BottomNavigationBarDemo());
main() => runApp(TabBarDemo());

class ScaffoldDemo extends StatelessWidget {
  ScaffoldDemo();

//  factory ScaffoldDemo.forDesignTime() {
//    // TODO: add arguments
//    return new ScaffoldDemo();
//  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScaffoldDemo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ScaffoldDemo'),
//          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add_circle,
                color: Colors.white,
              ),
              onPressed: null,
              tooltip: 'add',
            ),
            IconButton(
              icon: Icon(Icons.remove_circle),
              onPressed: null,
              tooltip: 'remove',
            ),
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return <PopupMenuItem>[
                  PopupMenuItem(child: Text('option1')),
                  PopupMenuItem(child: Text('option2')),
                  PopupMenuItem(
                      child: Icon(
                    Icons.keyboard_hide,
                    color: Colors.red,
                  )),
                ];
              },
            )
          ],
        ),
        body: Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              print('FlutterLogo clicked');
            },
            child: Container(
              width: 200,
              height: 200,
              child: FlutterLogo(),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              print('fab clicked');
            },
            icon: Icon(Icons.print),
            label: Text('print')),
      ),
    );
  }
}
