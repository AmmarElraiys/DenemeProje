import 'package:flutter/material.dart';
import 'package:test/data/models/administrative_information_model.dart';

class AdministrativeInformationState {
  final AdministrativeInformationModel model;
  final GlobalKey<FormState> formKey;

  AdministrativeInformationState({required this.model, required this.formKey});

  AdministrativeInformationState copyWith({
    AdministrativeInformationModel? model,
  }) {
    return AdministrativeInformationState(
      model: model ?? this.model,
      formKey: formKey,
    );
  }
}
