import 'package:flutter/material.dart';

Widget buildTextField(
  TextEditingController controller,
  String label, {
  TextInputType keyboardType = TextInputType.text,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: (value) => value?.isEmpty ?? true ? 'هذا الحقل مطلوب' : null,
    ),
  );
}

Widget buildDropdownField({
  required String label,
  required String value,
  required List<String> options,
  required ValueChanged<String?> onChanged,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: DropdownButtonFormField<String>(
      value: value,
      items:
          options
              .map(
                (option) =>
                    DropdownMenuItem(value: option, child: Text(option)),
              )
              .toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}

Widget buildDateField(String label, DateTime? date, VoidCallback onTap) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: ListTile(
      title: Text(
        date != null
            ? '$label: ${date.toLocal().toString().split(' ')[0]}'
            : 'اختر $label',
      ),
      trailing: const Icon(Icons.calendar_today),
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.grey),
      ),
    ),
  );
}
