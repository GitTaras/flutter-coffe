import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:coffe/repository/cart_repository.dart';
import 'package:meta/meta.dart';
import 'package:coffe/blocs/goods/goods.dart';
import 'package:coffe/models/models.dart';

//models -> bloc (domain layer) -> repository(data layer)

class GoodsBloc extends Bloc<GoodsEvent, GoodsState> {
  
  final CartRepositoryFlutter goodsRepository;
  
  GoodsBloc({@required this.goodsRepository});

  @override
  GoodsState get initialState => GoodsLoading();

  @override
  Stream<GoodsState> mapEventToState(
    GoodsEvent event,
  ) async* {
     if (event is LoadGoods) {
      yield* _mapLoadGoodsToState();
    } else if (event is AddGood) {
      yield* _mapAddGoodToState(event);
    } /*else if (event is UpdateTodo) {
      yield* _mapUpdateTodoToState(event);
    }*/ else if (event is DeleteGood) {
      yield* _mapDeleteGoodToState(event);
    }/* else if (event is ToggleAll) {
      yield* _mapToggleAllToState();
    } else if (event is ClearCompleted) {
      yield* _mapClearCompletedToState();
    }*/
  }

  Stream<GoodsState> _mapLoadGoodsToState() async* {
    try {
      final goods = await this.goodsRepository.loadCart();
      yield GoodsLoaded(
        goods.toList(),
      );
    } catch (_) {
      print('block exeption goods not loaded');
      yield GoodsNotLoaded();
    }
  }

  Stream<GoodsState> _mapAddGoodToState(AddGood event) async* {
    if (state is GoodsLoaded) {
      final List<Good> updatedGoods = List.from((state as GoodsLoaded).goods)
        ..add(event.good);
      yield GoodsLoaded(updatedGoods);
      _saveGoods(updatedGoods);
    }
  }

  // Stream<TodosState> _mapUpdateTodoToState(UpdateTodo event) async* {
  //   if (state is TodosLoaded) {
  //     final List<Todo> updatedTodos = (state as TodosLoaded).todos.map((todo) {
  //       return todo.id == event.updatedTodo.id ? event.updatedTodo : todo;
  //     }).toList();
  //     yield TodosLoaded(updatedTodos);
  //     _saveTodos(updatedTodos);
  //   }
  // }

  Stream<GoodsState> _mapDeleteGoodToState(DeleteGood event) async* {
    if (state is GoodsLoaded) {
      final updatedGoods = [
        ...(state as GoodsLoaded).goods
      ];
      updatedGoods.removeAt(event.index);//(event.good);
          //.where((good) => good.id != event.good.id)
          //.toList();
      // print('immutable: ');
      // print(updatedGoods == (state as GoodsLoaded).goods);
      yield GoodsLoaded(updatedGoods);
      _saveGoods(updatedGoods);
    }
  }

  // Stream<TodosState> _mapToggleAllToState() async* {
  //   if (state is TodosLoaded) {
  //     final allComplete =
  //         (state as TodosLoaded).todos.every((todo) => todo.complete);
  //     final List<Todo> updatedTodos = (state as TodosLoaded)
  //         .todos
  //         .map((todo) => todo.copyWith(complete: !allComplete))
  //         .toList();
  //     yield TodosLoaded(updatedTodos);
  //     _saveTodos(updatedTodos);
  //   }
  // }

  // Stream<TodosState> _mapClearCompletedToState() async* {
  //   if (state is TodosLoaded) {
  //     final List<Todo> updatedTodos =
  //         (state as TodosLoaded).todos.where((todo) => !todo.complete).toList();
  //     yield TodosLoaded(updatedTodos);
  //     _saveTodos(updatedTodos);
  //   }
  // }

  Future _saveGoods(List<Good> goods) {
    return goodsRepository.saveCart(
      goods.toList(),
    );
  }
}
