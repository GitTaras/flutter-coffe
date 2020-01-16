import 'package:flutter/widgets.dart';

class CoffeAppKeys {
  // Home Screens
  static final homeScreen = const Key('__homeScreen__');
  static final addTodoFab = const Key('__addTodoFab__');
  static final snackbar = const Key('__snackbar__');
  static Key snackbarAction(String id) => Key('__snackbar_action_${id}__');

  // Todos
  static final todoList = const Key('__todoList__');
  static final todosLoading = const Key('__todosLoading__');
  static final todoItem = (String id) => Key('TodoItem__${id}');
  static final todoItemCheckbox =
      (String id) => Key('TodoItem__${id}__Checkbox');
  static final todoItemTask = (String id) => Key('TodoItem__${id}__Task');
  static final todoItemNote = (String id) => Key('TodoItem__${id}__Note');

  // Tabs
  static final tabs = const Key('__tabs__');
  static final todoTab = const Key('__todoTab__');
  static final statsTab = const Key('__statsTab__');
  static final coffeTab = const Key('__coffeTab__');
  static final profileTab = const Key('__profileTab__');
  static final magazineTab = const Key('__magazineTab__');
  static final aboutTab = const Key('__aboutTab__');

  // Extra Actions
  static final extraActionsButton = const Key('__extraActionsButton__');
  static final toggleAll = const Key('__markAllDone__');
  static final clearCompleted = const Key('__clearCompleted__');

  // Filters
  static final filterButton = const Key('__filterButton__');
  static final allFilter = const Key('__allFilter__');
  static final activeFilter = const Key('__activeFilter__');
  static final completedFilter = const Key('__completedFilter__');

  // Stats
  static final statsCounter = const Key('__statsCounter__');
  static final statsLoading = const Key('__statsLoading__');
  static final statsNumActive = const Key('__statsActiveItems__');
  static final statsNumCompleted = const Key('__statsCompletedItems__');

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
  

  // Details Screen
  static final editTodoFab = const Key('__editTodoFab__');
  static final deleteTodoButton = const Key('__deleteTodoFab__');
  static final todoDetailsScreen = const Key('__todoDetailsScreen__');
  static final detailsTodoItemCheckbox = Key('DetailsTodo__Checkbox');
  static final detailsTodoItemTask = Key('DetailsTodo__Task');
  static final detailsTodoItemNote = Key('DetailsTodo__Note');

  // Add Screen
  static final addTodoScreen = const Key('__addTodoScreen__');
  static final saveNewTodo = const Key('__saveNewTodo__');
  static final taskField = const Key('__taskField__');
  static final noteField = const Key('__noteField__');

  // Edit Screen
  static final editTodoScreen = const Key('__editTodoScreen__');
  static final saveTodoFab = const Key('__saveTodoFab__');
}