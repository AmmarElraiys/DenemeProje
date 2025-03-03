class WorkInformationModel {
  final String? jobTitle;
  final String? employeeNumber;
  final DateTime? hireDate;
  final String? employmentType;
  final String? department;
  final String? directSupervisor;
  final String? seniorityLevel;
  final double? basicSalary;
  final double? incentives;
  final String? employmentStatus;

  WorkInformationModel({
    this.jobTitle,
    this.employeeNumber,
    this.hireDate,
    this.employmentType,
    this.department,
    this.directSupervisor,
    this.seniorityLevel,
    this.basicSalary,
    this.incentives,
    this.employmentStatus,
  });
  WorkInformationModel copyWith({
    String? jobTitle,
    String? employeeNumber,
    DateTime? hireDate,
    String? employmentType,
    String? department,
    String? directSupervisor,
    String? seniorityLevel,
    double? basicSalary,
    double? incentives,
    String? employmentStatus,
  }) {
    return WorkInformationModel(
      jobTitle: jobTitle ?? this.jobTitle,
      employeeNumber: employeeNumber ?? this.employeeNumber,
      hireDate: hireDate ?? this.hireDate,
      employmentType: employmentType ?? this.employmentType,
      department: department ?? this.department,
      directSupervisor: directSupervisor ?? this.directSupervisor,
      seniorityLevel: seniorityLevel ?? this.seniorityLevel,
      basicSalary: basicSalary ?? this.basicSalary,
      incentives: incentives ?? this.incentives,
      employmentStatus: employmentStatus ?? this.employmentStatus,
    );
  }
}
