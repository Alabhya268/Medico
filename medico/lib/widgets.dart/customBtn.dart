import 'package:flutter/material.dart';

import '../constants.dart';

class CustomBtn extends StatelessWidget {
  final String label;
  final Function onTap;

  const CustomBtn({Key key, this.label, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Center(
          child: Text(
            label,
            style: Constants.boldButtonText,
          ),
        ),
      ),
    );
  }
}
