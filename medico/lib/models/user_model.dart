class UserModel {
  String uid;
  String name;
  int age;
  String gender;
  int height;
  int weight;
  String email;
  int phone;

  UserModel(
      {this.uid,
      this.name,
      this.age,
      this.gender,
      this.height,
      this.weight,
      this.email,
      this.phone});

  UserModel.fromData(Map<String, dynamic> data)
      : uid = data['uid'],
        name = data['name'],
        age = data['age'],
        gender = data['gender'],
        height = data['height'],
        weight = data['weight'],
        email = data['email'],
        phone = data['phone'];

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'age': age,
      'gender': gender,
      'height': height,
      'weight': weight,
      'email': email,
      'phone': phone,
    };
  }
}
