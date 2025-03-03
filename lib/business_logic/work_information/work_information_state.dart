import 'package:flutter/material.dart';
import 'package:test/data/models/work_information_model.dart';

class WorkInformationState {
  final WorkInformationModel model;
  final GlobalKey<FormState> formKey;

  WorkInformationState({required this.model, required this.formKey});

  WorkInformationState copyWith({WorkInformationModel? model}) {
    return WorkInformationState(formKey: formKey, model: model ?? this.model);
  }
}

// import 'package:flutter/material.dart';
// import 'package:test/data/models/work_information_model.dart';

// class WorkInformationState {
//   final WorkInformationModel model;
//   final TextEditingController jobTitleController;
//   final TextEditingController employeeNumberController;
//   final TextEditingController hireDateController;
//   final TextEditingController employmentTypeController;
//   final TextEditingController departmentController;
//   final TextEditingController directSupervisorController;
//   final TextEditingController seniorityLevelController;
//   final TextEditingController basicSalaryController;
//   final TextEditingController incentivesController;
//   final TextEditingController employmentStatusController;
//   final GlobalKey<FormState> formKey;

//   WorkInformationState({
//     required this.model,
//     required this.formKey,
//     required this.jobTitleController,
//     required this.employeeNumberController,
//     required this.hireDateController,
//     required this.employmentTypeController,
//     required this.departmentController,
//     required this.directSupervisorController,
//     required this.seniorityLevelController,
//     required this.basicSalaryController,
//     required this.incentivesController,
//     required this.employmentStatusController,
//   });

//   WorkInformationState copyWith({
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
//     return WorkInformationState(
//       formKey: formKey, // Ensure that formKey is always preserved
//       model: model ?? this.model,
//       jobTitleController: jobTitleController ?? this.jobTitleController,
//       employeeNumberController:
//           employeeNumberController ?? this.employeeNumberController,
//       hireDateController: hireDateController ?? this.hireDateController,
//       employmentTypeController:
//           employmentTypeController ?? this.employmentTypeController,
//       departmentController: departmentController ?? this.departmentController,
//       directSupervisorController:
//           directSupervisorController ?? this.directSupervisorController,
//       seniorityLevelController:
//           seniorityLevelController ?? this.seniorityLevelController,
//       basicSalaryController:
//           basicSalaryController ?? this.basicSalaryController,
//       incentivesController: incentivesController ?? this.incentivesController,
//       employmentStatusController:
//           employmentStatusController ?? this.employmentStatusController,
//     );
//   }
// }
