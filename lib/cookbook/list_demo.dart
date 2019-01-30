import 'package:flutter/material.dart';

class ListDemo extends StatelessWidget {
  void _helpClick() {
    print('help clicked');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0),
        child: ListView(
//          scrollDirection: Axis.horizontal,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.print),
              title: Text('PRINT'),
            ),
            InkWell(
              child: const ListTile(
                leading: Icon(Icons.help),
                title: Text('HELP'),
                subtitle: Text('help me when I\' in danger'),
              ),
              onTap: _helpClick,
            ),
            const ListTile(
              leading: Icon(Icons.search),
              title: Text('SEARCH'),
            ),
          ],
        ));
  }
}
