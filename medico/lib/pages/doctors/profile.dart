import 'package:flutter/material.dart';
import 'package:medico/constants.dart';
import 'package:medico/pages/doctors/appDrawer.dart';
import 'package:medico/widgets.dart/customBtn.dart';

class DoctorProfile extends StatefulWidget {
  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Doctor\'s Profile',
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
                "Doctor's Name:",
                style: Constants.drawerList,
              ),
              subtitle: Text(
                'Name of Doctor',
                style: Constants.boldDoctorHeading,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(
                "Specialist in:",
                style: Constants.drawerList,
              ),
              subtitle: Text(
                'Dermatology, Gynecology',
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
                "Disease Expertise:",
                style: Constants.drawerList,
              ),
              subtitle: Text(
                'Common Cold',
                style: Constants.boldDoctorHeading,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(
                "Work:",
                style: Constants.drawerList,
              ),
              subtitle: Text(
                'Nursing Home, Dehradun',
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
