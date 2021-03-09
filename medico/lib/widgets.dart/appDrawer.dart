import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medico/models/user_model.dart';
import 'package:medico/pages/appointments.dart';
import 'package:medico/pages/home.dart';
import 'package:medico/pages/profile.dart';
import 'package:medico/services/firebase_services.dart';

import '../constants.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  FirebaseServices _firebaseServices = FirebaseServices();

  Future<UserModel> getUser() async {
    return await _firebaseServices.usersRef
        .doc(_firebaseServices.getUserId())
        .get()
        .then((value) => UserModel.fromData(value.data()));
  }

  @override
  Widget build(BuildContext context) {
    UserModel user;

    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.only(),
        children: [
          FutureBuilder<UserModel>(
              future: getUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  user = snapshot.data;
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (BuildContext context) {
                          return Profile();
                        },
                      ));
                    },
                    child: UserAccountsDrawerHeader(
                      accountName: Text(
                        user.name ?? 'Name',
                        style: Constants.drawerList,
                      ),
                      accountEmail: Text(
                        user.email ?? 'Email',
                        style: Constants.drawerList,
                      ),
                      currentAccountPicture: CircleAvatar(
                          child: FlutterLogo(
                        size: 42,
                      )),
                    ),
                  );
                }

                if (snapshot.hasError == snapshot.error) {
                  return Center(child: Text(snapshot.error));
                }
              }),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (BuildContext context) {
                  return Home();
                },
              ));
            },
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
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (BuildContext context) {
                  return Appointments();
                },
              ));
            },
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
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Team Members'),
                      content: Container(
                          child: Text(
                              'Alabhya Singh \nAakarshit Sharma \nAbhishek Bhist \nRannvijay Singh Rawat \nSkhand Gupta')),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Close'))
                      ],
                    );
                  });
            },
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
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
