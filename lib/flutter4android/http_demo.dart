import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

class HttpDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HttpState();
  }
}

class _HttpState extends State<HttpDemo> {
//  TextEditingController _controler = TextEditingController();
  String _ipAddress = 'Unknown';

  _getIPAddress() async {
    var client = HttpClient();
    var url = 'https://httpbin.org/ip';
    String result;
    try {
      var request = await client.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(Utf8Decoder()).join();
        var data = JsonDecoder().convert(json);
        result = data['origin'];
      } else {
        result =
            'Error getting IP Address :\http status ${response.statusCode}';
      }
    } catch (e) {
      result = 'Failed getting IP Address';
    }

    if (mounted) {
      setState(() {
        _ipAddress = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(_ipAddress),
                  RaisedButton(
                    onPressed: _getIPAddress,
                    child: Text('GetIpAddress'),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
