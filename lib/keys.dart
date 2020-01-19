import 'package:flutter/widgets.dart';

class CoffeAppKeys {
  // Home Screens
  static final homeScreen = const Key('__homeScreen__');

  // Tabs
  static final tabs = const Key('__tabs__');
  static final coffeTab = const Key('__coffeTab__');
  static final profileTab = const Key('__profileTab__');
  static final magazineTab = const Key('__magazineTab__');
  static final aboutTab = const Key('__aboutTab__');

  //Login Screen
  static final loginScreen = const Key('__loginScreen__'); 
  static final phoneOrEmailField = const Key('__phoneOrEmailField__');
  static final passwordField = const Key('__passwordField__');
  static final loginSreenButton = const Key('_loginScreenButton__');
  static final loginSreenLoginWithFbButton = const Key('_loginScreenLoginWithFbButton__');

  //Register Screen
  static final registerScreen = const Key('__registerScreen__'); 
  static final phoneField = const Key('__phoneField__');
  static final emailField = const Key('__emailField__');
  static final registerPasswordField = const Key('__registerPasswordField__');
  static final repeatPasswordField = const Key('__repeatPasswordField__');
  static final registerSreenButton = const Key('_registerScreeButton__');

  static final cartList = const Key('__cartList__');
  static final cartItem = (String id) => Key('__cartItem__$id');

  // Coffe Screen
  static final coffeList = const Key('__coffeList__');
  static final coffeScreen = const Key('__coffeScreen__');
  static final coffeItem = (String id) => Key('CoffeItem__$id');
  static final coffeItemCheckbox =
      (String id) => Key('CoffeItem__${id}__Checkbox');

  // Profile Screen
  static final profileScreen = const Key('__profileScreen__');

  // Magazine Screen
  static final magazineScreen = const Key('__magazineScreen__');
  static final productScreen = const Key('__productScreen__');

  // About Screen
  static final aboutScreen = const Key('__aboutScreen__');
}