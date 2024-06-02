import 'dart:async';

import 'package:app_data_karyawan/model/formdata_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataPemilihController {
  final dataCollection = FirebaseFirestore.instance.collection('datapemilih');

  final StreamController<List<DocumentSnapshot>> streamController =
      StreamController<List<DocumentSnapshot>>.broadcast();

  Stream<List<DocumentSnapshot>> get stream => streamController.stream;

  Future<void> addDataPemilih(FormModel datapemilih) async {
    final data = datapemilih.toMap();

    final DocumentReference docRef = await dataCollection.add(data);

    final String docId = docRef.id;

    final FormModel datapemilihModel = FormModel(
        id: docId,
        nik: datapemilih.nik,
        nama: datapemilih.nama,
        notelp: datapemilih.notelp,
        jk: datapemilih.jk,
        tanggal: datapemilih.tanggal,
        alamat: datapemilih.alamat,
        gambar: datapemilih.gambar);

    await docRef.update(datapemilihModel.toMap());
  }

  Future getDataPemilih() async {
    final data = await dataCollection.get();

    streamController.add(data.docs);

    return data.docs;
  }
}
