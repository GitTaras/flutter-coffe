import 'package:coffe/blocs/blocs.dart';
import 'package:coffe/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coffe/models/models.dart';
import 'package:coffe/widgets/cart/cart_item.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key key}) : super(key: key);

  double _getSum(List<Good> goods) {
    double start = double.tryParse(goods[0].price.replaceAll("\$", ""));
    goods.skip(1).forEach((e) {
      start += double.tryParse(e.price.replaceAll("\$", ""));
    });
    return start;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cart", textAlign: TextAlign.center),
      ),
      body: BlocBuilder<GoodsBloc, GoodsState>(
        builder: (context, goodsInCart) {
          if (goodsInCart is GoodsLoaded && goodsInCart.goods.length > 0) {
            final goods = goodsInCart.goods;
            return Container(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
              height: 700,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.separated(
                        key: CoffeAppKeys.cartList, 
                        itemCount: goods.length,
                        separatorBuilder: (__, index) => Divider(height: 2,),
                        itemBuilder: (__, index) {
                          final item = goods[index];
                          return CartItem(
                            onDismissed: (direction) {
                              BlocProvider.of<GoodsBloc>(__).add(DeleteGood(index));
                            },
                            item: item
                          );
                      }),
                    ),
                    Container(
                      height: 100,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Summary price",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  Text(" ${_getSum(goods)} \$",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                //side: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(5.0)),
                            onPressed: () {},
                            child: Text("Buy"),
                          ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return Center(child: Text("Cart is empty"));  
          }
        }
      )
    );
  }
}  