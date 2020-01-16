import 'dart:async';
import 'dart:core';
import 'package:meta/meta.dart';
import 'package:coffe/models/models.dart';
import 'package:coffe/repository/cart_file_storage.dart';

class CartRepositoryFlutter {
  final CartFileStorage cartFileStorage;

  const CartRepositoryFlutter({
    @required this.cartFileStorage,
  });

  Future<List<Good>> loadCart() async {
    try {
      return await cartFileStorage.loadCart();
    } catch (e) {
      print('Unhandled exeption in loadCart e: ${e.toString()}');
      return [];
    }
  }
  
  Future saveCart(List<Good> goods) async {
    try {
      return await cartFileStorage.saveCart(goods);  
    } catch(e) {
      print('Unhandled exeption in saveCart e: ${e.toString()}');
    }
  }
}