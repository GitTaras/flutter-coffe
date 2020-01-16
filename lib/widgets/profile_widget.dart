import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:coffe/keys.dart';
import 'package:coffe/widgets/cart_with_badge.dart';

const Bold14 = TextStyle(color: Colors.white60, fontWeight: FontWeight.bold, fontSize: 14);
const Bold18 = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);

class ProfileWidget extends StatelessWidget {
  ProfileWidget({Key key}) 
    : super(key: key ?? CoffeAppKeys.profileScreen);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'My profile',
            // style: Theme.of(context).primaryTextTheme.title,
          ),
        centerTitle: true,
        actions: <Widget>[
          CartWithBadge()
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  fit: FlexFit.tight,
                  child: FlatButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Column(
                      children: <Widget> [
                        Padding(
                          padding: EdgeInsets.only(top: 4, bottom: 2),
                          child: Text('Log-In', textAlign: TextAlign.start, style: Bold18),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2, bottom: 4),
                          child: Text('Using Coffe account', textAlign: TextAlign.start, style: Bold14),
                        ),    
                      ]
                    ),
                  ),
                ),
              ],
            ),
            Divider(color: Colors.grey,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  fit: FlexFit.tight,
                  child: FlatButton(
                    child: Column (
                      children: <Widget> [
                        Padding(
                          padding: const EdgeInsets.only(top: 4, bottom: 2),
                          child: Text('Register', textAlign: TextAlign.start, style: Bold18),
                        ),  
                        Padding(
                          padding: const EdgeInsets.only(top: 2, bottom: 4),
                          child: Text('Create new account', textAlign: TextAlign.start, style: Bold14),
                        ),    
                      ]
                    ), 
                    onPressed: (){
                      Navigator.pushNamed(context, '/register');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}


// return Column(
//       children: <Widget>[
//         MyAppBar(
//           title: 
//         ),
//         Expanded(
          
//         ),
//       ],
//     );

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0, // in logical pixels
      //padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.black),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          /*IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, // null disables the button
          ),*/
          // Expanded expands its child to fill the available space.
          Expanded(
            flex: 1,
            child: Center(
              child: title,
            )
          ),
          IconButton(
            icon: Icon(Icons.card_giftcard),
            tooltip: 'Cart',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}