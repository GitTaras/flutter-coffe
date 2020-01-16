import 'package:equatable/equatable.dart';
import 'package:coffe/models/models.dart';

abstract class GoodsState extends Equatable {
  const GoodsState();

  @override
  List<Object> get props => [];
}

class GoodsLoading extends GoodsState {}

class GoodsLoaded extends GoodsState {
  final List<Good> goods;

  const GoodsLoaded([this.goods = const []]);

  @override
  List<Object> get props => [goods];

  @override
  String toString() => 'GoodsLoaded { goods: $goods }';
}

class GoodsNotLoaded extends GoodsState {}