import 'package:coffe/widgets/cart_with_badge.dart';
import 'package:coffe/widgets/tabs/tab_names.dart';
import 'package:coffe/widgets/tabs/tab_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MagazineWidget extends StatelessWidget {
  final List<Tab> myTabs = getTabs(TabNamesText);

  static List <Tab> getTabs(List<String> tabNamesText) {
    List <Tab> tabs = [];
    tabNamesText.forEach((e) {
      tabs.add(Tab(text: '$e')); 
    });
    return tabs; 
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Magazine'),
          centerTitle: true,
          actions: <Widget>[
            CartWithBadge()
          ],
          bottom: TabBar(
            isScrollable: true,
            tabs: myTabs,
          ),
        ),
        body: TabBarView(
          children: myTabs.map((Tab tab) {
            final String param = tab.text.split(' ').last;
            return TabWidget(key: Key("$tab.text"), url: param);
          }).toList(),
        ),
      ),
    );
  }
}