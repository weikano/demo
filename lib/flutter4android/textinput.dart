import 'package:flutter/material.dart';

class TextInputDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextInputState();
  }
}

class _TextInputState extends State<TextInputDemo> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(hintText: 'Type something'),
              obscureText: true,
            ),
            RaisedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    child: AlertDialog(
                      title: Text('What you typed'),
                      content: Text(_controller.text),
                    ));
              },
              child: Text('Done'),
            )
          ],
        ),
      ),
    );
  }
}
