
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class MessageHandler extends StatefulWidget {
  @override
  _MessageHandlerState createState() => _MessageHandlerState();
}

class _MessageHandlerState extends State<MessageHandler> {

  final Firestore _db = Firestore.instance;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  String _homeScreenText; 
  String _messageText;
  @override
  void initState(){
    super.initState();
 _firebaseMessaging.configure(
   onMessage:(Map<String, dynamic> message ) async{
     setState(() {
       _messageText = "Push Message: $message";
     });
     print('onMessage: $message');
        },

        onLaunch: (Map<String, dynamic> message) async{
          setState(() {
            _messageText = "Push Message: $message";
          });
          print("onLaunch: $message");
        },

        onResume: (Map<String, dynamic> message) async{
          setState(() {
            _messageText= "Push Message: $message";
          });
          print("onResume: $message");
        },
    );
    _firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(sound: true, badge:true, alert: true));
      _firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
        print("Settings registered: $settings");
       });

       _firebaseMessaging.getToken().then((String token) {
         assert(token!=null);
         setState(() {
           _homeScreenText = 'Push message token: $token';
         });
         print(_homeScreenText);
       });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Push Notificaitons'),
      ),
      body: Material(
        child: Column(
          children: <Widget>[
            Center(
              child: Text(_homeScreenText),
            ),
            Row(children: <Widget>[
              Expanded(child: Text(_messageText)),
            ],),
          ],
        ),
      ),
    );
  }
}
