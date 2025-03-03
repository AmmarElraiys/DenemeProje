import 'package:hive/hive.dart';

part 'employee_data.g.dart';

@HiveType(typeId: 0)
class BasicInfo {
  @HiveField(0)
  String fullName;
  @HiveField(1)
  String idNumber;
  @HiveField(2)
  String birthDate;
  @HiveField(3)
  String gender;
  @HiveField(4)
  String address;
  @HiveField(5)
  String phone;
  @HiveField(6)
  String email;

  BasicInfo({
    required this.fullName,
    required this.idNumber,
    required this.birthDate,
    required this.gender,
    required this.address,
    required this.phone,
    required this.email,
  });
}

@HiveType(typeId: 1)
class JobInfo {
  @HiveField(0)
  String jobTitle;
  @HiveField(1)
  String employeeNumber;
  @HiveField(2)
  String hireDate;
  @HiveField(3)
  String employmentType;
  @HiveField(4)
  String department;
  @HiveField(5)
  String supervisor;
  @HiveField(6)
  String seniority;
  @HiveField(7)
  double baseSalary;
  @HiveField(8)
  double bonuses;
  @HiveField(9)
  String employmentStatus;

  JobInfo({
    required this.jobTitle,
    required this.employeeNumber,
    required this.hireDate,
    required this.employmentType,
    required this.department,
    required this.supervisor,
    required this.seniority,
    required this.baseSalary,
    required this.bonuses,
    required this.employmentStatus,
  });
}

@HiveType(typeId: 2)
class AdminInfo {
  @HiveField(0)
  int leaveDays;
  @HiveField(1)
  int weeklyHours;
  @HiveField(2)
  String workShift;
  @HiveField(3)
  String workLocation;
  @HiveField(4)
  String lastPromotion;
  @HiveField(5)
  String performanceReview;

  AdminInfo({
    required this.leaveDays,
    required this.weeklyHours,
    required this.workShift,
    required this.workLocation,
    required this.lastPromotion,
    required this.performanceReview,
  });
}

@HiveType(typeId: 3)
class FinancialInfo {
  @HiveField(0)
  String bankAccount;
  @HiveField(1)
  String paymentMethod;
  @HiveField(2)
  double taxes;

  FinancialInfo({
    required this.bankAccount,
    required this.paymentMethod,
    required this.taxes,
  });
}

@HiveType(typeId: 4)
class OptionalInfo {
  @HiveField(0)
  String profilePicture;
  @HiveField(1)
  String maritalStatus;
  @HiveField(2)
  int childrenCount;
  @HiveField(3)
  String skills;
  @HiveField(4)
  String certificates;
  @HiveField(5)
  String additionalNotes;

  OptionalInfo({
    required this.profilePicture,
    required this.maritalStatus,
    required this.childrenCount,
    required this.skills,
    required this.certificates,
    required this.additionalNotes,
  });
}

@HiveType(typeId: 5)
class Employee {
  @HiveField(0)
  int id;
  @HiveField(1)
  BasicInfo basicInfo;
  @HiveField(2)
  JobInfo jobInfo;
  @HiveField(3)
  AdminInfo adminInfo;
  @HiveField(4)
  FinancialInfo financialInfo;
  @HiveField(5)
  OptionalInfo optionalInfo;

  Employee({
    required this.id,
    required this.basicInfo,
    required this.jobInfo,
    required this.adminInfo,
    required this.financialInfo,
    required this.optionalInfo,
  });
}
