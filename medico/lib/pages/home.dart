import 'package:flutter/material.dart';
import 'package:medico/constants.dart';
import 'package:medico/models/doctor_model.dart';
import 'package:medico/pages/doctor.dart';
import 'package:medico/services/firebase_services.dart';
import 'package:medico/widgets.dart/appDrawer.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseServices _firebaseServices = FirebaseServices();

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
      body: FutureBuilder<QuerySnapshot>(
        future: _firebaseServices.doctorRef.get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.hasError}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Theme.of(context).accentColor,
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: 9 / 10,
              children: snapshot.data.docs.map(
                (document) {
                  DoctorModel doctor = DoctorModel.fromData(document.data());
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Doctor(
                          uid: doctor.uid,
                        );
                      }));
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          margin: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.greenAccent,
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                '${doctor.imgurl}',
                                fit: BoxFit.cover,
                              )),
                        ),
                        ListTile(
                          minVerticalPadding: 120,
                          contentPadding: EdgeInsets.all(24),
                          title: Text(
                            '${doctor.name}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                            textDirection: TextDirection.ltr,
                          ),
                          subtitle: Text(
                            '${doctor.specialistof}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis,
                            textDirection: TextDirection.ltr,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
            );
          }
        },
      ),
    );
  }
}
