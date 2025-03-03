import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/business_logic/financial_information/financial_information_cubit.dart';
import 'package:test/presentation/widget/validatoraddpersonel.dart';

class FinancialInformationForm extends StatelessWidget {
  const FinancialInformationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FinancialInformationCubit, FinancialInformationState>(
      builder: (context, state) {
        final cubit = context.read<FinancialInformationCubit>();

        return Form(
          key: state.formKey,
          child: Column(
            children: [
              if (state.model.paymentMethod == 'تحويل بنكي')
                buildTextField(
                  cubit.bankAccountController,
                  keyboardType: TextInputType.number,
                  onChanged: cubit.updateBankAccount,
                  'رقم الحساب البنكي',
                  validator: validateBankAccount, // ✅ Validator eklendi
                ),

              const SizedBox(height: 20),

              buildDropdownField(
                label: 'طريقة الدفع',
                value: state.model.paymentMethod,
                options: ['تحويل بنكي', 'نقدًا'],
                onChanged: (val) => cubit.changePaymentMethod(val!),
              ),

              const SizedBox(height: 20),

              buildTextField(
                cubit.taxesController,
                keyboardType: TextInputType.number,
                onChanged: cubit.updateTaxes,
                'الضرائب والاستقطاعات',
                validator: validateTaxes, // ✅ Validator eklendi
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => cubit.submitForm(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'حفظ البيانات',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              IconButton(
                onPressed: () => cubit.getFinancialInformation(),
                icon: const Icon(Icons.check_circle),
              ),
            ],
          ),
        );
      },
    );
  }
}
