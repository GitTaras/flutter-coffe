import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:coffe/keys.dart';

class AboutWidget extends StatelessWidget {
  
  final String paragraphText = '''In our service you can buy different coffe types, specify roasting, packing, brewing method. And we get it to your home as fast as possible.''';
  final List<String> payMethods = ["Visa or Master Card", "Pay Pel or Stripe"];
  final List<String> deliveryMethods = ["Justin", '''Express delivery for 5kg - 20\$, more - free'''];
  final List<String> contacts = ["phone: +5602030402", "email: soe.tim@glo.cu"];

  final subStyle = TextStyle(fontWeight: FontWeight.normal, fontSize: 14,color: Colors.white70);

  Widget decoration() => 
    Container(
      height: 15.0,
      width: 15.0,
      decoration: BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
      ),
    );

  AboutWidget({Key key})
      : super(key: key ?? CoffeAppKeys.aboutScreen);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        centerTitle: true,
      ),
      body:
        ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 2.0, left: 2.0, bottom: 10),
              child: Text(
                "About service",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),   
              ),
            ),
            Divider(height: 3, color: Colors.grey),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 2, right: 2, bottom: 10),
              child: Text(
                paragraphText,
                textAlign: TextAlign.justify,
                style: subStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "Payment",
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            for(String p in payMethods)
              Padding(
                padding: const EdgeInsets.only(top: 6, bottom: 6),
                child: Text(
                  "* $p",
                  textAlign: TextAlign.left,
                  style: subStyle,
                ),
              ), 
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "Delivery",
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            ...deliveryMethods.map((d) =>
              Padding(
                padding: const EdgeInsets.only(top: 6, bottom: 6),
                child: Text(
                  d,
                  textAlign: TextAlign.left,
                  style: subStyle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "Contacts",
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            for(String c in contacts)
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,                
                  children: <Widget>[
                    decoration(),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        c,
                        textAlign: TextAlign.left,
                        style: subStyle,
                      ),
                    ),
                  ],
                ),
              )
          ],
        )
    );
  }
}