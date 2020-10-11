import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:onlinecrimereportingsystem/app/Home/Models/Report.dart';
import 'package:onlinecrimereportingsystem/services/api_path.dart';
import 'package:onlinecrimereportingsystem/services/firestore_services.dart';

  abstract class Database{
   Future<void> setReport(Report report);
   Stream<List<Report>> reportsStream();
   Future<void> deleteReports(Report report);
 }
  String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

   class FirestoreDatabase implements Database {
     FirestoreDatabase({@required this.uid}) : assert(uid != null);
     final String uid;

     final _service = FirestoreService.instance;

     //TODO: for creating & editing Reports
     Future<void> setReport(Report report) async => _service.setData(
           path: APIPath.report(uid, report.id),
           data: report.toMap(),
         );

     //TODO: To delete data from DATABASE
     @override
     Future<void> deleteReports(Report report) async => await _service
         .deleteData(path: APIPath.report(uid, report.id));

     //TODO: Experimental code:
     @override
     Stream<List<Report>> reportsStream() => _service.collectionStream(
       path: APIPath.reports(uid),
       builder: (data, documentId) => Report.fromMap(data,documentId));

}