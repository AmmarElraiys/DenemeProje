import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/business_logic/work_information/work_information_cubit.dart';
import 'package:test/business_logic/work_information/work_information_state.dart';
import 'package:test/presentation/widget/work_information_custom_widgets.dart';

class WorkInformationWidgets extends StatelessWidget {
  const WorkInformationWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkInformationCubit, WorkInformationState>(
      builder: (context, state) {
        final cubit = context.read<WorkInformationCubit>();

        return Form(
          key: state.formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: cubit.jobTitleController,
                label: 'المسمى الوظيفي',
              ),
              CustomTextField(
                controller: cubit.employeeNumberController,
                label: 'رقم الموظف',
              ),
              CustomDateField(
                label: 'تاريخ التوظيف',
                date:
                    cubit.hireDateController.text.isNotEmpty
                        ? DateTime.tryParse(cubit.hireDateController.text)
                        : null,
                onTap: () => cubit.selectHireDate(context),
              ),
              CustomDropdownField(
                label: 'نوع التوظيف',
                value: cubit.employmentTypeController.text,
                options: ['دوام كامل', 'دوام جزئي', 'عقد مؤقت'],
                onChanged:
                    (val) => (() => cubit.employmentTypeController.text = val!),
              ),
              CustomTextField(
                controller: cubit.departmentController,
                label: 'القسم أو الإدارة',
              ),
              CustomTextField(
                controller: cubit.directSupervisorController,
                label: 'المشرف المباشر',
              ),
              CustomDropdownField(
                label: 'مستوى الأقدمية',
                value: cubit.seniorityLevelController.text,
                options: ['متدرب', 'موظف عادي', 'مدير', 'مدير تنفيذي'],
                onChanged:
                    (val) => (() => cubit.seniorityLevelController.text = val!),
              ),
              CustomTextField(
                controller: cubit.basicSalaryController,
                label: 'الراتب الأساسي',
                keyboardType: TextInputType.number,
              ),
              CustomTextField(
                controller: cubit.incentivesController,
                label: 'الحوافز والمكافآت',
                keyboardType: TextInputType.number,
              ),
              CustomDropdownField(
                label: 'حالة التوظيف',
                value: cubit.employmentStatusController.text,
                options: ['نشط', 'إجازة', 'مفصول', 'متقاعد'],
                onChanged:
                    (val) =>
                        (val) => (
                          () => cubit.employmentStatusController.text = val!,
                        ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => cubit.submitForm(context),
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
