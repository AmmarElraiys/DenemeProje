class AdministrativeInformationModel {
  final String? leaveDays;
  final String? weeklyHours;
  final String? performanceEvaluation;
  final String? branchName;
  final DateTime? lastPromotionDate;
  final String? workShift;
  final String? workLocation;

  AdministrativeInformationModel({
    this.leaveDays,
    this.weeklyHours,
    this.performanceEvaluation,
    this.branchName,
    this.lastPromotionDate,
    this.workShift,
    this.workLocation,
  });

  AdministrativeInformationModel copyWith({
    String? leaveDays,
    String? weeklyHours,
    String? performanceEvaluation,
    String? branchName,
    DateTime? lastPromotionDate,
    String? workShift,
    String? workLocation,
  }) {
    return AdministrativeInformationModel(
      leaveDays: leaveDays ?? this.leaveDays,
      weeklyHours: weeklyHours ?? this.weeklyHours,
      performanceEvaluation:
          performanceEvaluation ?? this.performanceEvaluation,
      branchName: branchName ?? this.branchName,
      lastPromotionDate: lastPromotionDate ?? this.lastPromotionDate,
      workShift: workShift ?? this.workShift,
      workLocation: workLocation ?? this.workLocation,
    );
  }
}
