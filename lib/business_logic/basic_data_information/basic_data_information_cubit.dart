import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/business_logic/basic_data_information/basic_data_information_state.dart';
import 'package:test/data/models/basic_data_information_model.dart';
import 'package:test/main.dart';

class BasicDataInformationCubit extends Cubit<BasicDataInformationState> {
  // Form key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Controller'lar
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idPassportController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  // Constructor
  BasicDataInformationCubit()
    : super(
        BasicDataInformationState(
          formKey: GlobalKey<FormState>(),
          model: BasicDataInformationModel(),
        ),
      );

  void updateModel(BasicDataInformationModel model) {
    emit(state.copyWith(model: model));
  }

  void updateName(String? name) {
    emit(state.copyWith(model: state.model.copyWith(name: name.toString())));
  }

  void updateIdPassport(String? idPassport) {
    emit(
      state.copyWith(
        model: state.model.copyWith(idpassport: idPassport.toString()),
      ),
    ); // Düzeltilmiş alan adı
  }

  void updateDob(String? dob) {
    if (dob != null) {
      emit(
        state.copyWith(
          model: state.model.copyWith(dob: DateTime.tryParse(dob)),
        ),
      );
    }
  }

  void updateGender(String? gender) {
    emit(
      state.copyWith(model: state.model.copyWith(gender: gender.toString())),
    );
  }

  void updateCity(String? city) {
    emit(state.copyWith(model: state.model.copyWith(city: city.toString())));
  }

  void updateCountry(String? country) {
    emit(
      state.copyWith(model: state.model.copyWith(country: country.toString())),
    );
  }

  void updateStreet(String? street) {
    emit(
      state.copyWith(model: state.model.copyWith(street: street.toString())),
    );
  }

  void updatePhone(String? phone) {
    emit(state.copyWith(model: state.model.copyWith(phone: phone.toString())));
  }

  void updateEmail(String? email) {
    emit(state.copyWith(model: state.model.copyWith(email: email.toString())));
  }

  void addBasicDataInformationScreen(BuildContext context) async {
    if (formKey.currentState?.validate() ?? false) {
      await basic_data_information.put("name", state.model.name);
      await basic_data_information.put("idPassport", state.model.idpassport);
      await basic_data_information.put(
        "dob",
        state.model.dob?.toIso8601String(),
      );
      await basic_data_information.put("gender", state.model.gender);
      await basic_data_information.put("city", state.model.city);
      await basic_data_information.put("country", state.model.country);
      await basic_data_information.put("street", state.model.street);
      await basic_data_information.put("phone", state.model.phone);
      await basic_data_information.put("email", state.model.email);
    }
  }

  void updateBasicDataInformationScreen(BuildContext context) async {
    var employeeData = await basic_data_information.getAllKeys();
    var employeeDataValues = await basic_data_information.getAllValues();

    print("==============Employee Data: $employeeData");
    print("-----------------------------------------------------");
    print("==============Employee Data Values: $employeeDataValues");

    if (formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('تم تحديث بيانات الموظف')));
    }
  }

  // Dispose fonksiyonu ile controller'ları temizleyelim
  @override
  Future<void> close() {
    nameController.dispose();
    idPassportController.dispose();
    dobController.dispose();
    genderController.dispose();
    cityController.dispose();
    countryController.dispose();
    streetController.dispose();
    phoneController.dispose();
    emailController.dispose();
    return super.close();
  }
}
