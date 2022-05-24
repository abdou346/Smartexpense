class usermodel {
  String? displayName;
  String? phonenumber;
  String? uid;
  String? email;
  double? salary;
  double? regularexpenses;
  double? soldeactuel;
  double? expenses;
  String? datenaissance;
  bool? updated;
  String? Devise;
  double? Savings;
  double? monthlyexpense;
  usermodel(
      {this.displayName,
      this.phonenumber,
      this.uid,
      this.email,
      this.salary,
      this.regularexpenses,
      this.soldeactuel,
      this.expenses,
      this.datenaissance,
      this.updated,
      this.Devise,
      this.Savings,
      this.monthlyexpense});
  factory usermodel.fromMap(map) {
    return usermodel(
        displayName: map['displayName'],
        phonenumber: map['phonenumber'],
        uid: map['uid'],
        email: map['email'],
        salary: map['salary'],
        regularexpenses: map['regularexpenses'],
        expenses: map['expenses'],
        soldeactuel: map['soldeactuel'],
        datenaissance: map['datenaissance'],
        updated: map['updated'],
        Devise: map['Devise'],
        Savings: map['Savings'],
        monthlyexpense: map['monthlyexpense']);
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
      'datenaissance': datenaissance,
      'expenses': expenses,
      'updated': updated,
      'Devise': Devise,
      'Savings': Savings,
      'monthlyexpense': monthlyexpense,
    };
  }
}
