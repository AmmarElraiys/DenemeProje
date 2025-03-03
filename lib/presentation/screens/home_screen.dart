import 'package:flutter/material.dart';
import 'package:test/presentation/screens/basic_data_information_screen.dart';
import 'package:test/presentation/screens/administrative_information_screen.dart';
import 'package:test/presentation/screens/employee_information_details_screen.dart';
import 'package:test/presentation/screens/employee_information_list_screen.dart';
import 'package:test/presentation/screens/work_information_screen.dart';
import 'package:test/presentation/screens/financial_information_screen.dart';
import 'package:test/presentation/widget/home/buttonhome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الشاشة الرئيسية'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton(
              context,
              'البيانات الأساسية',
              const BasicDataInformationScreen(),
            ),
            const SizedBox(height: 12),
            buildButton(
              context,
              'البيانات الوظيفية',

              const WorkInformationScreen(),
            ),
            const SizedBox(height: 12),
            buildButton(
              context,
              'البيانات الإدارية',
              AdministrativeInformationScreen(),
            ),
            const SizedBox(height: 12),
            buildButton(
              context,
              'البيانات المالية',
              const FinancialInformationScreen(),
            ),
            const SizedBox(height: 12),
            buildButton(
              context,
              'البيانات الاختيارية',
              const EmployeeInformationDetailsScreen(),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed:
                  () => navigateTo(context, EmployeeInformationListScreen()),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 40,
                ),
              ),
              child: const Text(
                'واجهة استعراض بيانات الموظف',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
