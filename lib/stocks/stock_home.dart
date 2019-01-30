import 'package:flutter/material.dart';
import 'drawer.dart';

class StockHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Stocks"),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                print('search');
              },
              tooltip: 'Search;',
            ),
            PopupMenuButton(itemBuilder: (context) {
              return <PopupMenuEntry>[
                CheckedPopupMenuItem<bool>(
                  child: Text('Autorefresh'),
                ),
                PopupMenuItem(child: Text('Refresh')),
                PopupMenuItem(
                  child: Text('Increase animation speed'),
                ),
                PopupMenuItem(
                  child: Text('Decrease animation speed'),
                ),
              ];
            }),
          ],
          bottom: TabBar(
            isScrollable: false,
            tabs: <Widget>[
              Tab(
                text: 'MARKET',
              ),
              Tab(
                text: 'PORTFOLIO',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Text('TAB 1'),
            ),
            Center(
              child: Text('TAB 2'),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('fab clicked');
          },
          child: const Icon(Icons.add),
          tooltip: 'Add',
        ),
        drawer: StockDrawer(),
      ),
    );
  }
}
