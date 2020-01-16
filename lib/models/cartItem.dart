import 'package:equatable/equatable.dart';
import 'package:coffe/models/models.dart';

class CartItem extends Equatable {
  final Good good;
  final GoodsParams goodsParams;
  
  CartItem(this.good, this.goodsParams);

  @override
  List<Object> get props => [
    good, goodsParams
  ];

  CartItem copyWith({
    Good good, GoodsParams goodsParams
  }) => CartItem(
    good ?? this.good,
    goodsParams ?? this.goodsParams,
  );

  @override
  String toString() 
    => '''CartItem{
      good: $good, goodsParams: $goodsParams
    }''';

  factory CartItem.fromJson(Map<String, dynamic> json) =>
  CartItem(
    Good.fromJson(json["good"]),
    GoodsParams.fromJson(json["goodsParams"])
  );

  Map<String, Object> toJson() => {
    "good": good.toJson(),
    "goodsParams": goodsParams.toJson() 
  };

  // static CartItem fromJson(Map<String, Object> json) {
  //   return CartItem(
  //     json["_id"] as String,
  //     json["isActive"] as bool,
  //     json["price"] as String,
  //     json["picture"] as String, 
  //     company: json["company"] as String,
  //     email: json["email"] as String,
  //     about: json["about"] as String,
  //     name : json["name"] as String,  
  //     cornType : json["cornType"] as String,
  //     taste : json["taste"] as String,
  //     originGeography : json["originGeography"] as String,
  //     region : json["region"] as String,
  //   );
  // }
}