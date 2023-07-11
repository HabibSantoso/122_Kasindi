import 'dart:convert';

class ModelTransaksi {
  String? id;
  String id_ref;
  String id_user;
  int nominal;
  DateTime tanggal;
  String keterangan;
  ModelTransaksi({
    this.id,
    required this.id_ref,
    required this.id_user,
    required this.nominal,
    required this.tanggal,
    required this.keterangan,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'id_ref': id_ref,
      'id_user': id_user,
      'nominal': nominal,
      'tanggal': tanggal.millisecondsSinceEpoch,
      'keterangan': keterangan,
    };
  }

  factory ModelTransaksi.fromMap(Map<String, dynamic> map) {
    return ModelTransaksi(
      id: map['id'],
      id_ref: map['id_ref'] ?? '',
      id_user: map['id_user'] ?? '',
      nominal: map['nominal']?.toInt() ?? 0,
      tanggal: DateTime.fromMillisecondsSinceEpoch(map['tanggal']),
      keterangan: map['keterangan'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelTransaksi.fromJson(String source) => ModelTransaksi.fromMap(json.decode(source));
}
