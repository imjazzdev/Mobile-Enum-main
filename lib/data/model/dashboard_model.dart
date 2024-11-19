class StatusIndikatorModel {
  // final String id;
  final String status;
  final int? value;

  StatusIndikatorModel({
    // required this.id,
    required this.status,
    this.value,
  });

  factory StatusIndikatorModel.fromJson(Map<String, dynamic> json) {
    return StatusIndikatorModel(
      // id: json['id']?.toString() ?? '',
      status: json['status'] ?? 'Unknown',
      value: json['value'] ?? 0,
    );
  }
}
