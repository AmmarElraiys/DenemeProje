import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/business_logic/employee_information_details/employee_information_details_cubit.dart';
import 'package:test/presentation/widget/employee_information_details_widge.dart';

class EmployeeInformationDetailsScreen extends StatelessWidget {
  const EmployeeInformationDetailsScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmployeeInformationDetailsCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('البيانات الشخصية للموظف'),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: const EmployeeInformationDetailsWidget(),
        ),
      ),
    );
  }
}
