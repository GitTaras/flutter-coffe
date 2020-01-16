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
    //debugPrint("init coffe");
    coffeList = loadCoffe();
  }

  @override
  void dispose() {
    //debugPrint("dispose");
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
        } else if(snapshot.connectionState == ConnectionState.done) {
          if(snapshot.hasError) {
            return Container(
              color: Colors.greenAccent,
              child: FractionallySizedBox(
                widthFactor: .8,
                heightFactor: .8,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.amber,
                      minRadius: 25,
                      child: Icon(Icons.error),
                    ),
                    Text('Error: ${snapshot.error.toString()}', softWrap: true, textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25, color: Colors.red)),
                  ],
                  mainAxisSize: MainAxisSize.max,
                )
            ));
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