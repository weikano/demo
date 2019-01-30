import 'package:flutter/material.dart';

class LifecycleWatcher extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LifecycleWatcherState();
  }
}

class _LifecycleWatcherState extends State<LifecycleWatcher>
    with WidgetsBindingObserver {
  AppLifecycleState _state;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    setState(() {
      _state = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        child: Text("The last lifecycle state is $_state"),
      ),
    );
  }
}
