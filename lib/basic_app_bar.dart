import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BasicAppBarSample extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      return _BasicAppBarSampleState();
    }
}

class _BasicAppBarSampleState extends State<BasicAppBarSample> {
   Choice _selectedChoice = choices[0];
   void _select(Choice choice) {
     setState(() {
            _selectedChoice = choice;
          });
   }
   @override
     Widget build(BuildContext context) {
       return MaterialApp(
         //ttile是Android上用在最近任务中展示
         title: 'test',
         home: Scaffold(
           appBar: AppBar(
             title: const Text('Basic AppBar'),
             actions: <Widget>[
               IconButton(
                 icon: Icon(choices[0].icon),
                 onPressed: () {_select(choices[0]);},
               ),
               IconButton(
                 icon: Icon(choices[1].icon),
                 onPressed: () {_select(choices[1]);},
               ),
               PopupMenuButton<Choice>(
                 onSelected: _select,
                 itemBuilder: (BuildContext context) {
                   return choices.skip(2).map<PopupMenuItem<Choice>>((Choice choice) {
                     return PopupMenuItem<Choice>(
                       value: choice,
                       child: Text(choice.title),
                     );
                   }).toList();
                 },
               ),
             ],
           ),
           body: Padding(
             padding: EdgeInsets.all(16.0),
             child: ChoiceCard(choice: _selectedChoice,),
           ),
         ),
       );
     }
}

class Choice {
  final String title;
  final IconData icon;
  const Choice({this.title, this.icon});
}

const List<Choice> choices = <Choice>[
  Choice(title: 'Car', icon: Icons.directions_car),
  Choice(title: 'Bicycle', icon: Icons.directions_bike),
  Choice(title: 'Boat', icon: Icons.directions_boat),
  Choice(title: 'Bus', icon: Icons.directions_bus),
  Choice(title: 'Train', icon: Icons.directions_railway),
  Choice(title: 'Walk', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  final Choice choice;
  const ChoiceCard({Key key, this.choice}) : super(key:key);
  @override
    Widget build(BuildContext context) {
      final TextStyle textStyle = Theme.of(context).textTheme.display1;
      return Card(
        color:Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,            
            children: <Widget>[
              Icon(choice.icon, size : 128.0, color:textStyle.color), 
              Text(choice.title, style: textStyle, ),
            ],
          ),
        ),
      );
    }
}

void main() {
  debugPaintSizeEnabled = true;
  runApp(BasicAppBarSample());
}