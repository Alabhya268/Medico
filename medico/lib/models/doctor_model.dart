class DoctorModel {
  String imgurl;
  String uid;
  String name;
  String specialistof;
  String email;
  int phone;
  String bio;

  DoctorModel({
    this.imgurl,
    this.uid,
    this.name,
    this.specialistof,
    this.email,
    this.phone,
    this.bio,
  });

  DoctorModel.fromData(Map<String, dynamic> data)
      : imgurl = data['imgurl'],
        uid = data['uid'],
        name = data['name'],
        specialistof = data['specialistof'],
        bio = data['bio'],
        email = data['email'],
        phone = data['phone'];

  Map<String, dynamic> toJson() {
    return {
      'imgurl': imgurl,
      'uid': uid,
      'name': name,
      'specialistof': specialistof,
      'bio': bio,
      'email': email,
      'phone': phone,
    };
  }
}
