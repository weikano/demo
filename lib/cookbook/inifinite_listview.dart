import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class InfiniteListViewDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InfiniteListViewState();
  }
}

class _InfiniteListViewState extends State<InfiniteListViewDemo> {
  static const _LOADING_TAG = '##LOADING##';
  var _words = <String>[_LOADING_TAG];

  @override
  void initState() {
    super.initState();
    _retriveData();
  }

  void _retriveData() async {
    await Future.delayed(const Duration(seconds: 2));
    _words.insertAll(_words.length - 1,
        generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
    setState(() {});
//    Future.delayed(Duration(seconds: 2)).then((e) {
//      _words.insertAll(
//          _words.length - 1,
//          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
//      setState(() {});
//    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        if (_words[index] == _LOADING_TAG) {
          if (_words.length - 1 < 100) {
            _retriveData();
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                ),
              ),
            );
          } else {
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '没有更多了',
                style: TextStyle(color: Colors.grey),
              ),
            );
          }
        } else {
          return ListTile(
            title: Text(_words[index]),
            subtitle: Text('index $index'),
          );
        }
      },
      separatorBuilder: (context, index) => Divider(
            height: .0,
          ),
      itemCount: _words.length,
    );
  }
}
