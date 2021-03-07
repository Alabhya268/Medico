import 'package:flutter/material.dart';
import 'package:medico/pages/login.dart';
import 'prediction_logic/prediction_core.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var core = PredictionCore();
    core.mainFunc();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}
