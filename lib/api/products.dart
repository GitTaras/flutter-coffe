import 'package:coffe/models/coffe.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http; 
import 'dart:convert';
import 'package:coffe/helper/failureMessage.dart';
import 'package:coffe/models/good.dart';

Future<List <Coffe>> loadCoffe() async {
  List <Coffe> products = [];
  try {
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

Future <List <Good>> loadGoods(String param) async {
  List <Good> products = [];
  try {
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