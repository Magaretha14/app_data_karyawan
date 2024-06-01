import 'dart:convert';

class FormModel {
  String? id;
  final String nama;
  final String notelp;
  final String posisi;
  final String status;
  final String alamat;
  final String gambar;
  FormModel({
    this.id,
    required this.nama,
    required this.notelp,
    required this.posisi,
    required this.status,
    required this.alamat,
    required this.gambar,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'notelp': notelp,
      'posisi': posisi,
      'status': status,
      'alamat': alamat,
      'gambar': gambar,
    };
  }

  factory FormModel.fromMap(Map<String, dynamic> map) {
    return FormModel(
      id: map['id'],
      nama: map['nama'] ?? '',
      notelp: map['notelp'] ?? '',
      posisi: map['posisi'] ?? '',
      status: map['status'] ?? '',
      alamat: map['alamat'] ?? '',
      gambar: map['gambar'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FormModel.fromJson(String source) =>
      FormModel.fromMap(json.decode(source));
}
