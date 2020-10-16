import 'package:flutter/material.dart';
import 'package:onlinecrimereportingsystem/app/Home/Account/Avatar.dart';
import 'package:onlinecrimereportingsystem/common_widgets/platform_alert_dialouge.dart';
import 'package:onlinecrimereportingsystem/services/auth.dart';
import 'package:provider/provider.dart';

class Account extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSingOut = await PlatformAlertDialouge(
      title: 'Logout',
      content: 'Are you sure you want to Logout?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    ).show(context);
    if (didRequestSingOut == true) {
      _signOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Logout',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            onPressed: () => _confirmSignOut(context),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: _buildUserInfo(user),
        ),
      ),
    );
  }

  Widget _buildUserInfo(User user) {
    return Column(
        children: [
          Avatar(
            photoUrl: user.photoUrl,
            radius: 50,
          ),
          SizedBox(height: 10,),
          if(user.displayName != null)
            Text(
              user.displayName,
            style: TextStyle(color: Colors.white),
            ),
          SizedBox(height: 10,),
        ],
      );
  }
}
