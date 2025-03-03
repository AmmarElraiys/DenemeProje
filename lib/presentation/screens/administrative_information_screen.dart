import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/business_logic/administrative_information/administrative_information_cubit.dart';
import 'package:test/presentation/widget/administrative_information_widgets.dart';

class AdministrativeInformationScreen extends StatelessWidget {
  const AdministrativeInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdministrativeInformationCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('البيانات الادارية'),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: AdministrativeInformationWidgets(),
        ),
      ),
    );
  }
}
