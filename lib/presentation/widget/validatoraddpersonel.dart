import 'package:flutter/material.dart';

Widget buildTextField(
  TextEditingController controller,
  String label, {
  TextInputType? keyboardType,
  String? Function(String?)? validator,
  void Function(String)? onChanged,
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(labelText: label),
    keyboardType: keyboardType,
    validator: validator,
    onChanged: onChanged,
  );
}

Widget buildDropdownField({
  required String label,
  required String value,
  required List<String> options,

  required Function(String?) onChanged,
}) {
  return DropdownButtonFormField<String>(
    value: value,
    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    ),
    items:
        options.map((option) {
          return DropdownMenuItem<String>(value: option, child: Text(option));
        }).toList(),
    onChanged: onChanged,
  );
}

String? validateBankAccount(String? value) {
  if (value == null || value.isEmpty) {
    return 'رقم الحساب البنكي مطلوب';
  }
  if (value.length < 10) {
    return 'رقم الحساب البنكي يجب أن يكون 10 أرقام على الأقل';
  }
  return null;
}

String? validateTaxes(String? value) {
  if (value == null || value.isEmpty) {
    return 'يرجى إدخال قيمة الضرائب والاستقطاعات';
  }
  if (double.tryParse(value) == null) {
    return 'يرجى إدخال رقم صحيح';
  }
  return null;
}
