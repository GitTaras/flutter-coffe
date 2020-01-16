import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:coffe/keys.dart';
//import 'package:coffe/helper/localization.dart';
//import 'package:todos_app_core/todos_app_core.dart';
import 'package:coffe/models/models.dart';

class TabSelector extends StatelessWidget {
  final AppTab activeTab;
  final Function(AppTab) onTabSelected;

  TabSelector({
    Key key,
    @required this.activeTab,
    @required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      key: CoffeAppKeys.tabs,
      currentIndex: AppTab.values.indexOf(activeTab),
      onTap: (index) => onTabSelected(AppTab.values[index]),
      items: AppTab.values.map((tab) {
        return BottomNavigationBarItem(
          icon: Icon(
            _getIcon(tab),
            key: _getTabKey(tab),
          ),
          // title: Text(tab == AppTab.stats
          //     ? ArchSampleLocalizations.of(context).stats
          //     : ArchSampleLocalizations.of(context).todos),
          title: Text(_getTabText(tab)),
          // onPressed: () {
          //   Navigator.pushNamed(context, CoffeAppRoutes.addTodo);
          // },
          // icon: Icon(
          //   tab == AppTab.todos ? Icons.list : Icons.show_chart,
          //   key: tab == AppTab.todos
          //       ? CoffeAppKeys.todoTab
          //       : CoffeAppKeys.statsTab,
          // ),
          // title: Text(tab == AppTab.stats
          //     ? ArchSampleLocalizations.of(context).stats
          //     : ArchSampleLocalizations.of(context).todos),
        );
      }).toList(),
    );
  }

  String _getTabText(AppTab tab) {
    switch(tab) {
      case AppTab.todos:
        return 'todos';
      case AppTab.stats:
        return 'stats';
      case AppTab.coffe:
        return 'coffe';
      case AppTab.profile:
        return 'profile';
      case AppTab.magazine:
        return  'magazine';
      case AppTab.about:
        return 'about';
      default:
        return '';
    }
  }

  Key _getTabKey(AppTab tab) {
    switch(tab) {
      case AppTab.todos:
        return CoffeAppKeys.todoTab;
      case AppTab.stats:
        return CoffeAppKeys.statsTab;
      case AppTab.coffe:
        return CoffeAppKeys.coffeTab;
      case AppTab.profile:
        return CoffeAppKeys.profileTab;
      case AppTab.magazine:
        return  CoffeAppKeys.magazineTab;
      case AppTab.about:
        return CoffeAppKeys.aboutTab;
      default:
        return Key('TabItem_$tab');
    }
  }

  IconData _getIcon(AppTab tab) {
    switch(tab) {
      case AppTab.todos:
        return Icons.list;
      case AppTab.stats:
        return Icons.show_chart;
      case AppTab.coffe:
        return Icons.business;
      case AppTab.profile:
        return Icons.portrait;
      case AppTab.magazine:
        return Icons.shopping_basket;
      case AppTab.about:
        return Icons.info;
      default:
        return Icons.alarm;
    }
  }
}