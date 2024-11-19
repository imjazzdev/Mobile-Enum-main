class Desa {
  final String id;
  final String nama;

  Desa({required this.id, required this.nama});
}

class Kecamatan {
  final String id;
  final String nama;
  final List<Desa> desas;

  Kecamatan({required this.id, required this.nama, required this.desas});
}

class Kabupaten {
  final String id;
  final String nama;
  final List<Kecamatan> kecamatans;

  Kabupaten({required this.id, required this.nama, required this.kecamatans});
}

final List<Kabupaten> kabupatens = [
  Kabupaten(id: '1', nama: 'Kota Gorontalo', kecamatans: [
    Kecamatan(id: '1', nama: 'Kota Utara', desas: [
      Desa(id: '1', nama: 'desa utara utara'),
      Desa(id: '2', nama: 'desa utara selatan'),
      Desa(id: '3', nama: 'desa utara timur'),
      Desa(id: '4', nama: 'desa utara barat')
    ]),
    Kecamatan(id: '2', nama: 'Kota Selatan', desas: [
      Desa(id: '1', nama: 'desa selatan utara'),
      Desa(id: '2', nama: 'desa selatan selatan'),
      Desa(id: '3', nama: 'desa selatan timur'),
      Desa(id: '4', nama: 'desa selatan barat'),
    ]),
    Kecamatan(id: '3', nama: 'Kota timur', desas: [
      Desa(id: '1', nama: 'desa timur utara'),
      Desa(id: '2', nama: 'desa timur selatan'),
      Desa(id: '3', nama: 'desa timur timur'),
      Desa(id: '4', nama: 'desa timur barat'),
    ]),
    Kecamatan(id: '4', nama: 'Kota barat', desas: [
      Desa(id: '1', nama: 'desa barat utara'),
      Desa(id: '2', nama: 'desa barat selatan'),
      Desa(id: '3', nama: 'desa barat timur'),
      Desa(id: '4', nama: 'desa barat barat'),
    ]),
  ]),
  Kabupaten(id: '20', nama: 'Kabupaten Gorontalo', kecamatans: [
    Kecamatan(id: '101', nama: 'Kota Utara', desas: [
      Desa(id: '1', nama: 'desa utara utara'),
      Desa(id: '2', nama: 'desa utara selatan'),
      Desa(id: '3', nama: 'desa utara timur'),
      Desa(id: '4', nama: 'desa utara barat')
    ]),
    Kecamatan(id: '2.2', nama: 'Kota Selatan', desas: [
      Desa(id: '1', nama: 'desa selatan utara'),
      Desa(id: '2', nama: 'desa selatan selatan'),
      Desa(id: '3', nama: 'desa selatan timur'),
      Desa(id: '4', nama: 'desa selatan barat'),
    ]),
    Kecamatan(id: '3', nama: 'Kota timur', desas: [
      Desa(id: '1', nama: 'desa timur utara'),
      Desa(id: '2', nama: 'desa timur selatan'),
      Desa(id: '3', nama: 'desa timur timur'),
      Desa(id: '4', nama: 'desa timur barat'),
    ]),
    Kecamatan(id: '4', nama: 'Kota barat', desas: [
      Desa(id: '1', nama: 'desa barat utara'),
      Desa(id: '2', nama: 'desa barat selatan'),
      Desa(id: '3', nama: 'desa barat timur'),
      Desa(id: '4', nama: 'desa barat barat'),
    ]),
  ]),
  Kabupaten(id: '3', nama: 'Boalemo', kecamatans: [
    Kecamatan(id: '1', nama: 'Kota Utara', desas: [
      Desa(id: '1', nama: 'desa utara utara'),
      Desa(id: '2', nama: 'desa utara selatan'),
      Desa(id: '3', nama: 'desa utara timur'),
      Desa(id: '4', nama: 'desa utara barat')
    ]),
    Kecamatan(id: '2', nama: 'Kota Selatan', desas: [
      Desa(id: '1', nama: 'desa selatan utara'),
      Desa(id: '2', nama: 'desa selatan selatan'),
      Desa(id: '3', nama: 'desa selatan timur'),
      Desa(id: '4', nama: 'desa selatan barat'),
    ]),
    Kecamatan(id: '3', nama: 'Kota timur', desas: [
      Desa(id: '1', nama: 'desa timur utara'),
      Desa(id: '2', nama: 'desa timur selatan'),
      Desa(id: '3', nama: 'desa timur timur'),
      Desa(id: '4', nama: 'desa timur barat'),
    ]),
    Kecamatan(id: '4', nama: 'Kota barat', desas: [
      Desa(id: '1', nama: 'desa barat utara'),
      Desa(id: '2', nama: 'desa barat selatan'),
      Desa(id: '3', nama: 'desa barat timur'),
      Desa(id: '4', nama: 'desa barat barat'),
    ]),
  ]),
  Kabupaten(id: '4', nama: 'Kabupaten Gorontalo', kecamatans: [
    Kecamatan(id: '1', nama: 'Kota Utara', desas: [
      Desa(id: '1', nama: 'desa utara utara'),
      Desa(id: '2', nama: 'desa utara selatan'),
      Desa(id: '3', nama: 'desa utara timur'),
      Desa(id: '4', nama: 'desa utara barat')
    ]),
    Kecamatan(id: '2', nama: 'Kota Selatan', desas: [
      Desa(id: '1', nama: 'desa selatan utara'),
      Desa(id: '2', nama: 'desa selatan selatan'),
      Desa(id: '3', nama: 'desa selatan timur'),
      Desa(id: '4', nama: 'desa selatan barat'),
    ]),
    Kecamatan(id: '3', nama: 'Kota timur', desas: [
      Desa(id: '1', nama: 'desa timur utara'),
      Desa(id: '2', nama: 'desa timur selatan'),
      Desa(id: '3', nama: 'desa timur timur'),
      Desa(id: '4', nama: 'desa timur barat'),
    ]),
    Kecamatan(id: '4', nama: 'Kota barat', desas: [
      Desa(id: '1', nama: 'desa barat utara'),
      Desa(id: '2', nama: 'desa barat selatan'),
      Desa(id: '3', nama: 'desa barat timur'),
      Desa(id: '4', nama: 'desa barat barat'),
    ]),
  ]),
];
