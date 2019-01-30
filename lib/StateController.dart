import 'package:flutter/material.dart';

main() => runApp(StateController());

final decorationActive = BoxDecoration(
  color: Colors.lightGreen[700],
);
final decorationInactive = BoxDecoration(
  color: Colors.grey,
);

final textStyle = TextStyle(
  color: Colors.white,
  fontSize: 32.0,
);

class StateController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StateController',
      home: Scaffold(
        appBar: AppBar(
          title: Text("StateController"),
        ),
        body: _StateConrollerContainer(),
      ),
    );
  }
}

class _StateConrollerContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateControllerState();
  }
}

class _StateControllerState extends State<_StateConrollerContainer> {
  bool _bstate = false;
  bool _cstate = false;

  void _handleChange(bool state) {
    setState(() {
      _bstate = state;
    });
  }

  void _handleCChange(bool state) {
    setState(() {
      _cstate = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(child: _TapboxA()),
        Expanded(
            child: _TapboxB(
          active: _bstate,
          onChanged: _handleChange,
        )),
        Expanded(
          child: _TapboxC(
            active: _cstate,
            onChanged: _handleCChange,
          ),
        ),
      ],
    );
  }
}

class _TapboxA extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TapboxAState();
  }
}

class _TapboxAState extends State<_TapboxA> {
  bool _active = false;

  void handleState() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleState,
      child: Container(
        width: 200.0,
        height: 200.0,
        child: Center(
          child: Text(
            _active ? 'Activated' : 'Inactive',
            style: textStyle,
          ),
        ),
        decoration: _active ? decorationActive : decorationInactive,
      ),
    );
  }
}

/**
 * 传入onChanged方法来监管
 */
class _TapboxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  _TapboxB({this.active, @required this.onChanged});

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200,
        height: 200,
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: textStyle,
          ),
        ),
        decoration: active ? decorationActive : decorationInactive,
      ),
    );
  }
}

class _TapboxC extends StatefulWidget {
  _TapboxC({this.active, this.onChanged});

  bool active;

  final ValueChanged<bool> onChanged;

  @override
  State<StatefulWidget> createState() {
    return _TapBoxCState();
  }
}

class _TapBoxCState extends State<_TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails _) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails _) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    setState(() {
      widget.onChanged(!widget.active);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        width: 200,
        height: 200,
        child: Center(
          child: Text(
            widget.active ? 'Active' : 'Inactive',
            style: textStyle,
          ),
        ),
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey,
          border: _highlight
              ? Border.all(color: Colors.teal[700], width: 10)
              : null,
        ),
      ),
    );
  }
}
