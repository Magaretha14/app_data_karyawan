import 'dart:io';

import 'package:app_data_karyawan/controller/formdata_controller.dart';
import 'package:app_data_karyawan/model/formdata_model.dart';
import 'package:app_data_karyawan/view/maps_page.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Formpage extends StatefulWidget {
  const Formpage({super.key});

  @override
  State<Formpage> createState() => _FormpageState();
}

class _FormpageState extends State<Formpage> {
  final _formKey = GlobalKey<FormState>();

  String? nik;
  String? nama;
  String? notelp;
  String? jk;
  String? tanggal;
  String? alamat;
  String? gambar;

  var dpController = DataPemilihController();

  List<String> pilihanStatus = ['Laki - laki', 'Perempuan'];

  List<DropdownMenuItem> generateStatus(List<String> pilStatus) {
    List<DropdownMenuItem> itemsStatus = [];
    for (var itemStatus in pilStatus) {
      itemsStatus.add(DropdownMenuItem(
        child: Text(itemStatus),
        value: itemStatus,
      ));
    }
    return itemsStatus;
  }

  final TextEditingController datetimeinput = TextEditingController();
  final TextEditingController _controllerNik = TextEditingController();
  final TextEditingController _controllerNama = TextEditingController();
  final TextEditingController _controllerNoTelp = TextEditingController();
  final TextEditingController _controllerAlamat = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        title: const Text("Pengisian Data Pemilih"),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Nik :',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _controllerNik,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "Masukkan nik pemilih",
                    prefixIcon: const Icon(Icons.card_membership),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) {
                    nik = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'nik tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Nama :',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _controllerNama,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "Masukkan nama pemilih",
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) {
                    nama = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'No. HP :',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _controllerNoTelp,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "Masukkan nomor HP pemilih",
                    prefixIcon: const Icon(Icons.smartphone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) {
                    notelp = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'No. HP tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Jenis Kelamin :',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 10),
                  margin: const EdgeInsets.only(right: 130),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      const Icon(Icons.group_rounded),
                      DropdownButton(
                        borderRadius: BorderRadius.circular(10),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        dropdownColor: const Color.fromARGB(255, 223, 121, 238),
                        hint: const Text("Pilih Jenis Kelamin"),
                        value: jk,
                        items: generateStatus(pilihanStatus),
                        onChanged: (itemStatus) {
                          setState(() {
                            jk = itemStatus;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Tanggal :',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                TextFormField(
                  controller: datetimeinput,
                  decoration: InputDecoration(
                    hintText: "Pilih Tanggal",
                    suffixIcon: const Icon(Icons.date_range_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  readOnly: true,
                  validator: validateTanggal,
                  onTap: () async {
                    DateTime? tanggalpick = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );

                    if (tanggalpick != null) {
                      tanggal = DateFormat('dd-MM-yyyy').format(tanggalpick);

                      setState(() {
                        datetimeinput.text = tanggal.toString();
                      });
                    }
                  },
                ),
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Alamat :',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _controllerAlamat,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "Masukkan Alamat pemilih",
                    prefixIcon: const Icon(Icons.location_on),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  readOnly: true,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MapsPage(onLocationSelected: (selectedLoc) {
                            setState(() {
                              _controllerAlamat.text = selectedLoc;
                            });
                          }),
                        ));
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Alamat tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Gambar :',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                gambar != null
                    ? Image.network(
                        gambar!,
                        height: 120,
                        width: 120,
                      )
                    : const Text('Tidak ada foto yg dipilih'),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => _uploadImage(ImageSource.camera),
                      icon: const Icon(Icons.camera_alt),
                      label: const Text('Camera'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton.icon(
                      onPressed: () => _uploadImage(ImageSource.gallery),
                      icon: const Icon(Icons.photo_library),
                      label: const Text('Gallery'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        gambar != null &&
                        jk != null) {
                      _formKey.currentState!.save();
                      FormModel dk = FormModel(
                          nik: nik!,
                          nama: nama!,
                          notelp: notelp!,
                          jk: jk!,
                          tanggal: datetimeinput.text,
                          alamat: _controllerAlamat.text,
                          gambar: gambar!);

                      dpController.addDataPemilih(dk);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Data Pemilih Berhasil ditambahkan')));

                      Navigator.pop(context, true);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              'Data pemilih belum terisi semua silahkan lengkapi terlebih dahulu')));
                    }
                  },
                  child: const Text("Simpan"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Method Upload
  Future<void> _uploadImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

      // Get a reference to storage root
      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImage = referenceRoot.child('images');

      // create a reference
      Reference referenceImageToUpload =
          referenceDirImage.child(uniqueFileName);

      // Handle error/success
      try {
        // Store the file
        await referenceImageToUpload.putFile(
          File(pickedImage.path),
        );

        // success message
        gambar = await referenceImageToUpload.getDownloadURL();

        setState(() {
          gambar!;
        });
      } catch (e) {
        print(e);
      }
    }
  }
}

String? validateTanggal(String? value) {
  if (value == null || value.isEmpty) {
    return "Tolong masukan tanggal";
  }
  return null;
}
