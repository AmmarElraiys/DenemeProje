import 'package:flutter/material.dart';
import 'package:test/data/models/employee_information_details_model.dart';

class EmployeeInformationDetailsState {
  final GlobalKey<FormState> formKey;
  final EmployeeInformationDetailsModel model;

  EmployeeInformationDetailsState({required this.formKey, required this.model});

  EmployeeInformationDetailsState copyWith({String? personalPhotoPath}) {
    return EmployeeInformationDetailsState(formKey: formKey, model: model);
  }
}

// import 'package:flutter/material.dart';
// import 'package:test/data/models/employee_information_details_model.dart';

// class EmployeeInformationDetailsState {
//   final String? personalPhotoPath; // ✅ Yeni değişken
//   final GlobalKey<FormState> formKey;
//   final EmployeeInformationDetailsModel model;
//   final TextEditingController personalPhotoController;
//   final TextEditingController maritalStatusController;
//   final TextEditingController numberOfChildrenController;
//   final TextEditingController participationSkillsController;
//   final TextEditingController certificatesController;
//   final TextEditingController additionalCommentsController;

//   EmployeeInformationDetailsState({
//     this.personalPhotoPath,
//     required this.formKey,
//     required this.model,
//     required this.personalPhotoController,
//     required this.maritalStatusController,
//     required this.numberOfChildrenController,
//     required this.participationSkillsController,
//     required this.certificatesController,
//     required this.additionalCommentsController,
//   });

//   EmployeeInformationDetailsState copyWith({String? personalPhotoPath}) {
//     return EmployeeInformationDetailsState(
//       personalPhotoPath: personalPhotoPath ?? this.personalPhotoPath,
//       formKey: formKey,
//       model: model,
//       personalPhotoController: personalPhotoController,
//       maritalStatusController: maritalStatusController,
//       numberOfChildrenController: numberOfChildrenController,
//       participationSkillsController: participationSkillsController,
//       certificatesController: certificatesController,
//       additionalCommentsController: additionalCommentsController,
//     );
//   }
// }
