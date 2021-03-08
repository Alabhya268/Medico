import 'package:flutter/material.dart';
import 'package:medico/widgets.dart/customBtn.dart';

import '../constants.dart';

class Doctor extends StatefulWidget {
  @override
  _DoctorState createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Doctor Name', style: Constants.boldAppbarHeading)),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
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
                "Name of Doctor",
                style: Constants.boldDoctorHeading,
              ),
              subtitle: Text(
                'Degree',
                style: Constants.drawerList,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(
                'Specialist In:',
                style: Constants.boldDoctorSubHeading,
              ),
              subtitle: Text(
                'Specialist In feilds',
                style: Constants.drawerList,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(
                'Professional Bio:',
                style: Constants.boldDoctorSubHeading,
              ),
              subtitle: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
                style: Constants.drawerList,
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                    child: CustomBtn(
                  label: 'Consult Online',
                )),
                SizedBox(width: 12),
                Expanded(
                    child: CustomBtn(
                  label: 'Book Appointment',
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
