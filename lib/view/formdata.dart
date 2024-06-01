import 'package:app_data_karyawan/controller/formdata_controller.dart';
import 'package:app_data_karyawan/model/formdata_model.dart';
import 'package:app_data_karyawan/view/maps_page.dart';
import 'package:flutter/material.dart';

class Formpage extends StatefulWidget {
  const Formpage({super.key});

  @override
  State<Formpage> createState() => _FormpageState();
}

class _FormpageState extends State<Formpage> {
  final _formKey = GlobalKey<FormState>();

  String? nama;
  String? notelp;
  String? posisi;
  String? status;
  String? alamat;
  String? gambar;

  var dkController = DataKaryawanController();

  List<String> pilihanPosisi = [
    'Kasir',
    'Karyawan Gudang',
    'Karyawan Toko',
    'Supplier'
  ];

  List<String> pilihanStatus = ['Aktif', 'Tidak Aktif'];

  List<DropdownMenuItem> generatePosisi(List<String> pilPosisi) {
    List<DropdownMenuItem> itemsPosisi = [];
    for (var itemPosisi in pilPosisi) {
      itemsPosisi.add(DropdownMenuItem(
        child: Text(itemPosisi),
        value: itemPosisi,
      ));
    }
    return itemsPosisi;
  }

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

  final TextEditingController _controllerNama = TextEditingController();
  final TextEditingController _controllerNoTelp = TextEditingController();
  final TextEditingController _controllerAlamat = TextEditingController();
  final TextEditingController _controllerGambar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        title: const Text("Pengisian Data Karyawan"),
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
                    hintText: "Masukkan nama karyawan",
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
                    hintText: "Masukkan nomor HP karyawan",
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
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Posisi :',
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
                  child: DropdownButton(
                    borderRadius: BorderRadius.circular(10),
                    icon: const Icon(Icons.arrow_drop_down_circle_rounded),
                    dropdownColor: const Color.fromARGB(255, 223, 121, 238),
                    hint: const Text("Pilih posisi karyawan"),
                    value: posisi,
                    items: generatePosisi(pilihanPosisi),
                    onChanged: (itemPosisi) {
                      setState(() {
                        posisi = itemPosisi;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Status :',
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
                  child: DropdownButton(
                    borderRadius: BorderRadius.circular(10),
                    icon: const Icon(Icons.arrow_drop_down_circle_rounded),
                    dropdownColor: const Color.fromARGB(255, 223, 121, 238),
                    hint: const Text("Pilih Status karyawan"),
                    value: status,
                    items: generateStatus(pilihanStatus),
                    onChanged: (itemStatus) {
                      setState(() {
                        status = itemStatus;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
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
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: "Masukkan Alamat karyawan",
                    prefixIcon: const Icon(Icons.work),
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
                TextFormField(
                  controller: _controllerGambar,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "Masukkan gambar anda",
                    prefixIcon: const Icon(Icons.camera_alt),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  readOnly: true,
                  onChanged: (value) {
                    gambar = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      FormModel dk = FormModel(
                          nama: nama!,
                          notelp: notelp!,
                          posisi: posisi!,
                          status: status!,
                          alamat: _controllerAlamat.text,
                          gambar: gambar!);

                      dkController.addDataKaryawan(dk);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Data Karyawan Berhasil ditambahkan')));

                      Navigator.pop(context, true);
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
}
