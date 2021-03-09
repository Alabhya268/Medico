import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medico/constants.dart';
import 'package:medico/services/firebase_services.dart';
import 'package:medico/widgets.dart/customBtn.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
    String _createAccountFeedback;
    if (_registerPassword == _confirmPassword) {
      _createAccountFeedback = await _firebaseServices.createAccount(
          email: _registerEmail,
          password: _registerPassword,
          name: _name,
          age: _age,
          gender: _gender,
          height: _height,
          weight: _weight,
          phone: _phone);
    } else {
      _createAccountFeedback = 'Passwords did not match';
    }

    if (_createAccountFeedback != null) {
      _alertDialogBuilder(_createAccountFeedback);
    } else {
      Navigator.pop(context);
    }
    setState(() {
      _registerFormLoading = false;
    });
  }

  String _name;
  int _age;
  String _gender;
  int _height;
  int _weight;
  int _phone;
  String _registerEmail;
  String _registerPassword;
  String _confirmPassword;

  bool _registerFormLoading = false;
  bool _isPasswordHidden = true;
  bool _isConfirmPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('SignUp to Medico', style: Constants.boldHeading),
            _registerFormLoading
                ? Center(child: CircularProgressIndicator())
                : Container(
                    child: Column(
                      children: [
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(hintText: 'Fullname'),
                          onChanged: (value) {
                            _name = value;
                          },
                        ),
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(hintText: 'Email'),
                          onChanged: (value) {
                            _registerEmail = value.toLowerCase();
                          },
                        ),
                        ListTile(
                            contentPadding: EdgeInsets.all(0),
                            title: TextField(
                              textInputAction: TextInputAction.next,
                              obscureText: _isPasswordHidden,
                              decoration: InputDecoration(hintText: 'Password'),
                              onChanged: (value) {
                                _registerPassword = value;
                              },
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isPasswordHidden = !_isPasswordHidden;
                                });
                              },
                              child: _isPasswordHidden
                                  ? Icon(Icons.lock)
                                  : Icon(Icons.lock_open),
                            )),
                        ListTile(
                            contentPadding: EdgeInsets.all(0),
                            title: TextField(
                              textInputAction: TextInputAction.next,
                              obscureText: _isConfirmPasswordHidden,
                              decoration:
                                  InputDecoration(hintText: 'Confirm Password'),
                              onChanged: (value) {
                                _confirmPassword = value;
                              },
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isConfirmPasswordHidden =
                                      !_isConfirmPasswordHidden;
                                });
                              },
                              child: _isConfirmPasswordHidden
                                  ? Icon(Icons.lock)
                                  : Icon(Icons.lock_open),
                            )),
                        Divider(
                          height: 24,
                        ),
                        CustomBtn(
                          label: 'SignUp',
                          onTap: () {
                            _submitForm();
                            print(_registerPassword);
                            print(_confirmPassword);
                          },
                        )
                      ],
                    ),
                  ),
            _registerFormLoading
                ? Text('We are creating your account')
                : CustomBtn(
                    label: 'Already have an account ?',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
