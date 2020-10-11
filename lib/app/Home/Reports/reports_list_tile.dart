
import 'package:flutter/material.dart';
import 'package:onlinecrimereportingsystem/app/Home/Models/Report.dart';

class ReportsListTile extends StatelessWidget {
  const ReportsListTile({Key key, @required this.report, this.onTap}) : super
      (key: key);
  final Report report;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(report.crimeType),
      trailing: Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
