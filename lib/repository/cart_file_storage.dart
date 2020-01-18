import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:coffe/models/models.dart';

/// Loads and saves a List of CartItems using a text file stored on the device.

class CartFileStorage {
  final String tag;
  final Future<Directory> Function() getDirectory;

  const CartFileStorage(
    this.tag,
    this.getDirectory,
  );

  Future<List<CartItem>> loadCart() async {
    final file = await _getLocalFile();
    final string = await file.readAsString();
    final json = JsonDecoder().convert(string);
    final goodsInCart = (json['goods'])
        .map<CartItem>((good) => CartItem.fromJson(good))
        .toList();

    return goodsInCart;
  }

  Future<File> saveCart(List<CartItem> goodsInCart) async {
    final file = await _getLocalFile();

    return file.writeAsString(JsonEncoder().convert({
      'goods': goodsInCart.map((good) => good.toJson()).toList(),
    }));
  }

  Future<File> _getLocalFile() async {
    final dir = await getDirectory();
    
    return File('${dir.path}/ArchSampleStorage__$tag.json');
  }

  Future<FileSystemEntity> clean() async {
    final file = await _getLocalFile();

    return file.delete();
  }
}