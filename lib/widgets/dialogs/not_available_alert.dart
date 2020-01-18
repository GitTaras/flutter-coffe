import 'package:flutter/material.dart';

class NotAvailableAlert extends StatelessWidget {
  const NotAvailableAlert({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Not available for this coffe type', textAlign: TextAlign.center),
      actions: <Widget>[
        FlatButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

