import 'package:equatable/equatable.dart';
import 'package:coffe/models/models.dart';

abstract class GoodsEvent extends Equatable {
  const GoodsEvent();
  
  @override
  List<Object> get props => [];
}

class LoadGoods extends GoodsEvent {}

class AddGood extends GoodsEvent {
  final Good good;

  const AddGood(this.good);

  @override
  List<Object> get props => [good];

  @override
  String toString() => 'AddGood { good: $good }';
}

class DeleteGood extends GoodsEvent {
  final int index;

  const DeleteGood(this.index);

  @override
  List<Object> get props => [index];

  @override
  String toString() => 'DeleteGood { index: $index }';  
  
  //final Good good;

  //const DeleteGood(this.good);

  // @override
  // List<Object> get props => [good];

  // @override
  // String toString() => 'DeleteGood { good: $good }';
}

/*class UpdateTodo extends TodosEvent {
  final Todo updatedTodo;

  const UpdateTodo(this.updatedTodo);

  @override
  List<Object> get props => [updatedTodo];

  @override
  String toString() => 'UpdateTodo { updatedTodo: $updatedTodo }';
}*/


// class ClearCompleted extends TodosEvent {}

// class ToggleAll extends TodosEvent {}
