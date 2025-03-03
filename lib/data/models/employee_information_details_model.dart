class EmployeeInformationDetailsModel {
  final String? personalPhoto; // Personal photo (URL or file path)
  final String?
  maritalStatus; // Marital status (married, single, divorced, widowed)
  final int? numberOfChildren; // Number of children
  final List<String>? participationSkills; // Participation skills
  final List<String>? certificates; // Certificates and amended forms
  final String? additionalComments; // Additional comments

  EmployeeInformationDetailsModel({
    this.personalPhoto,
    this.maritalStatus,
    this.numberOfChildren,
    this.participationSkills,
    this.certificates,
    this.additionalComments,
  });

  EmployeeInformationDetailsModel copyWith({
    String? personalPhoto,
    String? maritalStatus,
    int? numberOfChildren,
    List<String>? participationSkills,
    List<String>? certificates,
    String? additionalComments,
  }) {
    return EmployeeInformationDetailsModel(
      personalPhoto: personalPhoto ?? this.personalPhoto,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      numberOfChildren: numberOfChildren ?? this.numberOfChildren,
      participationSkills: participationSkills ?? this.participationSkills,
      certificates: certificates ?? this.certificates,
      additionalComments: additionalComments ?? this.additionalComments,
    );
  }
}
