import 'package:flutter/material.dart';
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
  dynamic _fromDate;
  dynamic _fromTime;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Book Appointment', style: Constants.boldAppbarHeading)),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  _fromTime ?? 'Select Time',
                  style: Constants.boldDoctorSubHeading,
                )),
              ],
            ),
            Column(
              children: [
                Center(
                    child: Text(
                  _fromDate ?? 'Select Date',
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
            CustomBtn(label: 'Book Appointment', onTap: () {})
          ],
        ),
      ),
    );
  }
}
