import 'package:flutter/material.dart';

final dialogTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w700);

class NotImplemented extends StatelessWidget {
  const NotImplemented({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titleTextStyle: dialogTextStyle,
      title: Text('Not implemented yet', textAlign: TextAlign.center),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Implemented soon this feature will be...'),
          ],
        ),
      ),
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