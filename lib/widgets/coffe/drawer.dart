import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  //Map<String, List<String>> filters
  const MyDrawer({Key key, this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    width: 300.0,
    color: Colors.lightBlue[900],
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView(
            children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.child_care,
              color: Colors.white,
            ),
            title: Text(
              'Filters will be soon!',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),  
            ],
          ),
          ),
          ButtonBar(
            mainAxisSize: MainAxisSize.max,
            alignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton(
                child: Text('Cancel', textAlign: TextAlign.center),
                disabledColor: Colors.white10,
                onPressed: () {
                  Navigator.of(scaffoldKey.currentContext).pop();  
                },
              ),              
              FlatButton(
                child: Text('Accept', textAlign: TextAlign.center),
                disabledColor: Colors.white10,
                onPressed: () {
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
  }
}