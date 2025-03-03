import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Cubit to manage form state
class HomeCubit extends Cubit<Map<String, dynamic>> {
  HomeCubit() : super({});

  void updateField(String key, dynamic value) {
    emit({...state, key: value});
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        appBar: AppBar(title: Text("Home Page")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildTextField(context, "fullName", "الاسم الكامل"),
                buildTextField(context, "idNumber", "رقم الهوية أو جواز السفر"),
                buildTextField(context, "birthDate", "تاريخ الميلاد"),
                buildDropdownField(context, "gender", "الجنس", ["ذكر", "أنثى"]),
                buildTextField(context, "address", "العنوان"),
                buildTextField(context, "phone", "رقم الهاتف"),
                buildTextField(context, "email", "البريد الإلكتروني"),
                buildTextField(context, "jobTitle", "المسمى الوظيفي"),
                buildTextField(context, "employeeNumber", "رقم الموظف"),
                buildTextField(context, "hireDate", "تاريخ التوظيف"),
                buildDropdownField(context, "employmentType", "نوع التوظيف", [
                  "دوام كامل",
                  "جزئي",
                  "عقد مؤقت",
                ]),
                buildTextField(context, "department", "القسم أو الإدارة"),
                buildTextField(context, "supervisor", "المشرف المباشر"),
                buildDropdownField(context, "seniority", "مستوى الأقدمية", [
                  "متدرب",
                  "موظف عادي",
                  "مدير",
                  "مدير تنفيذي",
                ]),
                buildTextField(context, "baseSalary", "الراتب الأساسي"),
                buildTextField(context, "bonuses", "الحوافز والمكافآت"),
                buildDropdownField(
                  context,
                  "employmentStatus",
                  "حالة التوظيف",
                  ["نشط", "إجازة", "مفصول", "متقاعد"],
                ),
                buildTextField(
                  context,
                  "leaveDays",
                  "عدد أيام الإجازة المتبقية",
                ),
                buildTextField(
                  context,
                  "weeklyHours",
                  "عدد ساعات العمل الأسبوعية",
                ),
                buildDropdownField(context, "workShift", "دوام العمل", [
                  "صباحي",
                  "مسائي",
                  "عن بعد",
                ]),
                buildDropdownField(context, "workLocation", "مكان العمل", [
                  "المكتب الرئيسي",
                  "فرع معين",
                  "عن بعد",
                ]),
                buildTextField(context, "lastPromotion", "تاريخ آخر ترقية"),
                buildTextField(
                  context,
                  "performanceReview",
                  "تقييم الأداء الأخير",
                ),
                buildTextField(context, "bankAccount", "رقم الحساب البنكي"),
                buildDropdownField(context, "paymentMethod", "طريقة الدفع", [
                  "تحويل بنكي",
                  "نقدًا",
                ]),
                buildTextField(context, "taxes", "الضرائب والاستقطاعات"),
                buildDropdownField(
                  context,
                  "maritalStatus",
                  "الحالة الاجتماعية",
                  ["متزوج", "أعزب", "مطلق", "أرمل"],
                ),
                buildTextField(context, "childrenCount", "عدد الأولاد"),
                buildTextField(context, "skills", "مهارات الموظف"),
                buildTextField(
                  context,
                  "certificates",
                  "الشهادات والدورات التدريبية",
                ),
                buildTextField(context, "additionalNotes", "ملاحظات إضافية"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(BuildContext context, String key, String label) {
    return BlocBuilder<HomeCubit, Map<String, dynamic>>(
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(labelText: label),
          onChanged:
              (value) => context.read<HomeCubit>().updateField(key, value),
        );
      },
    );
  }

  Widget buildDropdownField(
    BuildContext context,
    String key,
    String label,
    List<String> options,
  ) {
    return BlocBuilder<HomeCubit, Map<String, dynamic>>(
      builder: (context, state) {
        return DropdownButtonFormField<String>(
          decoration: InputDecoration(labelText: label),
          value: state[key],
          items:
              options.map((option) {
                return DropdownMenuItem(value: option, child: Text(option));
              }).toList(),
          onChanged:
              (value) => context.read<HomeCubit>().updateField(key, value),
        );
      },
    );
  }
}
