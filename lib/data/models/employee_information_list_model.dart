import 'package:hive_ce_flutter/adapters.dart';

@HiveType(typeId: 0)
class EmployeeInformationListModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String fullName;

  @HiveField(2)
  final String idNumber;

  @HiveField(3)
  final DateTime birthDate;

  @HiveField(4)
  final String gender;

  @HiveField(5)
  final String address;

  @HiveField(6)
  final String phoneNumber;

  @HiveField(7)
  final String email;

  @HiveField(8)
  final String jobTitle;

  @HiveField(9)
  final String employmentType;

  @HiveField(10)
  final String department;

  @HiveField(11)
  final String supervisor;

  @HiveField(12)
  final String seniorityLevel;

  @HiveField(13)
  final double salary;

  @HiveField(14)
  final double bonuses;

  @HiveField(15)
  final String employmentStatus;

  @HiveField(16)
  final int remainingLeaveDays;

  @HiveField(17)
  final int weeklyWorkHours;

  @HiveField(18)
  final String workShift;

  @HiveField(19)
  final String workLocation;

  @HiveField(20)
  final DateTime lastPromotionDate;

  @HiveField(21)
  final String lastPerformanceReview;

  @HiveField(22)
  final String bankAccountNumber;

  @HiveField(23)
  final String paymentMethod;

  @HiveField(24)
  final String taxDeductions;

  @HiveField(25)
  final String maritalStatus;

  @HiveField(26)
  final int childrenCount;

  @HiveField(27)
  final String skills;

  @HiveField(28)
  final String certificates;

  @HiveField(29)
  final String notes;

  EmployeeInformationListModel({
    required this.id,
    required this.fullName,
    required this.idNumber,
    required this.birthDate,
    required this.gender,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.jobTitle,
    required this.employmentType,
    required this.department,
    required this.supervisor,
    required this.seniorityLevel,
    required this.salary,
    required this.bonuses,
    required this.employmentStatus,
    required this.remainingLeaveDays,
    required this.weeklyWorkHours,
    required this.workShift,
    required this.workLocation,
    required this.lastPromotionDate,
    required this.lastPerformanceReview,
    required this.bankAccountNumber,
    required this.paymentMethod,
    required this.taxDeductions,
    required this.maritalStatus,
    required this.childrenCount,
    required this.skills,
    required this.certificates,
    required this.notes,
  });
}
