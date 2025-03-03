import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/business_logic/work_information/work_information_state.dart';
import 'package:test/data/models/work_information_model.dart';
import 'package:test/main.dart';

class WorkInformationCubit extends Cubit<WorkInformationState> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController employeeNumberController =
      TextEditingController();
  final TextEditingController hireDateController = TextEditingController();
  final TextEditingController employmentTypeController =
      TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController directSupervisorController =
      TextEditingController();
  final TextEditingController seniorityLevelController =
      TextEditingController();
  final TextEditingController basicSalaryController = TextEditingController();
  final TextEditingController incentivesController = TextEditingController();
  final TextEditingController employmentStatusController =
      TextEditingController();

  DateTime? hireDate;

  WorkInformationCubit()
    : super(
        WorkInformationState(
          model: WorkInformationModel(),
          formKey: GlobalKey<FormState>(),
        ),
      );

  Future<void> selectHireDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      hireDate = picked;
      hireDateController.text =
          picked.toString().split(" ")[0]; // Sadece tarihi göster
    }
  }

  void submitForm(BuildContext context) async {
    if (state.formKey.currentState?.validate() ?? false) {
      final jobInfo = WorkInformationModel(
        jobTitle: jobTitleController.text,
        employeeNumber: employeeNumberController.text,
        hireDate: hireDate ?? DateTime.now(),
        employmentType: employmentTypeController.text,
        department: departmentController.text,
        directSupervisor: directSupervisorController.text,
        seniorityLevel: seniorityLevelController.text,
        basicSalary: double.tryParse(basicSalaryController.text) ?? 0.0,
        incentives: double.tryParse(incentivesController.text) ?? 0.0,
        employmentStatus: employmentStatusController.text,
      );

      await work_information.put('workInformation', jobInfo);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم حفظ البيانات الوظيفية بنجاح')),
      );
    }
  }

  void getWorkInformation() async {
    final workInfo = await work_information.get('workInformation');
    emit(state.copyWith(model: workInfo));
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive_ce/hive.dart';
// import 'package:test/business_logic/work_information/work_information_state.dart';
// import 'package:test/data/models/work_information_model.dart';

// class WorkInformationCubit extends Cubit<WorkInformationState> {
//   final formKey = GlobalKey<FormState>();

//   final TextEditingController jobTitleController = TextEditingController();
//   final TextEditingController employeeNumberController =
//       TextEditingController();
//   final TextEditingController departmentController = TextEditingController();
//   final TextEditingController directSupervisorController =
//       TextEditingController();
//   final TextEditingController basicSalaryController = TextEditingController();
//   final TextEditingController incentivesController = TextEditingController();

//   // int generateAutoId() {
//   //   final box = Hive.box('work_information');
//   //   int lastId = box.get('id_counter', defaultValue: 0);
//   //   int newId = lastId + 1;
//   //   box.put('id_counter', newId);
//   //   return newId;
//   // }

//   DateTime? hireDate;
//   String employmentType = 'دوام كامل';
//   String seniorityLevel = 'موظف عادي';
//   String employmentStatus = 'نشط';
//   WorkInformationCubit()
//     : super(
//         WorkInformationState(
//           model: WorkInformationModel(),
//           formKey: GlobalKey<FormState>(),
//           jobTitleController: TextEditingController(),
//           employeeNumberController: TextEditingController(),
//           hireDateController: TextEditingController(),
//           employmentTypeController: TextEditingController(),
//           departmentController: TextEditingController(),
//           directSupervisorController: TextEditingController(),
//           seniorityLevelController: TextEditingController(),
//           basicSalaryController: TextEditingController(),
//           incentivesController: TextEditingController(),
//           employmentStatusController: TextEditingController(),
//         ),
//       );
//   Future<void> selectHireDate(BuildContext context) async {
//     final picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1980),
//       lastDate: DateTime(2100),
//     );
//     if (picked != null) {
//       emit(
//         state.copyWith(
//           hireDateController: TextEditingController(text: picked.toString()),
//         ),
//       );
//     }
//   }

//   // Example function to update the state if needed
//   void updateWorkInformationState({
//     WorkInformationModel? model,
//     TextEditingController? jobTitleController,
//     TextEditingController? employeeNumberController,
//     TextEditingController? hireDateController,
//     TextEditingController? employmentTypeController,
//     TextEditingController? departmentController,
//     TextEditingController? directSupervisorController,
//     TextEditingController? seniorityLevelController,
//     TextEditingController? basicSalaryController,
//     TextEditingController? incentivesController,
//     TextEditingController? employmentStatusController,
//   }) {
//     emit(
//       state.copyWith(
//         model: model,
//         jobTitleController: jobTitleController,
//         employeeNumberController: employeeNumberController,
//         hireDateController: hireDateController,
//         employmentTypeController: employmentTypeController,
//         departmentController: departmentController,
//         directSupervisorController: directSupervisorController,
//         seniorityLevelController: seniorityLevelController,
//         basicSalaryController: basicSalaryController,
//         incentivesController: incentivesController,
//         employmentStatusController: employmentStatusController,
//       ),
//     );
//   }

//   void submitForm(BuildContext context) async {
//     if (state.formKey.currentState!.validate()) {
//       // ignore: unused_local_variable
//       final jobInfo = WorkInformationModel(
//         jobTitle: state.jobTitleController.text,
//         employeeNumber: state.employeeNumberController.text,
//         hireDate: DateTime.now(),
//         employmentType: state.employmentTypeController.text,
//         department: state.departmentController.text,
//         directSupervisor: state.directSupervisorController.text,
//         seniorityLevel: state.seniorityLevelController.text,
//         basicSalary: double.tryParse(state.basicSalaryController.text) ?? 0.0,
//         incentives: double.tryParse(state.incentivesController.text) ?? 0.0,
//         employmentStatus: state.employmentStatusController.text,
//       );
//       await Hive.box('work_information').put('workInformation', jobInfo);
//       await Hive.box(
//         'work_information',
//       ).put('jobTitleController', state.jobTitleController.text);
//       await Hive.box(
//         'work_information',
//       ).put('employeeNumberController', state.employeeNumberController.text);
//       await Hive.box(
//         'work_information',
//       ).put('departmentController', state.departmentController.text);
//       await Hive.box('work_information').put(
//         'directSupervisorController',
//         state.directSupervisorController.text,
//       );
//       await Hive.box(
//         'work_information',
//       ).put('seniorityLevelController', state.seniorityLevelController.text);
//       await Hive.box(
//         'work_information',
//       ).put('basicSalaryController', state.basicSalaryController.text);
//       await Hive.box(
//         'work_information',
//       ).put('incentivesController', state.incentivesController.text);
//       await Hive.box('work_information').put(
//         'employmentStatusController',
//         state.employmentStatusController.text,
//       );

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('تم حفظ البيانات الوظيفية بنجاح')),
//       );
//     }
//   }

//   void dispose() {
//     state.jobTitleController.dispose();
//     state.employeeNumberController.dispose();
//     state.departmentController.dispose();
//     state.directSupervisorController.dispose();
//     state.basicSalaryController.dispose();
//     state.incentivesController.dispose();
//   }
// }
