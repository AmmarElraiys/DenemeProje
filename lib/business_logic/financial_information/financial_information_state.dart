part of 'financial_information_cubit.dart';

class FinancialInformationState {
  final GlobalKey<FormState> formKey;
  final FinancialInformationModel model;

  FinancialInformationState({required this.formKey, required this.model});

  FinancialInformationState copyWith({FinancialInformationModel? model}) {
    return FinancialInformationState(
      formKey: formKey,
      model: model ?? this.model,
    );
  }
}
