import 'package:flutter/material.dart';

class BottomNavigationBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationBarState();
  }
}

class _BottomNavigationBarState extends State<BottomNavigationBarDemo> {
  final _items = <int>[
    0,
    1,
    2,
  ];
  int _selected = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BottomNavigationBarDemo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('BottomNavigationBarDemo'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: _items.map((int index) {
            return BottomNavigationBarItem(
                backgroundColor: Colors.blue,
                icon: Icon(Icons.tab),
                title: Text('TAB $index'),
                activeIcon: Icon(Icons.home));
          }).toList(),
          currentIndex: _selected,
          fixedColor: Colors.deepPurple,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.shifting,
        ),
      ),
    );
  }
}
