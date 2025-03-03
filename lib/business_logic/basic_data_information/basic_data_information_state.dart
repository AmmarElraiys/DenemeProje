import 'package:flutter/material.dart';
import 'package:test/data/models/basic_data_information_model.dart';

class BasicDataInformationState {
  final GlobalKey<FormState> formKey;
  final BasicDataInformationModel model;

  BasicDataInformationState({required this.formKey, required this.model});
  BasicDataInformationState copyWith({BasicDataInformationModel? model}) {
    return BasicDataInformationState(
      formKey: formKey,
      model: model ?? this.model,
    );
  }
}
