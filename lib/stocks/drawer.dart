import 'package:flutter/material.dart';

class StockDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            child: Center(
              child: Text('Stocks'),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.assessment),
            title: Text('Stock List'),
            selected: true,
          ),
          const ListTile(
            leading: Icon(Icons.account_balance),
            title: Text('Account Balance'),
            enabled: false,
          ),
          const ListTile(
            leading: const Icon(Icons.dvr),
            title: const Text('Dump app to console'),
          ),
          const Divider(),
          const ListTile(
            leading: const Icon(Icons.help),
            title: const Text('About'),
          )
        ],
      ),
    );
  }
}
