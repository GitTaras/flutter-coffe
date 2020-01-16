import 'package:coffe/models/coffe.dart';
import 'package:coffe/widgets/coffe/coffe_form.dart';
import 'package:flutter/material.dart';

class CoffeItem extends StatelessWidget {
  final Coffe item;
  const CoffeItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Text('${item.name}'),
          ),
          Text(item.price)
        ],
      ),
      leading: Checkbox(
        value: false,
        onChanged: (bool newValue) {
          Navigator.push(context, 
            MaterialPageRoute(
              builder: (BuildContext context) => CoffeForm(coffe: item)
            )
          );
          //Navigator.pushNamed(context, "/form", arguments: item);
        },
      ),
      children: <Widget>[
        Image.network(item.picture),
        Divider(height: 2,color: Colors.blueGrey),
        Text(item.taste),
        Divider(height: 2,color: Colors.blueGrey),
        Text(item.cornType),
        Divider(height: 2,color: Colors.blueGrey),
        Text(item.originGeography),
        Divider(height: 2,color: Colors.blueGrey),
        Text(item.region),
      ],
    );
  }
}