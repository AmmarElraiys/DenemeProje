import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Buttonaddpersonel extends StatelessWidget {
  Function()? onpressed;
  String? text;
  Buttonaddpersonel({super.key, required this.onpressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onpressed, child: Text('$text'));
  }
}
