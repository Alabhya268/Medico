import 'package:cloud_firestore/cloud_firestore.dart';

class Appointment {
  String uid;
  String doctoruid;
  String reason;
  String time;
  String date;

  Appointment({
    this.uid,
    this.doctoruid,
    this.reason,
    this.time,
    this.date,
  });

  Appointment.fromData(Map<String, dynamic> data)
      : uid = data['uid'],
        doctoruid = data['doctoruid'],
        reason = data['reason'],
        time = data['time'],
        date = data['date'];

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'doctoruid': doctoruid,
      'reason': reason,
      'time': time,
      'date': date,
    };
  }
}
