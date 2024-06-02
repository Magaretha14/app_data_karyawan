import 'dart:convert';

class FormModel {
  String? id;
  final String nik;
  final String nama;
  final String notelp;
  final String jk;
  final String tanggal;
  final String alamat;
  final String gambar;
  FormModel({
    this.id,
    required this.nik,
    required this.nama,
    required this.notelp,
    required this.jk,
    required this.tanggal,
    required this.alamat,
    required this.gambar,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nik': nik,
      'nama': nama,
      'notelp': notelp,
      'jk': jk,
      'tanggal': tanggal,
      'alamat': alamat,
      'gambar': gambar,
    };
  }

  factory FormModel.fromMap(Map<String, dynamic> map) {
    return FormModel(
      id: map['id'],
      nik: map['nik'] ?? '',
      nama: map['nama'] ?? '',
      notelp: map['notelp'] ?? '',
      jk: map['jk'] ?? '',
      tanggal: map['tanggal'] ?? '',
      alamat: map['alamat'] ?? '',
      gambar: map['gambar'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FormModel.fromJson(String source) =>
      FormModel.fromMap(json.decode(source));
}
