import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/business_logic/basic_data_information/basic_data_information_cubit.dart';
import 'package:test/presentation/widget/basic_data_information_widget.dart';

class BasicDataInformationScreen extends StatefulWidget {
  const BasicDataInformationScreen({super.key});

  @override
  _BasicDataInformationScreenState createState() =>
      _BasicDataInformationScreenState();
}

class _BasicDataInformationScreenState
    extends State<BasicDataInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BasicDataInformationCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("واجهة إضافة وتعديل بيانات الموظف"),
          backgroundColor: Colors.grey,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BasicDataInformationWidget(),
        ),
      ),
    );
  }
}
