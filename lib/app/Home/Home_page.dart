import 'package:flutter/material.dart';
import 'package:onlinecrimereportingsystem/app/Home/Account/accounts_page.dart';
import 'package:onlinecrimereportingsystem/app/Home/Cupertino_Home_Scaffold.dart';
import 'package:onlinecrimereportingsystem/app/Home/Models/News_Page.dart';
import 'package:onlinecrimereportingsystem/app/Home/Reports/reports_page.dart';
import 'package:onlinecrimereportingsystem/app/Home/Tab_items.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabItem _currentTab = TabItem.Reports;

  Map<TabItem, WidgetBuilder> get widgetBuilders{
    return{
      TabItem.Reports:(_)=> ReportsPage(),
      TabItem.Search:(_)=> NewsPage(),
      TabItem.Account:(_)=> Account(),
    };
  }

  void _selectedItem(TabItem tabItem) {
    setState(() => _currentTab= tabItem);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoHomeScaffold(
      currentTab: _currentTab,
      onSelectTab: _selectedItem,
      widgetBuilders: widgetBuilders,
    );
  }


}
