import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coffe/blocs/blocs.dart';

class CartWithBadge extends StatelessWidget {
  CartWithBadge({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {
          Navigator.pushNamed(context, "/cart");
        }),
        BlocBuilder<GoodsBloc, GoodsState>(
          builder: (context, goodsState) {
            if(goodsState is GoodsLoaded && goodsState.goodsInCart.length > 0) {
            final goodsCount = goodsState.goodsInCart.length;
              return Positioned(
                right: 11,
                top: 11,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Text(
                    '$goodsCount',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );    
            } else {
              return Container();
            }
          }
        )
        ]
    );
  }
}