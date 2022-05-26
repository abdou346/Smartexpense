class expensesmodel {
  String? name;
  double? monthlygoal;

  double? Amount;

  expensesmodel({
    this.name,
    this.monthlygoal,
    this.Amount,
  });
  factory expensesmodel.fromMap(map) {
    return expensesmodel(
      name: map['name'],
      monthlygoal: map['monthlygoal'],
      Amount: map['Amount'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'type': monthlygoal,
      'Amount': Amount,
    };
  }
}
