import 'package:coffe/repository/cart_file_storage.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coffe/repository/repository.dart';
import 'package:coffe/keys.dart';
import 'package:coffe/theme.dart';
import 'package:coffe/blocs/blocs.dart';
import 'package:coffe/screens/screens.dart';
import 'package:coffe/routes/rotues.dart';
import 'package:coffe/widgets/coffe/coffe_form.dart';


void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(
    MultiBlocProvider(
      providers: [
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
  );
}

class TodosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CoffeAppTheme.theme,
      routes: {
        CoffeAppRoutes.home: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<TabBloc>(
                builder: (context) => TabBloc(),
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
      },
    );
  }
}