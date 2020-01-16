import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:todos_app_core/todos_app_core.dart';
import 'package:coffe/helper/localization.dart';
import 'package:coffe/keys.dart';
import 'package:coffe/blocs/filtered_todos/filtered_todos.dart';
import 'package:coffe/models/models.dart';

class FilterButton extends StatelessWidget {
  final bool visible;

  FilterButton({this.visible, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultStyle = Theme.of(context).textTheme.body1;
    final activeStyle = Theme.of(context)
        .textTheme
        .body1
        .copyWith(color: Theme.of(context).accentColor);
    return BlocBuilder<FilteredTodosBloc, FilteredTodosState>(
        builder: (context, state) {
      final button = _Button(
        onSelected: (filter) {
          BlocProvider.of<FilteredTodosBloc>(context).add(UpdateFilter(filter));
        },
        activeFilter: state is FilteredTodosLoaded
            ? state.activeFilter
            : VisibilityFilter.all,
        activeStyle: activeStyle,
        defaultStyle: defaultStyle,
      );
      return AnimatedOpacity(
        opacity: visible ? 1.0 : 0.0,
        duration: Duration(milliseconds: 150),
        child: visible ? button : IgnorePointer(child: button),
      );
    });
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key key,
    @required this.onSelected,
    @required this.activeFilter,
    @required this.activeStyle,
    @required this.defaultStyle,
  }) : super(key: key);

  final PopupMenuItemSelected<VisibilityFilter> onSelected;
  final VisibilityFilter activeFilter;
  final TextStyle activeStyle;
  final TextStyle defaultStyle;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<VisibilityFilter>(
      key: CoffeAppKeys.filterButton,
      tooltip: 'Filter todos',//ArchSampleLocalizationsDelegate.of(context).filterTodos,
      onSelected: onSelected,
      itemBuilder: (BuildContext context) => <PopupMenuItem<VisibilityFilter>>[
            PopupMenuItem<VisibilityFilter>(
              key: CoffeAppKeys.allFilter,
              value: VisibilityFilter.all,
              child: Text(
                // ArchSampleLocalizations.of(context).showAll,
                'showAll',
                style: activeFilter == VisibilityFilter.all
                    ? activeStyle
                    : defaultStyle,
              ),
            ),
            PopupMenuItem<VisibilityFilter>(
              key: CoffeAppKeys.activeFilter,
              value: VisibilityFilter.active,
              child: Text(
                //ArchSampleLocalizations.of(context).showActive,
                'showActive',
                style: activeFilter == VisibilityFilter.active
                    ? activeStyle
                    : defaultStyle,
              ),
            ),
            PopupMenuItem<VisibilityFilter>(
              key: CoffeAppKeys.completedFilter,
              value: VisibilityFilter.completed,
              child: Text(
                // ArchSampleLocalizations.of(context).showCompleted,
                'showCompleted',
                style: activeFilter == VisibilityFilter.completed
                    ? activeStyle
                    : defaultStyle,
              ),
            ),
          ],
      icon: Icon(Icons.filter_list),
    );
  }
}
