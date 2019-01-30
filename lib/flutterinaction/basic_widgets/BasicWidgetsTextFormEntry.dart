import 'package:demo/flutterinaction/basics.dart';
import 'package:demo/flutterinaction/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BasicWidgetsTextFormEntry extends BaseEntryStatePage {
  @override
  BaseEntryPageState<BaseEntryStatePage> createStateImpl() {
    return _State();
  }

  @override
  String get iconUrl => null;

  @override
  String get routeName => basicWidgetsSub("textform");

  @override
  String get title => "输入框和表单";

  @override
  // TODO: implement url
  String get url => null;
}

class _State extends BaseEntryPageState<BasicWidgetsTextFormEntry> {
  @override
  void dispose() {
    _nameController.dispose();
    _pwdController.dispose();
    super.dispose();
  }

  var _nameController = TextEditingController();
  var _pwdController = TextEditingController();
  GlobalKey _key = GlobalKey<FormState>();

  @override
  Widget createBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _key,
        autovalidate: true,
        child: Column(
          children: <Widget>[
            TextFormField(
              autofocus: true,
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名/邮箱/手机号",
                icon: Icon(Icons.person),
              ),
              validator: (v) {
                return v.trim().length > 0 ? null : "用户名不能为空";
              },
            ),
            TextFormField(
              controller: _pwdController,
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "请输入密码",
                icon: Icon(Icons.lock),
              ),
              obscureText: true,
              validator: (v) {
                return v.trim().length > 5 ? null : "密码不能少于6位";
              },
            ),
            RaisedButton(
              child: Text("登录"),
              onPressed: () {
                if ((_key.currentState as FormState).validate()) {
                  print(
                      "验证通过，用户名${_nameController.text}+密码${_pwdController.text}");
                }
              },
            ),
          ],
        ),
      ),
    );

//    return SingleChildScrollView(
//      child: Column(
//        children: <Widget>[
//          Divider(),
//          Text("无法移动焦点，why"),
//          Divider(),
//          TextField(
//            autofocus: true,
//            focusNode: focusNode1,
//            decoration: InputDecoration(
//              labelText: "input1",
//            ),
//          ),
//          TextField(
//            focusNode: focusNode2,
//            decoration: InputDecoration(labelText: "input2"),
//          ),
//          Divider(),
//          RaisedButton(
//            child: Text("移动焦点"),
//            onPressed: () {
//              print('移动焦点');
//              FocusScope.of(context).requestFocus(focusNode2);
//            },
//          ),
//          RaisedButton(
//            child: Text("隐藏键盘"),
//            onPressed: () {
//              print('隐藏键盘');
//              focusNode1.unfocus();
//              focusNode2.unfocus();
//            },
//          ),
//        ],
//      ),
//    );
  }
}
