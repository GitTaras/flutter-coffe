import 'package:equatable/equatable.dart';
import 'package:coffe/models/models.dart';

abstract class GoodsState extends Equatable {
  const GoodsState();

  @override
  List<Object> get props => [];
}

class GoodsLoading extends GoodsState {}

class GoodsLoaded extends GoodsState {
  final List<CartItem> goodsInCart;

  const GoodsLoaded([this.goodsInCart = const []]);

  @override
  List<Object> get props => [goodsInCart];

  @override
  String toString() => 'GoodsLoaded { goods: $goodsInCart }';
}

class GoodsNotLoaded extends GoodsState {}