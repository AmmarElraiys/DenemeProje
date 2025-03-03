import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/data/models/financial_information_model.dart';
import 'package:test/main.dart';

part 'financial_information_state.dart';

class FinancialInformationCubit extends Cubit<FinancialInformationState> {
  TextEditingController bankAccountController = TextEditingController();
  TextEditingController taxesController = TextEditingController();
  FinancialInformationCubit()
    : super(
        FinancialInformationState(
          formKey: GlobalKey<FormState>(),
          model: FinancialInformationModel(paymentMethod: 'تحويل بنكي'),
        ),
      );

  void changePaymentMethod(String method) {
    final updatedModel = state.model.copyWith(paymentMethod: method);
    emit(state.copyWith(model: updatedModel));

    if (method == 'نقدًا') {
      bankAccountController.clear();
    }
  }

  void updateBankAccount(String value) {
    final updatedModel = state.model.copyWith(bankAccount: value);
    emit(state.copyWith(model: updatedModel));
  }

  void updateTaxes(String value) {
    final updatedModel = state.model.copyWith(taxes: value);
    emit(state.copyWith(model: updatedModel));
  }

  void submitForm(BuildContext context) {
    if (state.formKey.currentState!.validate()) {
      financialInformation.put(
        'bankAccountController',
        state.model.bankAccount,
      );
      financialInformation.put('taxesController', taxesController);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم حفظ البيانات المالية بنجاح')),
      );
    }
  }

  void getFinancialInformation() async {
    var financialInformationKeys = await financialInformation.getAllKeys();
    var financialInformationValues = await financialInformation.getAllValues();
    print("==============Financial Information: $financialInformationKeys");
    print("-----------------------------------------------------");
    print(
      "==============Financial Information Values: $financialInformationValues",
    );
  }

  @override
  Future<void> close() {
    bankAccountController.dispose();
    taxesController.dispose();
    return super.close();
  }
}
