import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileIODemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FileIOState();
  }
}

class _FileIOState extends State<FileIODemo> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<int> _readCounter() async {
    try {
      File file = await _getLocalFile();
      String content = await file.readAsString();
      return int.parse(content);
    } on FileSystemException catch (e) {
      print('Failed to read counter : ${e.message}');
      return 0;
    }
  }

  Future<Null> _incrementCount() async {
    setState(() {
      _counter++;
    });
    await (await _getLocalFile()).writeAsString('$_counter');
  }

  Future<File> _getLocalFile() async {
    String dir = (await getTemporaryDirectory()).path;
    print('File dir is $dir');
    return File('$dir/counter.txt');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                    'Button tapped $_counter(time${_counter > 1 ? 's' : ''})'),
              ),
              RaisedButton(
                onPressed: _incrementCount,
                child: Icon(Icons.add),
              )
            ],
          ),
        ),
      ),
    );
  }
}
