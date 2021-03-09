import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medico/models/appointment.dart';
import 'package:medico/services/firebase_services.dart';
import 'package:medico/widgets.dart/customBtn.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

class BookAppointment extends StatefulWidget {
  final doctorUid;

  const BookAppointment({Key key, this.doctorUid}) : super(key: key);
  @override
  _BookAppointmentState createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  FirebaseServices _firebaseServices = FirebaseServices();

  String _fromDate;
  String _fromTime;

  Appointment _appointment;

  String reason;

  int _initialTime = 10;

  Future<void> _showDatePicker(context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 5)));
    if (picked != null && picked != _fromDate) {
      setState(() {
        _fromDate = DateFormat.yMMMd().format(picked);
      });
    }
  }

  Future _bookAppointment() {
    _appointment = Appointment(
      uid: _firebaseServices.getUserId(),
      doctoruid: widget.doctorUid,
      reason: reason,
      time: _fromTime,
      date: _fromDate,
    );
    return _firebaseServices.appointmentRef.doc().set(_appointment.toJson());
  }

  bool validateFields() {
    bool msg = false;
    if (_fromTime == null || _fromDate == null || reason == null) {
      msg = false;
    } else {
      msg = true;
    }
    return msg;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Book Appointment', style: Constants.boldAppbarHeading)),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: ListView(
          children: [
            Column(
              children: [
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: 5 / 2,
                  children: [
                    for (int i = 0; i < 6; i++)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _fromTime =
                                '${_initialTime + i * 2 - 2}:00 - ${_initialTime + i * 2}:00';
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 6),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                                child: Text(
                                    '${_initialTime + i * 2 - 2}:00 - ${_initialTime + i * 2}:00')),
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Center(
                    child: Text(
                  'Selected time: $_fromTime '?? 'Select Time',
                  style: Constants.boldDoctorSubHeading,
                )),
              ],
            ),
            SizedBox(
              height: 72,
            ),
            Column(
              children: [
                Center(
                    child: Text(
                  'Selected date: $_fromDate' ?? 'Select Date',
                  style: Constants.boldDoctorSubHeading,
                )),
                SizedBox(
                  height: 24,
                ),
                CustomBtn(
                  label: 'Pick the date',
                  onTap: () {
                    _showDatePicker(context);
                  },
                )
              ],
            ),
            SizedBox(
              height: 48,
            ),
            TextFormField(
              textInputAction: TextInputAction.done,
              autofocus: false,
                  decoration:
                      InputDecoration(hintText: 'Reason for appointment ...'),
                  onChanged: (value) {
                    reason = value;
                  },
                ),
                SizedBox(height: 48),
            CustomBtn(
              label: 'Book Appointment',
              onTap: () {
                validateFields()
                    ? _bookAppointment().then(
                        (value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Appointment booked sucessfully'),
                              duration: Duration(seconds: 2),
                              action: SnackBarAction(
                                label: 'Dismiss',
                                textColor: Colors.blue,
                                onPressed: () {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                },
                              ),
                            ),
                          );
                          Navigator.pop(context);
                        },
                      )
                    : ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('All fields are necessary'),
                          duration: Duration(seconds: 2),
                          action: SnackBarAction(
                            label: 'Dismiss',
                            textColor: Colors.blue,
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                            },
                          ),
                        ),
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
