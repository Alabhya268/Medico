import 'package:flutter/material.dart';

import '../constants.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    final drawerHeader = GestureDetector(
      onLongPress: () {
        print('I am awesome');
      },
      child: UserAccountsDrawerHeader(
        accountName: Text(
          'Name',
          style: Constants.drawerList,
        ),
        accountEmail: Text(
          'Email',
          style: Constants.drawerList,
        ),
        currentAccountPicture: CircleAvatar(
            child: FlutterLogo(
          size: 42,
        )),
      ),
    );

    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.only(),
        children: [
          drawerHeader,
          ListTile(
            title: Text(
              'Doctors',
              style: Constants.drawerList,
            ),
            leading: Icon(
              Icons.medical_services,
              color: Colors.grey,
            ),
          ),
          ListTile(
            title: Text(
              'My Appointments',
              style: Constants.drawerList,
            ),
            leading: Icon(
              Icons.app_registration,
              color: Colors.grey,
            ),
          ),
          ListTile(
            title: Text(
              'Team Members',
              style: Constants.drawerList,
            ),
            leading: Icon(
              Icons.people,
              color: Colors.grey,
            ),
          ),
          ListTile(
            title: Text('Logout', style: Constants.drawerList),
            leading: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
