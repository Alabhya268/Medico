import 'package:flutter/material.dart';
import 'package:medico/constants.dart';
import 'package:medico/widgets.dart/appDrawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: Constants.boldAppbarHeading,
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
