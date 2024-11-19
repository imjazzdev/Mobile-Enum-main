class DashboardIndikatorModel {
  final String namaSektor;
  final int indikatorId;
  final String namaIndikator;
  final List<VariabelId> variabelId;
  final String namaOpd;
  final String? logoOpd;
  final String createdAt;
  final String updatedAt;

  DashboardIndikatorModel({
    required this.namaSektor,
    required this.indikatorId,
    required this.namaIndikator,
    required this.variabelId,
    required this.namaOpd,
    this.logoOpd,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DashboardIndikatorModel.fromJson(Map<String, dynamic> json) {
    return DashboardIndikatorModel(
      namaSektor: json['nama_sektor'],
      indikatorId: json['indikator_id'],
      namaIndikator: json['nama_indikator'],
      variabelId: List<VariabelId>.from(
        json['variabel_id'].map((item) => VariabelId.fromJson(item)),
      ),
      namaOpd: json['nama_opd'],
      logoOpd: json['logo_opd'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama_sektor': namaSektor,
      'indikator_id': indikatorId,
      'nama_indikator': namaIndikator,
      'variabel_id': variabelId.map((item) => item.toJson()).toList(),
      'nama_opd': namaOpd,
      'logo_opd': logoOpd,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class VariabelId {
  final int id;
  final int indikatorId;
  final String nama;
  final int order;
  final String tipe;

  VariabelId({
    required this.id,
    required this.indikatorId,
    required this.nama,
    required this.order,
    required this.tipe,
  });

  factory VariabelId.fromJson(Map<String, dynamic> json) {
    return VariabelId(
      id: json['id'],
      indikatorId: json['indikator_id'],
      nama: json['nama'],
      order: json['order'],
      tipe: json['tipe'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'indikator_id': indikatorId,
      'nama': nama,
      'order': order,
      'tipe': tipe,
    };
  }
}
