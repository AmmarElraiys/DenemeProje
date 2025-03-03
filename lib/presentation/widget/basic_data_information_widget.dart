import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/business_logic/basic_data_information/basic_data_information_cubit.dart';
import 'package:test/business_logic/basic_data_information/basic_data_information_state.dart';
import 'package:test/presentation/widget/basic_data_information_button_widget.dart';
import 'package:test/presentation/widget/basic_data_information_textfield_widget.dart';

class BasicDataInformationWidget extends StatelessWidget {
  const BasicDataInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicDataInformationCubit, BasicDataInformationState>(
      builder: (context, state) {
        final cubit = context.read<BasicDataInformationCubit>();
        return Form(
          key: state.formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Textformfieldaddpersonel(
                  controller: cubit.nameController,
                  labelText: 'الاسم الكامل',
                  hint: 'من فضلك أدخل الاسم الكامل',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'من فضلك أدخل الاسم الكامل';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 16),
                Textformfieldaddpersonel(
                  controller: cubit.idPassportController,
                  labelText: 'رقم الهوية أو جواز السفر',
                  hint: 'من فضلك أدخل رقم الهوية أو جواز السفر',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'من فضلك أدخل رقم الهوية أو جواز السفر';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 16),
                Textformfieldaddpersonel(
                  controller: cubit.dobController,
                  labelText: 'تاريخ الميلاد',
                  hint: 'YYYY-MM-DD',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'من فضلك أدخل تاريخ الميلاد';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.datetime,
                ),
                SizedBox(height: 16),
                Textformfieldaddpersonel(
                  controller: cubit.genderController,
                  labelText: 'الجنس',
                  hint: 'من فضلك أدخل الجنس',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'من فضلك أدخل الجنس';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 16),
                Textformfieldaddpersonel(
                  controller: cubit.cityController,
                  labelText: 'المدينة',
                  hint: 'من فضلك أدخل المدينة',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'من فضلك أدخل المدينة';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.streetAddress,
                ),
                SizedBox(height: 16),
                Textformfieldaddpersonel(
                  controller: cubit.countryController,
                  labelText: 'الدولة',
                  hint: 'من فضلك أدخل الدولة',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'من فضلك أدخل الدولة';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.streetAddress,
                ),
                SizedBox(height: 16),
                Textformfieldaddpersonel(
                  controller: cubit.streetController,
                  labelText: 'الشارع',
                  hint: 'من فضلك أدخل الشارع',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'من فضلك أدخل الشارع';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.streetAddress,
                ),
                SizedBox(height: 16),
                Textformfieldaddpersonel(
                  controller: cubit.phoneController,
                  labelText: 'رقم الهاتف',
                  hint: 'من فضلك أدخل رقم الهاتف',
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'من فضلك أدخل رقم الهاتف';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                Textformfieldaddpersonel(
                  controller: cubit.emailController,
                  labelText: 'البريد الإلكتروني',
                  hint: 'من فضلك أدخل البريد الإلكتروني',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'من فضلك أدخل البريد الإلكتروني';
                    }
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return 'من فضلك أدخل بريد إلكتروني صالح';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Buttonaddpersonel(
                      onpressed:
                          () => context
                              .read<BasicDataInformationCubit>()
                              .addBasicDataInformationScreen(context),
                      text: 'إضافة موظف',
                    ),

                    Buttonaddpersonel(
                      onpressed:
                          () => context
                              .read<BasicDataInformationCubit>()
                              .updateBasicDataInformationScreen(context),
                      text: 'تعديل موظف',
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
