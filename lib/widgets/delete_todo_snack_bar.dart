import 'package:flutter/material.dart';
//import 'package:todos_app_core/todos_app_core.dart';
import 'package:coffe/models/models.dart';
import 'package:coffe/helper/localization.dart';

class DeleteTodoSnackBar extends SnackBar {
  //final ArchSampleLocalizations localizations;

  DeleteTodoSnackBar({
    Key key,
    @required Todo todo,
    @required VoidCallback onUndo,
    //@required this.localizations,
  }) : super(
          key: key,
          content: Text(
            //localizations.todoDeleted(todo.task),
            'deleted $todo.task',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          duration: Duration(seconds: 2),
          action: SnackBarAction(
            //label: localizations.undo,
            label: 'undo',
            onPressed: onUndo,
          ),
        );
}
