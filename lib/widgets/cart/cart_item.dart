import 'package:coffe/keys.dart';
import 'package:coffe/models/models.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final Good item;
  final DismissDirectionCallback onDismissed;

  const CartItem({
    Key key,
    @required this.onDismissed,
    @required this.item
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: UniqueKey(),  //CoffeAppKeys.cartItem(item.id),
        onDismissed: onDismissed,
        direction: DismissDirection.endToStart,
        // todo https://www.youtube.com/watch?v=iEMgjrfuc58
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
                  Text("${item.company}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24), softWrap: true,),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text("${item.about ?? ""}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.grey[300])),
                  ),
                  //Text("Quantity: ${item.quantity}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.grey[300])),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text("${item.price.replaceAll("\$", "")} \$", style: TextStyle(fontWeight: FontWeight.w600)),
                IconButton(icon: Icon(Icons.more_vert),onPressed: () {},),
              ],
            ),
          ],
        ),
      ),
    );
  }
}