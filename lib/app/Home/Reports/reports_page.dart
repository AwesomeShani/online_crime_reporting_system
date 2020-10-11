import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:onlinecrimereportingsystem/app/Home/Models/Report.dart';
import 'package:onlinecrimereportingsystem/app/Home/Reports/edit_reports_page.dart';
import 'package:onlinecrimereportingsystem/app/Home/Reports/list_items_builder.dart';
import 'package:onlinecrimereportingsystem/app/Home/Reports/reports_list_tile.dart';
import 'package:onlinecrimereportingsystem/common_widgets/platform_exception_alert_dialouge.dart';
import 'package:onlinecrimereportingsystem/services/database.dart';
import 'package:provider/provider.dart';

class ReportsPage extends StatelessWidget {

  Future<void> _delete(BuildContext context, Report report) async {
   try{
     final database = Provider.of<Database>(context);
     await database.deleteReports(report);
   } on PlatformException catch (e){
     PlatformExceptionAlertDialouge(
       title: 'Operation Failed',
       exception: e,
     ).show(context);
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reports'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add, color: Colors.white,),
            onPressed: ()=> EditReportsPage.show(
              context,
                database: Provider.of<Database>(context),
            ),
          ),
        ],
      ),
      body:_buildContents(context),
    );
  }

 Widget _buildContents(BuildContext context) {
    final database = Provider.of<Database>(context);
    return StreamBuilder<List<Report>>(
      stream: database.reportsStream(),
      builder: (context, snapshot){
        return ListItemsBuilder<Report>(
          snapshot: snapshot,
          itemBuilder: (context, report)=> Dismissible(
            key:Key('report-${report.id}'),
           background: Container(color: Colors.red,),
            direction: DismissDirection.endToStart,
            onDismissed: (direction)=> _delete(context, report),
            child: ReportsListTile(
              report: report,
              onTap: ()=> EditReportsPage.show(context, report: report),
            ),
          ),
        );
        },
    );
  }

}
