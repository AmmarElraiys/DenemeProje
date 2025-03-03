import 'package:flutter/material.dart';

class Textformfieldaddpersonel extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hint;
  final TextInputType keyboardType;
  final String? Function(String?) validator;

  const Textformfieldaddpersonel({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.hint,
    required this.keyboardType,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(labelText: labelText, hintText: hint),
      validator: validator,
    );
  }
}
