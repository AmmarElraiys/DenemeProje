import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/business_logic/administrative_information/administrative_information_state.dart';
import 'package:test/data/models/administrative_information_model.dart';

class AdministrativeInformationCubit
    extends Cubit<AdministrativeInformationState> {
  TextEditingController lastPromotionDateController = TextEditingController();
  TextEditingController workShiftController = TextEditingController();
  TextEditingController workLocationController = TextEditingController();
  TextEditingController leaveDaysController = TextEditingController();
  TextEditingController weeklyHoursController = TextEditingController();
  TextEditingController performanceEvaluationController =
      TextEditingController();
  TextEditingController branchNameController = TextEditingController();
  AdministrativeInformationCubit()
    : super(
        AdministrativeInformationState(
          model: AdministrativeInformationModel(),
          formKey: GlobalKey<FormState>(),
        ),
      );
  void changeBranchName(String method) {
    final updatedModel = state.model.copyWith(branchName: method);
    emit(state.copyWith(model: updatedModel));

    if (method == 'فرعي') {
      branchNameController.clear();
    }
  }

  void updateWorkShift(String? workShift) {
    emit(state.copyWith(model: state.model.copyWith(workShift: workShift)));
  }

  void updateLastPromotionDateController(String dateText) {
    DateTime? parsedDate = DateTime.tryParse(dateText);
    if (parsedDate != null) {
      emit(
        state.copyWith(
          model: state.model.copyWith(lastPromotionDate: parsedDate),
        ),
      );
    } else {
      print('Invalid date format');
    }
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      context
          .read<AdministrativeInformationCubit>()
          .updateLastPromotionDateController(pickedDate.toIso8601String());
    }
  }

  void updateleavedays(String? leaveDays) {
    emit(state.copyWith(model: state.model.copyWith(leaveDays: leaveDays)));
  }

  void updateweeklyhours(String? weeklyHours) {
    emit(state.copyWith(model: state.model.copyWith(weeklyHours: weeklyHours)));
  }

  void updateperformanceevaluation(String? performanceEvaluation) {
    emit(
      state.copyWith(
        model: state.model.copyWith(
          performanceEvaluation: performanceEvaluation,
        ),
      ),
    );
  }

  void updatebranchname(String? branchName) {
    emit(state.copyWith(model: state.model.copyWith(branchName: branchName)));
  }

  void updateWorkLocation(String? workLocation) {
    emit(
      state.copyWith(model: state.model.copyWith(workLocation: workLocation)),
    );
  }

  void submitForm(BuildContext context) {
    if (state.formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم حفظ البيانات الإدارية بنجاح')),
      );
    }
  }
}
