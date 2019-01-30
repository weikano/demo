import 'package:flutter/material.dart';

class TabBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabBarState();
  }
}

class _TabBarState extends State<TabBarDemo> {
  final _datas = <IconLabel>[
    IconLabel(label: 'CAR', icon: Icons.directions_car),
    IconLabel(label: 'BICYCLE', icon: Icons.directions_bike),
    IconLabel(label: 'BOAT', icon: Icons.directions_boat),
    IconLabel(label: 'BUS', icon: Icons.directions_bus),
    IconLabel(label: 'TRAIN', icon: Icons.directions_subway),
    IconLabel(label: 'WALK', icon: Icons.directions_walk),
    IconLabel(label: 'RAILWAY', icon: Icons.directions_railway),
  ];
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TabBarDemo',
      home: DefaultTabController(
          length: _datas.length,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('TabBarDemo'),
              bottom: TabBar(
                  isScrollable: true,
                  tabs: _datas.map((IconLabel info) {
                    return Tab(
                      text: info.label,
                      icon: Icon(info.icon),
                    );
                  }).toList()),
            ),
            body: TabBarView(
                children: _datas.map((IconLabel info) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          info.icon,
                          size: 150,
                          color: Theme.of(context).primaryColor,
                        ),
                        Text(info.label)
                      ],
                    ),
                  ),
                ),
//
//                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Text(info.label),
//                    Icon(info.icon)
//                  ],
//                ),
              );
            }).toList()),
          )),
    );
  }
}

class IconLabel {
  final String label;
  final IconData icon;

  IconLabel({this.label, this.icon});
}
