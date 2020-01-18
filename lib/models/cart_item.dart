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
}