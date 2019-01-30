import 'package:flutter/material.dart';

class FriendlyChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _ChatRoom();
  }
}

class _ChatRoom extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChatRoomState();
  }
}

class _ChatRoomState extends State<_ChatRoom> {
  final TextEditingController _textEditingController = TextEditingController();
  bool _enabled = false;

  void _handleSubmitted(String msg) {
    setState(() {
      _textEditingController.clear();
      _enabled = false;
      //todo
    });
  }

  void _handleTextChanged(String value) {
    setState(() {
      _enabled = value.length != 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
              child: TextField(
            controller: _textEditingController,
            onChanged: _handleTextChanged,
            onSubmitted: _handleSubmitted,
            decoration: InputDecoration.collapsed(hintText: "send a message"),
          )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton(
                icon: Icon(
                  Icons.send,
                ),
                color: Theme.of(context).primaryColor,
                disabledColor: Colors.grey,
                onPressed: _enabled
                    ? () => _handleSubmitted(_textEditingController.text)
                    : null),
          ),
        ],
      ),
    );
  }
}
