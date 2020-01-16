import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:coffe/models/good.dart';
import 'package:coffe/models/models.dart';

/// Loads and saves a List of Todos using a text file stored on the device.
///
/// Note: This class has no direct dependencies on any Flutter dependencies.
/// Instead, the `getDirectory` method should be injected. This allows for
/// testing.
class CartFileStorage {
  final String tag;
  final Future<Directory> Function() getDirectory;

  const CartFileStorage(
    this.tag,
    this.getDirectory,
  );

  Future<List<Good>> loadCart() async {
    final file = await _getLocalFile();
    final string = await file.readAsString();
    final json = JsonDecoder().convert(string);
    final goods = (json['goods'])
        .map<Good>((good) => Good.fromJson(good))
        .toList();

    return goods;
  }

  Future<File> saveCart(List<Good> goods) async {
    final file = await _getLocalFile();

    return file.writeAsString(JsonEncoder().convert({
      'goods': goods.map((good) => good.toJson()).toList(),
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