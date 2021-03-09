import 'package:flutter/material.dart';
import 'package:medico/models/doctor_model.dart';
import 'package:medico/pages/book_appointment.dart';
import 'package:medico/services/firebase_services.dart';
import 'package:medico/widgets.dart/customBtn.dart';
import '../constants.dart';

class Doctor extends StatefulWidget {
  final uid;

  const Doctor({Key key, this.uid}) : super(key: key);
  @override
  _DoctorState createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
  FirebaseServices _firebaseServices = FirebaseServices();

  Future<DoctorModel> getDoctor() async {
    return await _firebaseServices.doctorRef
        .doc(widget.uid)
        .get()
        .then((value) => DoctorModel.fromData(value.data()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Doctor Name', style: Constants.boldAppbarHeading)),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FutureBuilder<DoctorModel>(
            future: getDoctor(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }

              if (snapshot.connectionState == ConnectionState.done) {
                DoctorModel doctor = snapshot.data;
                return ListView(
                  children: [
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          '${doctor.imgurl}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        "${doctor.name}",
                        style: Constants.boldDoctorHeading,
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        'Specialist In:',
                        style: Constants.boldDoctorSubHeading,
                      ),
                      subtitle: Text(
                        '${doctor.specialistof}',
                        style: Constants.drawerList,
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        'Contact no:',
                        style: Constants.boldDoctorSubHeading,
                      ),
                      subtitle: Text(
                        '${doctor.phone}',
                        style: Constants.drawerList,
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        'Email:',
                        style: Constants.boldDoctorSubHeading,
                      ),
                      subtitle: Text(
                        '${doctor.email}',
                        style: Constants.drawerList,
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        'Professional Bio:',
                        style: Constants.boldDoctorSubHeading,
                      ),
                      subtitle: Text(
                        '${doctor.bio}',
                        style: Constants.drawerList,
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                            child: CustomBtn(
                          label: 'Consult Online',
                        )),
                        SizedBox(width: 6),
                        Expanded(
                            child: CustomBtn(
                          label: 'Book Appointment',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return BookAppointment(
                                    doctorUid: doctor.uid,
                                    imageurl: doctor.imgurl,
                                  );
                                },
                              ),
                            );
                          },
                        ))
                      ],
                    ),
                  ],
                );
              }
            }),
      ),
    );
  }
}
