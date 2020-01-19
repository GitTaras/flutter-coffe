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
    }  else if (event is DeleteGood) {
      yield* _mapDeleteGoodToState(event);
    }
  }

  Stream<GoodsState> _mapLoadGoodsToState() async* {
    try {
      final goodsInCart = await this.goodsRepository.loadCart();
      yield GoodsLoaded(
        goodsInCart.toList(),
      );
    } catch (_) {
      print('block exeption goods not loaded');
      yield GoodsNotLoaded();
    }
  }

  Stream<GoodsState> _mapAddGoodToState(AddGood event) async* {
    if (state is GoodsLoaded) {
      final List<CartItem> updatedGoodsInCart = List.from((state as GoodsLoaded).goodsInCart)
        ..add(event.goodInCart);
      yield GoodsLoaded(updatedGoodsInCart);
      _saveGoods(updatedGoodsInCart);
    }
  }

  Stream<GoodsState> _mapDeleteGoodToState(DeleteGood event) async* {
    if (state is GoodsLoaded) {
      final updatedGoodsInCart = [
        ...(state as GoodsLoaded).goodsInCart
      ];
      updatedGoodsInCart.removeAt(event.index);//(event.good);
          //.where((good) => good.id != event.good.id)
          //.toList();
      // print('immutable: ');
      // print(updatedGoods == (state as GoodsLoaded).goods);
      yield GoodsLoaded(updatedGoodsInCart);
      _saveGoods(updatedGoodsInCart);
    }
  }

  Future _saveGoods(List<CartItem> goodsInCart) {
    return goodsRepository.saveCart(
      goodsInCart.toList(),
    );
  }
}
