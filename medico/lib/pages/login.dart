import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medico/constants.dart';
import 'package:medico/pages/signup.dart';
import 'package:medico/widgets.dart/customBtn.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Login to Medico', style: Constants.boldHeading),
            Column(
              children: [
                TextField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: 'Email'),
                ),
                TextField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                Divider(
                  height: 24,
                ),
                CustomBtn(
                  label: 'Login',
                )
              ],
            ),
            CustomBtn(
              label: 'New to Medico ?',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return Signup();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
