import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:todos_app_core/todos_app_core.dart';
import 'package:coffe/helper/localization.dart';
import 'package:coffe/keys.dart';
import 'package:coffe/models/models.dart';

typedef OnSaveCallback = Function(String task, String note);

class AddEditScreen extends StatefulWidget {
  final bool isEditing;
  final OnSaveCallback onSave;
  final Todo todo;

  AddEditScreen({
    Key key,
    @required this.onSave,
    @required this.isEditing,
    this.todo,
  }) : super(key: key ?? CoffeAppKeys.addTodoScreen);

  @override
  _AddEditScreenState createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _task;
  String _note;

  bool get isEditing => widget.isEditing;

  @override
  Widget build(BuildContext context) {
    //final localizations = ArchSampleLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          //isEditing ? localizations.editTodo : localizations.addTodo,
          isEditing ? "editTodo" : "addTodo",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: isEditing ? widget.todo.task : '',
                key: CoffeAppKeys.taskField,
                autofocus: !isEditing,
                style: textTheme.headline,
                decoration: InputDecoration(
                  // hintText: localizations.newTodoHint,
                  hintText: 'newTodoHint',
                ),
                validator: (val) {
                  return val.trim().isEmpty
                      // ? localizations.emptyTodoError
                      ? 'emptyTodoError'
                      : null;
                },
                onSaved: (value) => _task = value,
              ),
              TextFormField(
                initialValue: isEditing ? widget.todo.note : '',
                key: CoffeAppKeys.noteField,
                maxLines: 10,
                style: textTheme.subhead,
                decoration: InputDecoration(
                  // hintText: localizations.notesHint,
                  hintText: 'notesHint',
                ),
                onSaved: (value) => _note = value,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key:
            isEditing ? CoffeAppKeys.saveTodoFab : CoffeAppKeys.saveNewTodo,
        // tooltip: isEditing ? localizations.saveChanges : localizations.addTodo,
        tooltip: isEditing ? 'saveChanges' : 'addTodo',
        child: Icon(isEditing ? Icons.check : Icons.add),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            widget.onSave(_task, _note);
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}