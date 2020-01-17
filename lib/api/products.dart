import 'package:coffe/models/coffe.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http; 
import 'dart:convert';
import 'package:coffe/helper/failureMessage.dart';
import 'package:coffe/models/good.dart';

/*
[
  {
    'repeat(5, 10)': {
      _id: '{{objectId()}}',
      isActive: '{{bool()}}',
      price: '{{floating(50, 400, 2, "$0,0.00")}}',
      picture: 'http://placehold.it/32x32',
      name: '{{company().toUpperCase()}} {{company().toUpperCase()}}',
      cornType: '{{random("arabica", "robusta", "liberica", "excelsa ")}}',
      country: '{{random("Africa", "Brasilia", "Ephiopia", )}}',
      taste: '{{random("vine sourness", "sweet", "acute", "soft")}}, {{random("grapefruit", "yellow apple", "milk chocolate", "balanced")}}, {{random("hazelnut", "black cherry", "peach", "sweet")}}, {{random("grapefruit", "yellow apple", "milk chocolate", "balanced")}}',
      originGeography: '{{country()}}',
      region:  '{{sity()}}'
      /*age: '{{integer(20, 40)}}',
      eyeColor: '{{random("blue", "brown", "green")}}',
      name: {
        first: '{{firstName()}}',
        last: '{{surname()}}'
      },
      
      email(tags) {
        return `${this.name.first}.${this.name.last}@${this.company}${tags.domainZone()}`.toLowerCase();
      },
      phone: '+1 {{phone()}}',
      address: '{{integer(100, 999)}} {{street()}}, {{city()}}, {{state()}}, {{integer(100, 10000)}}',
      about: '{{lorem(1, "paragraphs")}}',
      registered: '{{moment(this.date(new Date(2014, 0, 1), new Date())).format("LLLL")}}',
      latitude: '{{floating(-90.000001, 90)}}',
      longitude: '{{floating(-180.000001, 180)}}',
      tags: [
        {
          'repeat(5)': '{{lorem(1, "words")}}'
        }
      ],
      range: range(10),
      friends: [
        {
          'repeat(3)': {
            id: '{{index()}}',
            name: '{{firstName()}} {{surname()}}'
          }
        }
      ],
      greeting(tags) {
        return `Hello, ${this.name.first}! You have ${tags.integer(5, 10)} unread messages.`;
      },
      favoriteFruit(tags) {
        const fruits = ['apple', 'banana', 'strawberry'];
        return fruits[tags.integer(0, fruits.length - 1)];
      }*/
    }
  }
]
*/

//https://next.json-generator.com/api/json/get/4y3V29gRw
Future<List <Coffe>> loadCoffe() async {
  List <Coffe> products = [];
  try {
    // in real app change api to 'coffe/'
    final responce = await http.get("https://next.json-generator.com/api/json/get/4y3V29gRw");    
    if (responce.statusCode == 200) {
      var jsonData = json.decode(responce.body);
      for (var i in jsonData) {
        var product = Coffe.fromJson(i);
        products.add(Coffe.fromJson(i));
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

/*Future<Map <String, dynamic>> loadFilters() async {
  Map <String, dynamic> filters;
  try {
    // in real app change api to 'coffe/'
    final responce = await http.get("");    
    if (responce.statusCode == 200) {
      var jsonData = json.decode(responce.body);
      for (var i in jsonData) {
        var product = Coffe.fromJson(i);
        print(product);
        products.add(Coffe.fromJson(i));
      } 
      //debugPrint('from future products length ${products.length}');
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
}*/