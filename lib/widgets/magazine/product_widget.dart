import 'package:coffe/keys.dart';
import 'package:coffe/models/good.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:coffe/widgets/magazine/buttons_group.dart';
import 'package:coffe/widgets/cart_with_badge.dart';

class ProductPage extends StatelessWidget {
  final Good product;
  ProductPage(this.product, {Key key, }) : super(key : key ?? CoffeAppKeys.productScreen);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(product.company),
        actions: <Widget>[
          CartWithBadge(),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: [
                  Image.network(product.picture),
                  Text('${product.price} ${product.company}', textAlign: TextAlign.start, style: Theme.of(context).textTheme.subhead.copyWith(fontWeight: FontWeight.bold, fontSize: 35)),
                  Divider(height: 4, color: Colors.grey,),
                  Text(product.about, style: Theme.of(context).textTheme.subhead.copyWith(fontWeight: FontWeight.bold)),
                ],
                semanticChildCount: 4,
              ),
            ),
            ButtonsGroup(product: product),
          ],
        ),
      )
    );
  }
}