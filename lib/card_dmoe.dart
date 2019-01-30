import 'package:flutter/material.dart';
import 'Basics.dart';

class CardDemo extends StatelessWidget implements GetTitle {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210.0,
      child: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                '1625 Main Street',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('My City, CA 99984'),
              leading: Icon(
                Icons.restaurant_menu,
                color: Colors.blue[500],
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                '408 555-1212',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: Icon(
                Icons.contact_phone,
                color: Colors.blue[500],
              ),
            ),
            ListTile(
              title: Text('wkswind@gmail.com'),
              leading: Icon(
                Icons.email,
                color: Colors.blue[500],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  String appTitle() => 'Card Demo';
}
