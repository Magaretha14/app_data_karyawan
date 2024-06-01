import 'dart:async';

import 'package:app_data_karyawan/model/formdata_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataKaryawanController {
  final dataCollection = FirebaseFirestore.instance.collection('datakaryawan');

  final StreamController<List<DocumentSnapshot>> streamController =
      StreamController<List<DocumentSnapshot>>.broadcast();

  Stream<List<DocumentSnapshot>> get stream => streamController.stream;

  Future<void> addDataKaryawan(FormModel datakaryawan) async {
    final data = datakaryawan.toMap();

    final DocumentReference docRef = await dataCollection.add(data);

    final String docId = docRef.id;

    final FormModel datakaryawanModel = FormModel(
        id: docId,
        nama: datakaryawan.nama,
        notelp: datakaryawan.notelp,
        posisi: datakaryawan.posisi,
        status: datakaryawan.status,
        alamat: datakaryawan.alamat,
        gambar: datakaryawan.gambar);

    await docRef.update(datakaryawanModel.toMap());
  }

  Future getDataKaryawan() async {
    final data = await dataCollection.get();

    streamController.add(data.docs);

    return data.docs;
  }
}
