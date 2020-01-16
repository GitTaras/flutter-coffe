import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coffe/keys.dart';
//import 'package:coffe/helper/localization.dart';
//import 'package:todos_app_core/todos_app_core.dart';



class AboutWidget extends StatelessWidget {
  
  final String aboutText = '''Lorem ipsum dolor sit amet, consectetur adipisicing
  elit, sed do eiusmod tempor incididunt ut; labore et dolore magna aliqua. 
  Ut enim ad minim veniam,strud exercitation ullamco laboris nisi ut aliquip ex ea commodo. 
  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut;
  labore et dolore magna aliqua. Ut enim ad minim veniam,strud exercitation ullamco laboris nisi
   ut aliquip ex ea commodo. Ut enim ad minim veniam,strud exercitation ullamco laboris nisi ut aliquip ex ea commodo. 
  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut;
  labore et dolore magna aliqua. Ut enim ad minim veniam,strud exercitation ullamco laboris nisi
   ut aliquip ex ea commodo ''';

  AboutWidget({Key key})
      : super(key: key ?? CoffeAppKeys.aboutScreen);

  @override
  Widget build(BuildContext context) {
    // final localizations = ArchSampleLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        // title: Text(localizations.todoDetails),
        title: Text('About'),
        centerTitle: true,
      ),
      body:
        ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 2.0, left: 2.0),
                  child: Text(
                    "Header",
                     textAlign: TextAlign.center,
                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),   
                  ),
                ),
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 5, left: 2, right: 2),
                    child: Text(
                      aboutText,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                    ),
                  ),
                ),
              ]
            ),
          ],
        )
    );
  }
}