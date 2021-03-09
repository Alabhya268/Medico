import 'package:flutter/material.dart';
import 'package:medico/constants.dart';
import 'package:medico/models/appointment_model.dart';
import 'package:medico/services/firebase_services.dart';
import 'package:medico/widgets.dart/appDrawer.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Appointments extends StatefulWidget {
  @override
  _AppointmentsState createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  FirebaseServices _firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Appointments', style: Constants.boldAppbarHeading),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder<QuerySnapshot>(
          future: _firebaseServices.appointmentRef
              .where('uid', isEqualTo: _firebaseServices.getUserId())
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.connectionState == ConnectionState.done) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: ListView(
                  children: snapshot.data.docs.map((document) {
                    AppointmentModel appointments =
                        AppointmentModel.fromData(document.data());
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            child: ClipRRect(
                              child: Image.network(
                                '${appointments.imageurl}',
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.low,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: ListTile(
                              contentPadding: EdgeInsets.all(0),
                              title: Text('${appointments.reason}', textDirection: TextDirection.ltr, overflow: TextOverflow.ellipsis,),
                              subtitle: Text(
                                  'time: ${appointments.time}\nData: ${appointments.date}'),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.remove_circle_outline_outlined),
                            onPressed: () {
                              setState(() {
                                _firebaseServices.appointmentRef
                                  .doc('${document.id}')
                                  .delete();
                              });
                            },
                            color: Colors.black38,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              );
            }

            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error));
            }
          }),
    );
  }
}
