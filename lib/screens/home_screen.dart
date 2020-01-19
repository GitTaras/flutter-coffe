import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coffe/blocs/blocs.dart';
import 'package:coffe/widgets/magazine/magazine_widget.dart';
import 'package:coffe/widgets/widgets.dart';
import 'package:coffe/models/models.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, AppTab>(
      builder: (context, activeTab) {
        return Scaffold(
          body: _getActiveWidget(activeTab),
          bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) =>
                BlocProvider.of<TabBloc>(context).add(UpdateTab(tab)),
          ),
        );
      },
    );
  }

  Widget _getActiveWidget(AppTab activeTab) {
    switch(activeTab) {
      case AppTab.coffe:
        return CoffeWidget();
      case AppTab.profile:
        return ProfileWidget();
      case AppTab.magazine:
        return  MagazineWidget();
      case AppTab.about:
        return AboutWidget();
      default:
        return CoffeWidget();
    }
  }
}