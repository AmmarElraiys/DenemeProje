import 'package:flutter/material.dart';

void navigateTo(BuildContext context, Widget screen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

Widget buildButton(BuildContext context, String title, Widget screen) {
  return ElevatedButton(
    onPressed: () => navigateTo(context, screen),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,

      padding: const EdgeInsets.symmetric(vertical: 14),
      minimumSize: const Size.fromHeight(50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    child: Text(
      title,

      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
