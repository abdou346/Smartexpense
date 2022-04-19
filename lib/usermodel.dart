class usermodel {
  String? displayname;
  String? phonenumber;
  String? uid;
  String? email;
  double? salary;
  double? regularexpenses;
  double? soldeactuel;
  int? age;
  String? datenaissance;
  usermodel(
      {this.displayname,
      this.phonenumber,
      this.uid,
      this.email,
      this.salary,
      this.regularexpenses,
      this.soldeactuel,
      this.age,
      this.datenaissance});
  factory usermodel.fromMap(map) {
    return usermodel(
      displayname: map['displayname'],
      phonenumber: map['phonenumber'],
      uid: map['uid'],
      email: map['email'],
      salary: map['salary'],
      regularexpenses: map['regularexpenses'],
      soldeactuel: map['soldeactuel'],
      age: map['age'],
      datenaissance: map['datenaissance'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'displayname': displayname,
      'phonenumber': phonenumber,
      'uid': uid,
      'email': email,
      'salary': salary,
      'regularexpenses': regularexpenses,
      'soldeactuel': soldeactuel,
      'age': age,
      'datenaissance': datenaissance
    };
  }
}
