import 'package:coffe/widgets/coffe/drawer.dart';
import 'package:coffe/widgets/dialogs/not_implemented.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:coffe/keys.dart';
import 'package:coffe/widgets/cart_with_badge.dart';
import 'package:coffe/widgets/coffe/coffe_list.dart';

class CoffeWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  CoffeWidget({Key key}) 
    : super(key: key ?? CoffeAppKeys.coffeScreen);

  Future<void> _beSoon(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return NotImplemented();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: null,
        automaticallyImplyLeading: false,
        title: Text('My Coffe', style: Theme.of(context).primaryTextTheme.title,),
        centerTitle: true,
        actions: <Widget>[
          CartWithBadge(),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: Container(
            // height: 48,
            alignment: Alignment.centerLeft,
            child: ButtonBar(
              children: <Widget>[
                FlatButton.icon(
                  textColor: Colors.black,
                  color: Colors.white,
                  icon: Icon(Icons.format_list_bulleted),
                  label: Text('Filter', textAlign: TextAlign.center),
                  shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(5.0)),
                  onPressed: () {
                    scaffoldKey.currentState.openDrawer();
                  },
                ),
                FlatButton(
                  color: Colors.white,
                  textColor: Colors.black,
                  shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(5.0)),
                  onPressed: () {
                    _beSoon(context);
                  },
                  child: Text('Multiple', textAlign: TextAlign.center),
                )
              ],
              alignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
            )
          )
        ),
      ),
      drawer: MyDrawer(scaffoldKey: scaffoldKey,),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.grey,
            child: Row(
              children: <Widget>[
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: Center(child: Text('SORT NAMING', style: TextStyle(color: Colors.white),)),
                ),
                Text('PRICE\nUSD/250G', textAlign: TextAlign.center, style: TextStyle(color: Colors.white),softWrap: true),
              ], 
            )
          ),
          Expanded(
            child: CoffeList(),
          )
        ],
      ),
    );
  }
}