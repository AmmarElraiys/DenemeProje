import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/business_logic/employee_information_details/employee_information_details_cubit.dart';
import 'package:test/business_logic/employee_information_details/employee_information_details_state.dart';

class EmployeeInformationDetailsWidget extends StatelessWidget {
  const EmployeeInformationDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      EmployeeInformationDetailsCubit,
      EmployeeInformationDetailsState
    >(
      builder: (context, state) {
        final cubit = context.read<EmployeeInformationDetailsCubit>();
        return Form(
          key: state.formKey,
          child: Column(
            children: [
              GestureDetector(
                onTap: () => cubit.pickImage(context),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  backgroundImage:
                      cubit.personalPhotoController.text.isEmpty
                          ? null
                          : FileImage(File(cubit.personalPhotoController.text)),
                  child:
                      cubit.personalPhotoController.text.isEmpty
                          ? const Icon(Icons.camera_alt, size: 50)
                          : null,
                ),
              ),
              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                value:
                    cubit.maritalStatusController.text.isEmpty
                        ? null
                        : cubit.maritalStatusController.text,
                decoration: const InputDecoration(
                  labelText: 'الحالة الاجتماعية',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 'أعزب', child: Text('أعزب')),
                  DropdownMenuItem(value: 'متزوج', child: Text('متزوج')),
                  DropdownMenuItem(value: 'مطلق', child: Text('مطلق')),
                  DropdownMenuItem(value: 'أرمل', child: Text('أرمل')),
                ],
                onChanged: (value) {
                  if (value != null) {
                    cubit.maritalStatusController.text = value;
                  }
                },
                validator:
                    (value) =>
                        value == null
                            ? 'الرجاء اختيار الحالة الاجتماعية'
                            : null,
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: cubit.numberOfChildrenController,
                decoration: const InputDecoration(labelText: 'عدد الأولاد'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'يرجى إدخال عدد الأولاد';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: cubit.participationSkillsController,
                decoration: const InputDecoration(labelText: 'مهارات الموظف'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'يرجى إدخال المهارات';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: cubit.certificatesController,
                decoration: const InputDecoration(
                  labelText: 'الشهادات والدورات التدريبية',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'يرجى إدخال الشهادات والدورات التدريبية';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: cubit.additionalCommentsController,
                decoration: const InputDecoration(labelText: 'ملاحظات إضافية'),
                maxLines: 3,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'يرجى إدخال الملاحظات';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    cubit.submitForm(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'حفظ البيانات',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
