class expensesmodel {
  String? name;
  String? type;

  double? Amount;

  expensesmodel({
    this.name,
    this.type,
    this.Amount,
  });
  factory expensesmodel.fromMap(map) {
    return expensesmodel(
      name: map['name'],
      type: map['type'],
      Amount: map['Amount'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'type': type,
      'Amount': Amount,
    };
  }
}
