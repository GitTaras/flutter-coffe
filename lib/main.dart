import 'package:coffe/repository/cart_file_storage.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:todos_repository_simple/todos_repository_simple.dart';
// import 'package:todos_app_core/todos_app_core.dart';

import 'package:coffe/repository/repository.dart';
import 'package:coffe/keys.dart';
import 'package:coffe/theme.dart';
import 'package:coffe/localization.dart';
import 'package:coffe/blocs/blocs.dart';
import 'package:coffe/models/models.dart';
import 'package:coffe/screens/screens.dart';
import 'package:coffe/routes/rotues.dart';

import 'package:coffe/widgets/coffe/coffe_form.dart';


void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<TodosBloc>(
          builder: (context) {
            return TodosBloc(
              todosRepository: const TodosRepositoryFlutter(
                fileStorage: const FileStorage(
                  '__flutter_bloc_app__',
                  getApplicationDocumentsDirectory,
                ),
              ),
            )..add(LoadTodos());
          },
        ),
        BlocProvider <GoodsBloc>(
          builder: (context) {
            return GoodsBloc(
              goodsRepository: const CartRepositoryFlutter(
                cartFileStorage: const CartFileStorage(
                  '__cart_coffe_app__',
                  getApplicationDocumentsDirectory,
                ),
              ),
            )..add(LoadGoods());
          }
        )
      ],
      child: TodosApp(),
    )
    /*BlocProvider(
      builder: (context) {
        return TodosBloc(
          todosRepository: const TodosRepositoryFlutter(
            fileStorage: const FileStorage(
              '__flutter_bloc_app__',
              getApplicationDocumentsDirectory,
            ),
          ),
        )..add(LoadTodos());
      },
      child: TodosApp(),
    ),*/
  );
}

class TodosApp extends StatelessWidget {
  // final GoodsBloc _goodsBloc 
  //     = GoodsBloc(
  //         goodsRepository: const CartRepositoryFlutter(
  //           cartFileStorage: const CartFileStorage(
  //             '__cart_coffe_app__',
  //             getApplicationDocumentsDirectory,
  //           ),
  //         ),
  //       )..add(LoadGoods());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: FlutterBlocLocalizations().appTitle,
      theme: CoffeAppTheme.theme,
      localizationsDelegates: [
        //ArchSampleLocalizationsDelegate(),
        FlutterBlocLocalizationsDelegate(),
      ],
      routes: {
        CoffeAppRoutes.home: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<TabBloc>(
                builder: (context) => TabBloc(),
              ),
              BlocProvider<FilteredTodosBloc>(
                builder: (context) => FilteredTodosBloc(
                  todosBloc: BlocProvider.of<TodosBloc>(context),
                ),
              ),
              BlocProvider<StatsBloc>(
                builder: (context) => StatsBloc(
                  todosBloc: BlocProvider.of<TodosBloc>(context),
                ),
              ),
            ],
            child: HomeScreen(),
          );
        },
        CoffeAppRoutes.form: (context) {
          return CoffeForm();
        },
        CoffeAppRoutes.cart: (context) {
          return CartScreen();
        },
        CoffeAppRoutes.addTodo: (context) {
          return AddEditScreen(
            key: CoffeAppKeys.addTodoScreen,
            onSave: (task, note) {
              BlocProvider.of<TodosBloc>(context).add(
                AddTodo(Todo(task, note: note)),
              );
            },
            isEditing: false,
          );
        },
        CoffeAppRoutes.register: (context) {
          return RegisterScreen(
            key: CoffeAppKeys.registerScreen,
            onRegister: (user) {
              print('user registered:\n');
              print(user);
            }
          );
        },
        CoffeAppRoutes.login: (context) {
          return LoginScreen(
            key: CoffeAppKeys.loginScreen,
            onLogin: (user) {
              print('user logined:\n');
              print(user);
            }
          );
        }
        /*CoffeAppRoutes.coffe: (context) {
          return CoffeScreen(
            key: CoffeAppKeys.coffeScreen
          );
        },
        CoffeAppRoutes.profile: (context) {
          return ProfileScreen(
            key: CoffeAppKeys.profileScreen
          );
        },
        CoffeAppRoutes.magazine: (context) {
          return MagazineScreen(
            key: CoffeAppKeys.magazineScreen
          );
        },
        CoffeAppRoutes.about: (context) {
          return AboutScreen(
            key: CoffeAppKeys.aboutScreen
          );
        },*/
      },
    );
  }
}