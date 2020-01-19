import 'package:equatable/equatable.dart';
import 'package:coffe/models/models.dart';

abstract class GoodsEvent extends Equatable {
  const GoodsEvent();
  
  @override
  List<Object> get props => [];
}

class LoadGoods extends GoodsEvent {}

class AddGood extends GoodsEvent {
  final CartItem goodInCart;

  const AddGood(this.goodInCart);

  @override
  List<Object> get props => [goodInCart];

  @override
  String toString() => 'AddGood { good: $goodInCart }';
}

class DeleteGood extends GoodsEvent {
  final int index;

  const DeleteGood(this.index);

  @override
  List<Object> get props => [index];

  @override
  String toString() => 'DeleteGood { index: $index }';  
}