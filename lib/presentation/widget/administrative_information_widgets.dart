import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/business_logic/administrative_information/administrative_information_cubit.dart';
import 'package:test/business_logic/administrative_information/administrative_information_state.dart';
import 'package:test/presentation/widget/employee_information_details_widget_textfield.dart';

class AdministrativeInformationWidgets extends StatefulWidget {
  const AdministrativeInformationWidgets({super.key});

  @override
  State<AdministrativeInformationWidgets> createState() =>
      _AdministrativeInformationWidgetsState();
}

class _AdministrativeInformationWidgetsState
    extends State<AdministrativeInformationWidgets> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      AdministrativeInformationCubit,
      AdministrativeInformationState
    >(
      builder: (context, state) {
        final cubit = context.read<AdministrativeInformationCubit>();
        return Form(
          key: state.formKey,
          child: Column(
            children: [
              buildTextField(
                cubit.leaveDaysController,
                'عدد أيام الإجازة المتبقية',
                keyboardType: TextInputType.number,
              ),
              buildTextField(
                cubit.weeklyHoursController,
                'عدد ساعات العمل الأسبوعية',
                keyboardType: TextInputType.number,
              ),
              buildDropdownField(
                label: 'دوام العمل',
                value: cubit.workShiftController.text,
                options: ['صباحي', 'مسائي', 'عن بعد'],
                onChanged:
                    (val) =>
                        setState(() => cubit.workShiftController.text = val!),
              ),
              buildDropdownField(
                label: 'مكان العمل',
                value: cubit.workLocationController.text,
                options: ['المكتب الرئيسي', 'فرع معين', 'عن بعد'],
                onChanged:
                    (val) => setState(
                      () => cubit.workLocationController.text = val!,
                    ),
              ),

              // Eğer seçili değer 'فرع معين' ise şube adı girme alanını göster
              if (cubit.workLocationController.text == 'فرع معين')
                buildTextField(
                  cubit.branchNameController,
                  'اسم الفرع', // Şube Adı
                  keyboardType: TextInputType.text,
                ),

              buildDateField(
                'تاريخ آخر ترقية',
                cubit.lastPromotionDateController.text,
                () => context.read<AdministrativeInformationCubit>().selectDate(
                  context,
                ),
              ),
              buildTextField(
                cubit.performanceEvaluationController,
                'تقييم الأداء الأخير',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                      () => context
                          .read<AdministrativeInformationCubit>()
                          .submitForm(context),
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

Widget buildDropdownField({
  required String label,
  required String? value, // Allow null value
  required List<String> options,
  required ValueChanged<String?> onChanged,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: DropdownButtonFormField<String>(
      value: options.contains(value) ? value : null, // Ensure valid value
      items:
          options.toSet().map((option) {
            // Remove duplicates
            return DropdownMenuItem(value: option, child: Text(option));
          }).toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}

Widget buildDateField(String label, String? dateString, VoidCallback onTap) {
  DateTime? parsedDate;
  if (dateString != null && dateString.isNotEmpty) {
    parsedDate = DateTime.tryParse(dateString);
  }

  return GestureDetector(
    onTap: onTap,
    child: InputDecorator(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        parsedDate != null
            ? parsedDate.toLocal().toString().split(' ')[0]
            : 'حدد التاريخ',
      ),
    ),
  );
}
