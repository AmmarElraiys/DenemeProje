import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/business_logic/work_information/work_information_cubit.dart';
import 'package:test/presentation/widget/work_information_widgets.dart';

class WorkInformationScreen extends StatefulWidget {
  const WorkInformationScreen({super.key});

  @override
  State<WorkInformationScreen> createState() => _WorkInformationScreenState();
}

class _WorkInformationScreenState extends State<WorkInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkInformationCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('البيانات الوظيفية'),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: WorkInformationWidgets(),
        ),
      ),
    );
  }
}
