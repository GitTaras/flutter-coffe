import 'package:coffe/widgets/error/network_error.dart';
import 'package:flutter/material.dart';
import 'package:coffe/models/coffe.dart';
import 'package:coffe/widgets/coffe/coffe_item.dart';
import 'package:coffe/api/products.dart';

class CoffeList extends StatefulWidget {
  CoffeList({Key key}) : super(key: key);

  @override
  _CoffeListState createState() => _CoffeListState();
}

class _CoffeListState extends State<CoffeList> {
  Future <List <Coffe>> coffeList;

  @override
  void initState() { 
    super.initState();
    coffeList = loadCoffe();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: coffeList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            heightFactor: .5,
            widthFactor: .5,
            child: CircularProgressIndicator()
          ); 
        } 
        if(snapshot.connectionState == ConnectionState.done) {
          if(snapshot.hasError) {
            return NetworkError(widthFactor: .8, heigthFactor: .8, error: snapshot.error.toString());
          }
          if (snapshot.hasData) {
            print('snapshot has DATA');
            return ListView.separated(
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return CoffeItem(item: snapshot.data[index]);
              },
            );
          }
        }
      },
    );
  }
}