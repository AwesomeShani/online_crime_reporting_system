import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TabItem{Reports, Search, Account}

class TabItemData{
  const TabItemData({@required this.title,@required this.icon});
  final String title;
  final IconData icon;

  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.Reports: TabItemData(title: 'Reports', icon: Icons.add),
    TabItem.Search: TabItemData(title: 'News', icon: Icons.search),
    TabItem.Account: TabItemData(title: 'Account', icon: Icons.person),

  };
}