import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:isolate';

class IsolateDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IsolateDemoState();
  }
}

class _IsolateDemoState extends State<IsolateDemo> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  showLoadingDialog() {
    if (widgets.length == 0) {
      return true;
    }
    return false;
  }

  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  getListView() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      },
      itemCount: widgets.length,
    );
//    return RefreshIndicator(
//        child: ListView.builder(
//          itemBuilder: (BuildContext context, int position) {
//            return getRow(position);
//          },
//          itemCount: widgets.length,
//        ),
//        onRefresh: loadData);
  }

  loadData() async {
    ReceivePort receivePort = ReceivePort();
    await Isolate.spawn(dataLoader, receivePort.sendPort);
    SendPort sendPort = await receivePort.first;
    List msg = await sendReceive(
        sendPort, 'http://jsonplaceholder.typicode.com/posts');
    setState(() {
      widgets = msg;
    });
  }

  static dataLoader(SendPort sendPoint) async {
    ReceivePort port = ReceivePort();
    sendPoint.send(port.sendPort);
    await for (var msg in port) {
      String data = msg[0];
      SendPort replyTo = msg[1];
      String dataUrl = data;
      http.Response response = await http.get(dataUrl);
      replyTo.send(JsonCodec().decode(response.body));
    }
  }

  Future sendReceive(SendPort port, msg) {
    ReceivePort response = ReceivePort();
    port.send([msg, response.sendPort]);
    return response.first;
  }

  getRow(int i) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text('Row ${widgets[i]["title"]}'),
    );
  }

  getProgressDialog() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return getBody();
  }
}
