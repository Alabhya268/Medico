import 'package:flutter/material.dart';
import 'package:medico/constants.dart';
import 'package:medico/widgets.dart/appDrawer.dart';

class Appointments extends StatefulWidget {
  @override
  _AppointmentsState createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Appointments', style: Constants.boldAppbarHeading),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: [
            for (int i = 0; i < 20; i++)
              Container(
                padding: EdgeInsets.symmetric(vertical: 6),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlutterLogo(
                      size: 60,
                    ),
                    Expanded(
                      child: ListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text('Doctor Name'),
                        subtitle: Text('Datetime of Appointment'),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.remove_circle_outline_outlined),
                      onPressed: () {},
                      color: Colors.black38,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
