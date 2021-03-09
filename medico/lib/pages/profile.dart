import 'package:flutter/material.dart';
import 'package:medico/constants.dart';
import 'package:medico/models/user_model.dart';
import 'package:medico/services/firebase_services.dart';
import 'package:medico/widgets.dart/appDrawer.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  FirebaseServices _firebaseServices = FirebaseServices();

  Future<UserModel> getUser() async {
    return await _firebaseServices.usersRef
        .doc(_firebaseServices.getUserId())
        .get()
        .then((value) => UserModel.fromData(value.data()));
  }

  Future<void> _alertDialogBuilder(UserModel user) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Edit Profile',
          ),
          content: Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormField(
                    initialValue: user.name ?? null,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      if (value != null) {
                        user.name = value;
                      }
                    },
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  TextFormField(
                    initialValue: user.age.toString() ?? null,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value != null) {
                        user.age = int.parse(value);
                      }
                    },
                    decoration: InputDecoration(labelText: 'Age'),
                  ),
                  TextFormField(
                    initialValue: user.gender ?? null,
                    onChanged: (value) {
                      if (value != null) {
                        user.gender = value;
                      }
                    },
                    decoration: InputDecoration(labelText: 'Gender'),
                  ),
                  TextFormField(
                    initialValue: user.height.toString() ?? null,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value != null) {
                        user.height = int.parse(value);
                      }
                    },
                    decoration: InputDecoration(labelText: 'Height'),
                  ),
                  TextFormField(
                    initialValue: user.weight.toString() ?? null,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value != null) {
                        user.weight = int.parse(value);
                      }
                    },
                    decoration: InputDecoration(labelText: 'Weight'),
                  ),
                  TextFormField(
                    initialValue: user.phone.toString() ?? null,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value != null) {
                        user.phone = int.parse(value);
                      }
                    },
                    decoration: InputDecoration(labelText: 'Phone no:'),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _firebaseServices.usersRef
                      .doc(_firebaseServices.getUserId())
                      .update({
                    'name': user.name,
                    'age': user.age,
                    'gender': user.gender,
                    'height': user.height,
                    'weight': user.weight,
                    'phone': user.phone
                  });
                });
                Navigator.pop(context);
              },
              child: Text(
                'Save',
              ),
            ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile Page',
          style: Constants.boldAppbarHeading,
        ),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: FutureBuilder<UserModel>(
            future: getUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                UserModel user = snapshot.data;
                return ListView(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        "Name:",
                        style: Constants.drawerList,
                      ),
                      subtitle: Text(
                        '${user.name}',
                        style: Constants.boldDoctorHeading,
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        "Age:",
                        style: Constants.drawerList,
                      ),
                      subtitle: Text(
                        '${user.age}',
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
                        '${user.gender}',
                        style: Constants.boldDoctorHeading,
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        "Height:",
                        style: Constants.drawerList,
                      ),
                      subtitle: Text(
                        '${user.height} cm',
                        style: Constants.boldDoctorHeading,
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        "Weight:",
                        style: Constants.drawerList,
                      ),
                      subtitle: Text(
                        '${user.weight} kg',
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
                        '${user.email}',
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
                        '${user.phone}',
                        style: Constants.boldDoctorHeading,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _alertDialogBuilder(user);
                      },
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
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
