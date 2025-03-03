// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BasicInfoAdapter extends TypeAdapter<BasicInfo> {
  @override
  final int typeId = 0;

  @override
  BasicInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BasicInfo(
      fullName: fields[0] as String,
      idNumber: fields[1] as String,
      birthDate: fields[2] as String,
      gender: fields[3] as String,
      address: fields[4] as String,
      phone: fields[5] as String,
      email: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BasicInfo obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.fullName)
      ..writeByte(1)
      ..write(obj.idNumber)
      ..writeByte(2)
      ..write(obj.birthDate)
      ..writeByte(3)
      ..write(obj.gender)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.phone)
      ..writeByte(6)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BasicInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class JobInfoAdapter extends TypeAdapter<JobInfo> {
  @override
  final int typeId = 1;

  @override
  JobInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JobInfo(
      jobTitle: fields[0] as String,
      employeeNumber: fields[1] as String,
      hireDate: fields[2] as String,
      employmentType: fields[3] as String,
      department: fields[4] as String,
      supervisor: fields[5] as String,
      seniority: fields[6] as String,
      baseSalary: fields[7] as double,
      bonuses: fields[8] as double,
      employmentStatus: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, JobInfo obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.jobTitle)
      ..writeByte(1)
      ..write(obj.employeeNumber)
      ..writeByte(2)
      ..write(obj.hireDate)
      ..writeByte(3)
      ..write(obj.employmentType)
      ..writeByte(4)
      ..write(obj.department)
      ..writeByte(5)
      ..write(obj.supervisor)
      ..writeByte(6)
      ..write(obj.seniority)
      ..writeByte(7)
      ..write(obj.baseSalary)
      ..writeByte(8)
      ..write(obj.bonuses)
      ..writeByte(9)
      ..write(obj.employmentStatus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AdminInfoAdapter extends TypeAdapter<AdminInfo> {
  @override
  final int typeId = 2;

  @override
  AdminInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AdminInfo(
      leaveDays: fields[0] as int,
      weeklyHours: fields[1] as int,
      workShift: fields[2] as String,
      workLocation: fields[3] as String,
      lastPromotion: fields[4] as String,
      performanceReview: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AdminInfo obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.leaveDays)
      ..writeByte(1)
      ..write(obj.weeklyHours)
      ..writeByte(2)
      ..write(obj.workShift)
      ..writeByte(3)
      ..write(obj.workLocation)
      ..writeByte(4)
      ..write(obj.lastPromotion)
      ..writeByte(5)
      ..write(obj.performanceReview);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdminInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FinancialInfoAdapter extends TypeAdapter<FinancialInfo> {
  @override
  final int typeId = 3;

  @override
  FinancialInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FinancialInfo(
      bankAccount: fields[0] as String,
      paymentMethod: fields[1] as String,
      taxes: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, FinancialInfo obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.bankAccount)
      ..writeByte(1)
      ..write(obj.paymentMethod)
      ..writeByte(2)
      ..write(obj.taxes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FinancialInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OptionalInfoAdapter extends TypeAdapter<OptionalInfo> {
  @override
  final int typeId = 4;

  @override
  OptionalInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OptionalInfo(
      profilePicture: fields[0] as String,
      maritalStatus: fields[1] as String,
      childrenCount: fields[2] as int,
      skills: fields[3] as String,
      certificates: fields[4] as String,
      additionalNotes: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, OptionalInfo obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.profilePicture)
      ..writeByte(1)
      ..write(obj.maritalStatus)
      ..writeByte(2)
      ..write(obj.childrenCount)
      ..writeByte(3)
      ..write(obj.skills)
      ..writeByte(4)
      ..write(obj.certificates)
      ..writeByte(5)
      ..write(obj.additionalNotes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OptionalInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EmployeeAdapter extends TypeAdapter<Employee> {
  @override
  final int typeId = 5;

  @override
  Employee read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Employee(
      id: fields[0] as int,
      basicInfo: fields[1] as BasicInfo,
      jobInfo: fields[2] as JobInfo,
      adminInfo: fields[3] as AdminInfo,
      financialInfo: fields[4] as FinancialInfo,
      optionalInfo: fields[5] as OptionalInfo,
    );
  }

  @override
  void write(BinaryWriter writer, Employee obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.basicInfo)
      ..writeByte(2)
      ..write(obj.jobInfo)
      ..writeByte(3)
      ..write(obj.adminInfo)
      ..writeByte(4)
      ..write(obj.financialInfo)
      ..writeByte(5)
      ..write(obj.optionalInfo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
