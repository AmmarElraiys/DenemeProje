import 'package:test/data/models/employee_information_list_model.dart';

abstract class EmployeeInformationListState {}

class EmployeeInitial extends EmployeeInformationListState {}

class EmployeeLoaded extends EmployeeInformationListState {
  final List<EmployeeInformationListModel> employees;
  EmployeeLoaded(this.employees);
}
