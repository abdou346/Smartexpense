class usermodel {
  String? displayName;
  String? phonenumber;
  String? uid;
  String? email;
  double? salary;
  double? regularexpenses;
  double? soldeactuel;

  String? datenaissance;
  usermodel(
      {this.displayName,
      this.phonenumber,
      this.uid,
      this.email,
      this.salary,
      this.regularexpenses,
      this.soldeactuel,
      this.datenaissance});
  factory usermodel.fromMap(map) {
    return usermodel(
      displayName: map['displayName'],
      phonenumber: map['phonenumber'],
      uid: map['uid'],
      email: map['email'],
      salary: map['salary'],
      regularexpenses: map['regularexpenses'],
      soldeactuel: map['soldeactuel'],
      datenaissance: map['datenaissance'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'displayName': displayName,
      'phonenumber': phonenumber,
      'uid': uid,
      'email': email,
      'salary': salary,
      'regularexpenses': regularexpenses,
      'soldeactuel': soldeactuel,
      'datenaissance': datenaissance
    };
  }
}
