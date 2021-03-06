import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:coffe/blocs/tab/tab.dart';
import 'package:coffe/models/models.dart';

class TabBloc extends Bloc<TabEvent, AppTab> {
  @override
  AppTab get initialState => AppTab.coffe;

  @override
  Stream<AppTab> mapEventToState(TabEvent event) async* {
    if (event is UpdateTab) {
      yield event.tab;
    }
  }
}