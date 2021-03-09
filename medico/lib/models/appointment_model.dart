class AppointmentModel {
  String imageurl;
  String uid;
  String doctoruid;
  String reason;
  String time;
  String date;

  AppointmentModel({
    this.imageurl,
    this.uid,
    this.doctoruid,
    this.reason,
    this.time,
    this.date,
  });

  AppointmentModel.fromData(Map<String, dynamic> data)
      : imageurl = data['imageurl'],
        uid = data['uid'],
        doctoruid = data['doctoruid'],
        reason = data['reason'],
        time = data['time'],
        date = data['date'];

  Map<String, dynamic> toJson() {
    return {
      'imageurl': imageurl,
      'uid': uid,
      'doctoruid': doctoruid,
      'reason': reason,
      'time': time,
      'date': date,
    };
  }
}
