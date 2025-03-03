import 'package:bloc/bloc.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:test/business_logic/employee_information_list/employee_information_list_state.dart';
import 'package:test/data/models/employee_information_list_model.dart';

class EmployeeInformationListCubit extends Cubit<EmployeeInformationListState> {
  final Box<EmployeeInformationListModel> employeeBox;

  EmployeeInformationListCubit(this.employeeBox) : super(EmployeeInitial());

  void loadEmployees() {
    final employees = employeeBox.values.toList();
    emit(EmployeeLoaded(employees));
  }

  void addEmployee(EmployeeInformationListModel employee) {
    employeeBox.put(employee.id, employee);
    loadEmployees();
  }

  void updateEmployee(EmployeeInformationListModel employee) {
    employeeBox.put(employee.id, employee);
    loadEmployees();
  }

  void deleteEmployee(int id) {
    employeeBox.delete(id);
    loadEmployees();
  }
}
