import 'package:flutter/material.dart';
import 'package:coffe/keys.dart';
import 'package:coffe/routes/CoffeAppRoutes.dart';
//import 'package:coffe/helper/localization.dart';
//import 'package:todos_app_core/todos_app_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coffe/blocs/blocs.dart';
import 'package:coffe/widgets/magazine/magazine_widget.dart';
import 'package:coffe/widgets/widgets.dart';
import 'package:coffe/localization.dart';
import 'package:coffe/models/models.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, AppTab>(
      builder: (context, activeTab) {
        return Scaffold(
          appBar: AppBar(
            title: Text(FlutterBlocLocalizations.of(context).appTitle),
            actions: [
              FilterButton(visible: activeTab == AppTab.todos),
              ExtraActions(),
            ],
          ),
          // body: activeTab == AppTab.todos ? FilteredTodos() : Stats(),
          body: _getActiveWidget(activeTab),
          floatingActionButton: FloatingActionButton(
            key: CoffeAppKeys.addTodoFab,
            onPressed: () {
              Navigator.pushNamed(context, CoffeAppRoutes.addTodo);
            },
            child: Icon(Icons.add),
            //tooltip: ArchSampleLocalizations.of(context).addTodo,
          ),
          bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) =>
                BlocProvider.of<TabBloc>(context).add(UpdateTab(tab)),
            //  (tab) => 
            //      Navigator.pushNamed(context, '/$tab'); //CoffeAppRoutes[tab]
              
          ),
        );
      },
    );
  }

  Widget _getActiveWidget(AppTab activeTab) {
    switch(activeTab) {
      case AppTab.todos:
        return FilteredTodos();
      case AppTab.stats:
        return Stats();
      case AppTab.coffe:
        return CoffeWidget();
      case AppTab.profile:
        return ProfileWidget();
      case AppTab.magazine:
        return  MagazineWidget();
      case AppTab.about:
        return AboutWidget();
      default:
        return FilteredTodos();
    }

  }
}