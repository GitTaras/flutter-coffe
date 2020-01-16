import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:todos_app_core/todos_app_core.dart';
//import 'package:coffe/helper/localization.dart';
import 'package:coffe/keys.dart';

import 'package:coffe/widgets/cart_with_badge.dart';
import 'package:coffe/widgets/coffe/coffe_list.dart';



/*Future<Map <String, dynamic>> loadFilters() async {
  Map <String, dynamic> filters;
  try {
    // in real app change api to 'coffe/'
    final responce = await http.get("");    
    if (responce.statusCode == 200) {
      var jsonData = json.decode(responce.body);
      for (var i in jsonData) {
        var product = Coffe.fromJson(i);
        print(product);
        products.add(Coffe.fromJson(i));
      } 
      //debugPrint('from future products length ${products.length}');
      return products;
    } else {
      throw HttpException('Failed to load with code ${responce.statusCode}');
    }
  } on SocketException {
    throw FailureMessage('No Internet connection');
  } on HttpException {
    throw FailureMessage('Nothing found');
  } on FormatException {
    throw FailureMessage('Bad responce format');
  } on Exception catch (e) {
    debugPrint('error: ${e.toString()}');
    throw FailureMessage('Unexpected error');
  }
}*/

class CoffeWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  CoffeWidget({Key key}) 
    : super(key: key ?? CoffeAppKeys.coffeScreen);

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
                    // print('hasDrawer: ${Scaffold.of(context).hasDrawer}');
                    // print(Scaffold.of(context).widget.drawer);
                    //print('hasDrawer: ${scaffoldKey.currentState.hasDrawer}');
                    scaffoldKey.currentState.openDrawer();
                  },
                ),
                FlatButton(
                  color: Colors.white,
                  textColor: Colors.black,
                  shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(5.0)),
                  onPressed: () {

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
      drawer: __myDrawer(scaffoldKey),
      body: 
          Column(
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

  /*class MyDrawer extends StatelessWidget {
    const MyDrawer({Key key,
      @required GlobalKey<ScaffoldState> scaffoldKey,
      Map<String, List<String> filters
    }) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return 
    }
  }*/


  Widget __myDrawer (GlobalKey<ScaffoldState> scaffoldKey, {Map<String, List<String>> filters}) => 
    Container(
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
              Icons.cloud_done,
              color: Colors.white,
            ),
            title: Text(
              'Drawer is cool',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            trailing: Icon(
              Icons.expand_more,
              color: Colors.white,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.image,
              color: Colors.white,
            ),
            title: Text(
              'Flutter is awesome',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            trailing: Icon(
              Icons.expand_more,
              color: Colors.white,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.graphic_eq,
              color: Colors.white,
            ),
            title: Text(
              'Drawer initialization',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            trailing: Icon(
              Icons.expand_more,
              color: Colors.white,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.child_care,
              color: Colors.white,
            ),
            title: Text(
              'See you soon!',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            trailing: Icon(
              Icons.expand_more,
              color: Colors.white,
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
                  scaffoldKey.currentState.openDrawer();
                  //Navigator.pop();  
                },
              ),              
              FlatButton(
                child: Text('Accept', textAlign: TextAlign.center),
                disabledColor: Colors.white10,
                onPressed: () {
                  //Navigator.pop();
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}