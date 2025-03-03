class BasicDataInformationModel {
  final String? name;
  final String? idpassport;
  final DateTime? dob;
  final String? gender;
  final String? city;
  final String? country;
  final String? street;
  final String? phone;
  final String? email;

  BasicDataInformationModel({
    this.name,
    this.idpassport,
    this.dob,
    this.gender,
    this.city,
    this.country,
    this.street,
    this.phone,
    this.email,
  });

  BasicDataInformationModel copyWith({
    final String? name,
    final String? idpassport,
    final DateTime? dob,
    final String? gender,
    final String? city,
    final String? country,
    final String? street,
    final String? phone,
    final String? email,
  }) {
    return BasicDataInformationModel(
      name: name ?? this.name,
      idpassport: idpassport ?? this.idpassport,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      city: city ?? this.city,
      country: country ?? this.country,
      street: street ?? this.street,
      phone: phone ?? this.phone,
      email: email ?? this.email,
    );
  }
}
