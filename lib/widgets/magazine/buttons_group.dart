import 'package:coffe/blocs/blocs.dart';
import 'package:coffe/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonsGroup extends StatefulWidget {
  final Good product;
  ButtonsGroup({
    Key key,
    @required this.product
  }) : super(key: key);
  
  @override
  _ButtonsGroupState createState() => _ButtonsGroupState();
}

class _ButtonsGroupState extends State<ButtonsGroup> {
  
  final TextEditingController _controller = TextEditingController.fromValue(TextEditingValue(text: "1"));

  @override
  void dispose() { 
    _controller.dispose();
    super.dispose();
  }

  void addToCart (BuildContext context) {
    int quantity = int.tryParse(_controller.text);
    if (quantity != null && quantity > 0 && quantity < 99) {
      print("${widget.product}, $quantity");
      GoodsParams params = GoodsParams(quantity);
      CartItem goodInCart = CartItem(widget.product, params);
      BlocProvider.of<GoodsBloc>(context).add(AddGood(goodInCart));
      //widget.onAdd(widget.product, quantity);
    }
  }

  void incCount() {
    int value = int.tryParse(_controller.text);
    if (value != null && value >= 0) {
      if (value == 99) {
        _controller.text = value.toString();
        return;
      }  
      _controller.text = (++value).toString(); 
    }
  }

  void decCount() {
    int value = int.tryParse(_controller.text);
    if (value != null && value > 0) {
      if (value == 1) {
        print('one');
        _controller.text = value.toString();
        return;
      } 
      print('more then'); 
      _controller.text = (--value).toString(); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: <Widget>[
      Flexible(
        flex: 5,
        child: Row (
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // alignment: WrapAlignment.center,
          // direction: Axis.horizontal,
          children: <Widget>[
            IconButton(onPressed: () {
              incCount();
            }, icon: Icon(Icons.add)),
            Container(
              margin: const EdgeInsets.only(left: 4, right:4),
              width: 50,
              //height: 100,
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.numberWithOptions(signed: false, decimal: true),
                maxLength: 2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            IconButton(onPressed: () {
              decCount();
            }, icon: Icon(Icons.remove)),
          ],
        )
      ),  
      Flexible(
        flex: 5,
        child: Align(
          alignment: Alignment.center,
          child: RaisedButton.icon(
            icon: Icon(Icons.add_shopping_cart),
            label: Text('Buy'),
            onPressed: () {
              addToCart(context);
            },
          ),
        ), 
      ),
    ],);
  }
}