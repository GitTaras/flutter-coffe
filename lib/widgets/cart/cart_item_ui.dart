import 'package:coffe/models/models.dart';
import 'package:flutter/material.dart';

class CartItemUi extends StatelessWidget {
  final CartItem item;
  final DismissDirectionCallback onDismissed;

  const CartItemUi({
    Key key,
    @required this.onDismissed,
    @required this.item
  }) : super(key: key);

  double _getPrice() {
    int quantity = this.item.goodsParams.quantity;
    double price = double.tryParse(this.item.good.price.replaceAll("\$", ""));
    return quantity * price;
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: UniqueKey(),
        onDismissed: onDismissed,
        background: Container(
          padding: EdgeInsets.only(left: 270),
          color: Colors.orange[800],
          child: Icon(Icons.cancel),
        ),
        direction: DismissDirection.endToStart,
        child: Container(
        margin: EdgeInsets.only(top: 4, bottom: 8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              //todo move price to right corner
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("${item.good.company ?? item.good.name}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24), softWrap: true,),
                  if (item.good.name != null) 
                    ...[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text("Brewing method: ${item.goodsParams.brewingMethod}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.grey[300])),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text("Coffe type: ${item.goodsParams.coffeType}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.grey[300])),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text("Packing: ${item.goodsParams.packing.toString()} kg", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.grey[300])),
                      ),
                    ],  
                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: 8.0),
                  //   child: Text("${item.good.about ?? ""}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.grey[300])),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text("Quantity: ${item.goodsParams.quantity}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.grey[300])),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text("${_getPrice()} \$", style: TextStyle(fontWeight: FontWeight.w600)),
                //IconButton(icon: Icon(Icons.more_vert),onPressed: () {},),
              ],
            ),
          ],
        ),
      ),
    );
  }
}