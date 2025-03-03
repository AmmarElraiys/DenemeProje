class FinancialInformationModel {
  final String paymentMethod;
  final String? bankAccount;
  final String? taxes;

  FinancialInformationModel({
    required this.paymentMethod,
    this.bankAccount,
    this.taxes,
  });

  FinancialInformationModel copyWith({
    String? paymentMethod,
    String? bankAccount,
    String? taxes,
  }) {
    return FinancialInformationModel(
      paymentMethod: paymentMethod ?? this.paymentMethod,
      bankAccount: bankAccount ?? this.bankAccount,
      taxes: taxes ?? this.taxes,
    );
  }
}
