import 'package:coffe/models/coffe.dart';
import 'package:coffe/widgets/coffe/coffe_form.dart';
import 'package:flutter/material.dart';

final subTextStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);

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
        },
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 100,
            width: 75,
            child: Image.network(item.picture),
          )
        ),
        const SizedBox(height: 10),
        Divider(height: 2,color: Colors.blueGrey),
        const SizedBox(height: 10),
        Text("Taste: ${item.taste}", style: subTextStyle),
        const SizedBox(height: 10),
        Divider(height: 2,color: Colors.blueGrey),
        const SizedBox(height: 10),
        Text("Corn Type: ${item.cornType}", softWrap: true, style: subTextStyle, textAlign: TextAlign.center),
        const SizedBox(height: 10),
        Divider(height: 2,color: Colors.blueGrey),
        const SizedBox(height: 10),
        Text("Origin Geography: ${item.originGeography}", style: subTextStyle),
        const SizedBox(height: 10),
        Divider(height: 2,color: Colors.blueGrey),
        const SizedBox(height: 10),
        Text("Region: ${item.region}", style: subTextStyle),
        const SizedBox(height: 10),
      ],
    );
  }
}