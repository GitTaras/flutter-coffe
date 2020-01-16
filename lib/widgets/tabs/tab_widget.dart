/*[
  {'repeat(5, 7)': 
  	{
    _id: '{{objectId()}}',
    isActive: '{{bool()}}',
    price: '{{integer(100, 400, "$0,0")}}',
    picture: 'http://placehold.it/32x32',    
    company: '{{company().toUpperCase()}}',
    email: 'bla.bla@mail.dr',
    about: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum'
  	}
  },
]
*/
// name
// from tab_names
// url,
// get /accessories?type=""
//import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:coffe/models/good.dart';
import 'package:http/http.dart' as http; 
import 'package:coffe/widgets/magazine/product_widget.dart';
import 'package:coffe/helper/failureMessage.dart';

Future <List <Good>> loadGoods(String param) async {
  List <Good> products = [];
  try {
    // in real app change api to 'goods/$param'
    final responce = await http.get("http://next.json-generator.com/api/json/get/Ny9qlsJpP");    
    if (responce.statusCode == 200) {
      var jsonData = json.decode(responce.body);
      for (var i in jsonData) {
        var product = Good.fromJson(i);
        print(product);
        products.add(Good.fromJson(i));
      } 
      return products;
    } else {
      throw HttpException('Failed to load with code ${responce.statusCode}');
    }
  } on SocketException {
    throw FailureMessage('No Internet connection');
  } on HttpException {
    throw FailureMessage('Nothing found');
  } on FormatException {
    throw FailureMessage('Bad responce format');
  } on Exception catch (e) {
    debugPrint('error: ${e.toString()}');
    throw FailureMessage('Unexpected error');
  }
}

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
            // todo change heigth of items
            // network error output
            crossAxisCount: 2,
            childAspectRatio: 2.0,
            children: snapshot.hasData ? List.generate(snapshot.data.length, (index) {
              return Card(
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
                          height: 120,
                          decoration: new BoxDecoration(color: Colors.grey),
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
