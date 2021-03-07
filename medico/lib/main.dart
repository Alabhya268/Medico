import 'package:flutter/material.dart';
import 'package:medico/pages/appointments.dart';
import 'package:medico/pages/bookAppointment.dart';
import 'package:medico/pages/doctor.dart';
import 'package:medico/pages/home.dart';
import 'package:medico/pages/login.dart';
import 'package:medico/pages/profile.dart';
import 'package:medico/pages/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
