import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:coffe/keys.dart';
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
          title: Text(_getTabText(tab)),
        );
      }).toList(),
    );
  }

  String _getTabText(AppTab tab) {
    switch(tab) {
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