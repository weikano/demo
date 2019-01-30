import 'package:flutter/material.dart';

main()=>runApp(Cake());

class Cake extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cake',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Cake"),
        ),
        body: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Strawberry PAVLOVA'),
              Container(
                height: 8.0,
              ),
              Text('''
              Pavlova is meringue-based
              desert named after the Russian
              ballenine Anna Pavlova         
              ''',
              style: TextStyle(
                color: Colors.grey
              ),),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.star, color: Colors.green[500],),
                  Icon(Icons.star, color: Colors.green[500],),
                  Icon(Icons.star, color: Colors.green[500],),
                  Icon(Icons.star, color: Colors.black,),
                  Icon(Icons.star, color: Colors.black,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}