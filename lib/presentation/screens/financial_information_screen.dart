import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/business_logic/financial_information/financial_information_cubit.dart';
import 'package:test/presentation/widget/financialInformation_widget.dart';

class FinancialInformationScreen extends StatelessWidget {
  const FinancialInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FinancialInformationCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('البيانات المالية'),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: FinancialInformationForm(),
        ),
      ),
    );
  }
}
