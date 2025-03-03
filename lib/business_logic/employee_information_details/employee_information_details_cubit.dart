import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test/business_logic/employee_information_details/employee_information_details_state.dart';
import 'package:test/data/models/employee_information_details_model.dart';

class EmployeeInformationDetailsCubit
    extends Cubit<EmployeeInformationDetailsState> {
  TextEditingController personalPhotoController = TextEditingController();
  TextEditingController maritalStatusController = TextEditingController();
  TextEditingController numberOfChildrenController = TextEditingController();
  TextEditingController participationSkillsController = TextEditingController();
  TextEditingController certificatesController = TextEditingController();
  TextEditingController additionalCommentsController = TextEditingController();
  EmployeeInformationDetailsCubit()
    : super(
        EmployeeInformationDetailsState(
          formKey: GlobalKey<FormState>(),
          model: EmployeeInformationDetailsModel(),
        ),
      );
  Future<void> pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('التقاط صورة'),
                onTap: () async {
                  final XFile? pickedFile = await picker.pickImage(
                    source: ImageSource.camera,
                  );
                  if (pickedFile != null) {
                    emit(state.copyWith(personalPhotoPath: pickedFile.path));
                  }
                  Navigator.pop(context); // Bunu en sona aldık
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('اختيار من المعرض'),
                onTap: () async {
                  final XFile? pickedFile = await picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  if (pickedFile != null) {
                    emit(state.copyWith(personalPhotoPath: pickedFile.path));
                  }
                  Navigator.pop(context); // Bunu en sona aldık
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void submitForm(BuildContext context) {
    if (state.formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('تم حفظ البيانات بنجاح')));
    }
  }

  @override
  Future<void> close() {
    personalPhotoController.dispose();
    personalPhotoController.dispose();
    maritalStatusController.dispose();
    numberOfChildrenController.dispose();
    participationSkillsController.dispose();
    certificatesController.dispose();
    additionalCommentsController.dispose();
    return super.close();
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:test/business_logic/employee_information_details/employee_information_details_state.dart';
// import 'package:test/data/models/employee_information_details_model.dart';

// class EmployeeInformationDetailsCubit
//     extends Cubit<EmployeeInformationDetailsState> {
//   EmployeeInformationDetailsCubit()
//     : super(
//         EmployeeInformationDetailsState(
//           formKey: GlobalKey<FormState>(),
//           model: EmployeeInformationDetailsModel(),
//           personalPhotoController: TextEditingController(),
//           maritalStatusController: TextEditingController(),
//           numberOfChildrenController: TextEditingController(),
//           participationSkillsController: TextEditingController(),
//           certificatesController: TextEditingController(),
//           additionalCommentsController: TextEditingController(),
//         ),
//       );
//   Future<void> pickImage(BuildContext context) async {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return SafeArea(
//           child: Wrap(
//             children: [
//               ListTile(
//                 leading: const Icon(Icons.camera),
//                 title: const Text('التقاط صورة'),
//                 onTap: () async {
//                   Navigator.pop(context);
//                   final XFile? pickedFile = await ImagePicker().pickImage(
//                     source: ImageSource.camera,
//                   );
//                   if (pickedFile != null) {
//                     emit(state.copyWith(personalPhotoPath: pickedFile.path));
//                   }
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.photo_library),
//                 title: const Text('اختيار من المعرض'),
//                 onTap: () async {
//                   Navigator.pop(context);
//                   final XFile? pickedFile = await ImagePicker().pickImage(
//                     source: ImageSource.gallery,
//                   );
//                   if (pickedFile != null) {
//                     emit(state.copyWith(personalPhotoPath: pickedFile.path));
//                   }
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   void submitForm(BuildContext context) {
//     if (state.formKey.currentState!.validate()) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text('تم حفظ البيانات بنجاح')));
//     }
//   }

//   @override
//   Future<void> close() {
//     state.personalPhotoController.dispose();
//     state.maritalStatusController.dispose();
//     state.numberOfChildrenController.dispose();
//     state.participationSkillsController.dispose();
//     state.certificatesController.dispose();
//     state.additionalCommentsController.dispose();
//     return super.close();
//   }
// }
