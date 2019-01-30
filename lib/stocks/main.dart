import 'package:flutter/material.dart';
import 'stock_home.dart';

main() {
  runApp(MaterialApp(
    title: 'Stocks',
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.purple,
      accentColor: Colors.purpleAccent,
    ),
    home: StockHome(),
  ));
}
