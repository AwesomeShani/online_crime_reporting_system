import 'package:flutter/material.dart';
import 'package:onlinecrimereportingsystem/app/sign_in/landing_page.dart';
import 'package:onlinecrimereportingsystem/services/auth.dart';
import 'package:provider/provider.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
    return Provider<AuthBase>(
     builder:(context) => Auth(),
      child: MaterialApp(
        title: 'Online Crime Reporting System',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: LandingPage(),
      ),
    );
    }
  }
