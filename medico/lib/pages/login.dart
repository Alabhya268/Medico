import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medico/constants.dart';
import 'package:medico/pages/signup.dart';
import 'package:medico/services/firebase_services.dart';
import 'package:medico/widgets.dart/customBtn.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FirebaseServices _firebaseServices = new FirebaseServices();

  Future<void> _alertDialogBuilder(String error) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Error',
          ),
          content: Container(
            child: Text(
              error,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Close',
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _submitForm() async {
    setState(() {
      _registerFormLoading = true;
    });

    String _createAccountFeedback = await _firebaseServices.signInAccount(
        email: _registerEmail, password: _registerPassword);
    if (_createAccountFeedback != null) {
      _alertDialogBuilder(_createAccountFeedback);
    }
    setState(() {
      _registerFormLoading = false;
    });
  }

  bool _registerFormLoading = false;

  String _registerEmail;
  String _registerPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Login to Medico', style: Constants.boldHeading),
            _registerFormLoading
                ? Center(child: CircularProgressIndicator())
                : Container(
                    child: Column(
                      children: [
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(hintText: 'Email'),
                          onChanged: (value) {
                            _registerEmail = value;
                          },
                        ),
                        TextField(
                          textInputAction: TextInputAction.next,
                          obscureText: true,
                          decoration: InputDecoration(hintText: 'Password'),
                          onChanged: (value) {
                            _registerPassword = value;
                          },
                        ),
                        Divider(
                          height: 24,
                        ),
                        CustomBtn(
                          label: 'Login',
                          onTap: () {
                            _submitForm();
                          },
                        )
                      ],
                    ),
                  ),
            _registerFormLoading
                ? Text('We are logging you in')
                : CustomBtn(
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
