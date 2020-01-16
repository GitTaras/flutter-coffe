import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:todos_app_core/todos_app_core.dart';
import 'package:coffe/helper/localization.dart';
import 'package:coffe/keys.dart';
import 'package:coffe/blocs/todos/todos.dart';
import 'package:coffe/screens/screens.dart';
import 'package:coffe/flutter_todos_keys.dart';

class DetailsScreen extends StatelessWidget {
  final String id;

  DetailsScreen({Key key, @required this.id})
      : super(key: key ?? CoffeAppKeys.todoDetailsScreen);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(
      builder: (context, state) {
        final todo = (state as TodosLoaded)
            .todos
            .firstWhere((todo) => todo.id == id, orElse: () => null);
        //final localizations = ArchSampleLocalizations.of(context);
        return Scaffold(
          appBar: AppBar(
            // title: Text(localizations.todoDetails),
            title: Text('todoDetails'),
            actions: [
              IconButton(
                // tooltip: localizations.deleteTodo,
                tooltip: 'deleteTodo',
                key: CoffeAppKeys.deleteTodoButton,
                icon: Icon(Icons.delete),
                onPressed: () {
                  BlocProvider.of<TodosBloc>(context).add(DeleteTodo(todo));
                  Navigator.pop(context, todo);
                },
              )
            ],
          ),
          body: todo == null
              ? Container(key: FlutterTodosKeys.emptyDetailsContainer)
              : Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Checkbox(
                                key: FlutterTodosKeys.detailsScreenCheckBox,
                                value: todo.complete,
                                onChanged: (_) {
                                  BlocProvider.of<TodosBloc>(context).add(
                                    UpdateTodo(
                                      todo.copyWith(complete: !todo.complete),
                                    ),
                                  );
                                }),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Hero(
                                  tag: '${todo.id}__heroTag',
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.only(
                                      top: 8.0,
                                      bottom: 16.0,
                                    ),
                                    child: Text(
                                      todo.task,
                                      key: CoffeAppKeys.detailsTodoItemTask,
                                      style:
                                          Theme.of(context).textTheme.headline,
                                    ),
                                  ),
                                ),
                                Text(
                                  todo.note,
                                  key: CoffeAppKeys.detailsTodoItemNote,
                                  style: Theme.of(context).textTheme.subhead,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
          floatingActionButton: FloatingActionButton(
            key: CoffeAppKeys.editTodoFab,
            // tooltip: localizations.editTodo,
            tooltip: 'editTodo',
            child: Icon(Icons.edit),
            onPressed: todo == null
                ? null
                : () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return AddEditScreen(
                            key: CoffeAppKeys.editTodoScreen,
                            onSave: (task, note) {
                              BlocProvider.of<TodosBloc>(context).add(
                                UpdateTodo(
                                  todo.copyWith(task: task, note: note),
                                ),
                              );
                            },
                            isEditing: true,
                            todo: todo,
                          );
                        },
                      ),
                    );
                  },
          ),
        );
      },
    );
  }
}