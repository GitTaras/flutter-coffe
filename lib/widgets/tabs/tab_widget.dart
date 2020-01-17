import 'dart:async';
import 'package:flutter/material.dart';
import 'package:coffe/models/good.dart';
import 'package:coffe/widgets/magazine/product_widget.dart';
import 'package:coffe/api/products.dart';

class TabWidget extends StatefulWidget {
  
  final String name;
  final String url;

  TabWidget({
    Key key,
    this.name,
    @required this.url,
  }) : super(key: key ?? Key(url));

  @override
  _TabWidgetState createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  Future <List <Good>> products;

  @override
  void initState() {
    super.initState();
    debugPrint("init ${widget.url}");
    products = loadGoods(widget.url);
  }

  @override
  void dispose() {
    debugPrint("dispose ${widget.url}");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build ${widget.url}');
    return FutureBuilder(
      future: products,
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
          return GridView.count(
            //physics: ClampingScrollPhysics(),
            //shrinkWrap: true,
            //primary: false,
            crossAxisSpacing: 2,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            children: snapshot.hasData ? List.generate(snapshot.data.length, (index) {
              return             
                Card(
                    color: Color.fromARGB(125, 0, 170, 255),
                    margin: EdgeInsets.all(2),
                    child: InkWell(
                      splashColor: Colors.white.withAlpha(30),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ProductPage(snapshot.data[index])));
                        print('Card tapped. $widget');
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 170,
                            //height: 0,
                            decoration: BoxDecoration(color: Colors.grey),
                            child: Image.network(snapshot.data[index].picture),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                          ),
                          Text('${snapshot.data[index].company}', textAlign: TextAlign.start, style: Theme.of(context).textTheme.subhead.copyWith(fontWeight: FontWeight.bold),),
                          Text('${snapshot.data[index].price}', textAlign: TextAlign.start, style: Theme.of(context).textTheme.subhead.copyWith(fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                
              );
            }) : List.generate(1, (index) {return Text('no one item here', textAlign: TextAlign.center,);}) 
          );
        }
      },
    );
  }
}
