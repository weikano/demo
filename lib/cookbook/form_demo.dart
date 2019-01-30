import 'package:flutter/material.dart';

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final appTitle = 'Form Validation Demo';
//
//    return MaterialApp(
//      title: appTitle,
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text(appTitle),
//        ),
//        body: MyCustomForm(),
//      ),
//    );
//  }
//}

// Create a Form Widget
class FormDemo extends StatefulWidget {
  @override
  FormDemoState createState() {
    return FormDemoState();
  }
}

// Create a corresponding State class. This class will hold the data related to
// the form.
class FormDemoState extends State<FormDemo> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
              },
              initialValue: 'wkswind@gmail.com',
              decoration: const InputDecoration(
                icon: Icon(Icons.email),
                hintText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              initialValue: '123456',
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
              },
              decoration:
                  InputDecoration(icon: Icon(Icons.phone), hintText: 'PHONE'),
              keyboardType: TextInputType.phone,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, we want to show a Snackbar
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')));
                  }
                },
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.title.color,
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
