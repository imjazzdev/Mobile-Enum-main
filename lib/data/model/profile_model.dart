class ProfileModel {
  final int userId;
  final String username;
  final String email;
  final EnumeratorModel enumerator;

  // Konstruktor dengan nilai default
  ProfileModel({
    this.userId = 0,
    this.username = '',
    this.email = '',
    EnumeratorModel? enumerator,
  }) : enumerator = enumerator ?? EnumeratorModel();

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      userId: json['user_id'] ?? 0,
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      enumerator: json['enumerator'] != null
          ? EnumeratorModel.fromJson(json['enumerator'])
          : EnumeratorModel(), // Jika tidak ada enumerator, gunakan enumerator default
    );
  }
  @override
  String toString() {
    return 'ProfileModel(userId: $userId, username: $username, email: $email, enumerator: $enumerator)';
  }
}

class EnumeratorModel {
  final int id;
  final String nama;
  final String jabatan;
  final String enumeratorLevel;
  final String namaOpd;

  // Konstruktor dengan nilai default
  EnumeratorModel({
    this.id = 0,
    this.nama = '',
    this.jabatan = '',
    this.enumeratorLevel = '',
    this.namaOpd = '',
  });

  factory EnumeratorModel.fromJson(Map<String, dynamic> json) {
    return EnumeratorModel(
      id: json['id'] ?? 0,
      nama: json['nama'] ?? '',
      jabatan: json['jabatan'] ?? '',
      enumeratorLevel: json['enumerator_level'] ?? '',
      namaOpd: json['nama_opd'] ?? '',
    );
  }
  @override
  String toString() {
    return 'EnumeratorModel(id: $id, nama: $nama, jabatan: $jabatan, enumeratorLevel: $enumeratorLevel, namaOpd: $namaOpd)';
  }
}
