import 'package:flutter/material.dart';

class GridWithFixCrossAxisCountDemo extends StatelessWidget {
  var _icons = <Icon>[
    Icon(Icons.ac_unit),
    Icon(Icons.airport_shuttle),
    Icon(Icons.all_inclusive),
    Icon(Icons.beach_access),
    Icon(Icons.cake),
    Icon(Icons.free_breakfast),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
      ),
      children: _icons.map((icon) {
        return Container(
          margin: const EdgeInsets.all(12.0),
          child: InkWell(
            child: icon,
            onTap: () {
              print('tap');
            },
//            decoration: BoxDecoration(
//              border: Border.all(color: Colors.black45),
//              borderRadius: BorderRadius.all(Radius.circular(2.0)),
//            ),
          ),
        );
      }).toList(),
    );
  }
}
