import 'package:flutter/material.dart';
import 'package:medico/constants.dart';
import 'package:medico/widgets.dart/appDrawer.dart';
import 'package:medico/widgets.dart/customBtn.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile Page',
          style: Constants.boldAppbarHeading,
        ),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              height: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(12)),
              child: FlutterLogo(
                size: 300,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(
                "Name:",
                style: Constants.drawerList,
              ),
              subtitle: Text(
                'Name of User',
                style: Constants.boldDoctorHeading,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(
                "Age:",
                style: Constants.drawerList,
              ),
              subtitle: Text(
                'Age in Numbers',
                style: Constants.boldDoctorHeading,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(
                "Gender:",
                style: Constants.drawerList,
              ),
              subtitle: Text(
                'Male',
                style: Constants.boldDoctorHeading,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(
                "Height:",
                style: Constants.drawerList,
              ),
              subtitle: Text(
                'Height in Numbers',
                style: Constants.boldDoctorHeading,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(
                "Weight:",
                style: Constants.drawerList,
              ),
              subtitle: Text(
                'Weight in Numbers',
                style: Constants.boldDoctorHeading,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(
                "Email:",
                style: Constants.drawerList,
              ),
              subtitle: Text(
                'test@test.com',
                style: Constants.boldDoctorHeading,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(
                "Phone no:",
                style: Constants.drawerList,
              ),
              subtitle: Text(
                '5464846846',
                style: Constants.boldDoctorHeading,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.blue),
                child: ListTile(
                  contentPadding: EdgeInsets.all(8),
                  trailing: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Edit Profile',
                    style: Constants.boldButtonText,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
