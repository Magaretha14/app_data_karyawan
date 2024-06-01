import 'package:app_data_karyawan/view/homepage.dart';
import 'package:flutter/material.dart';

class DetailDataPage extends StatefulWidget {
  const DetailDataPage(
      {super.key,
      this.id,
      this.nama,
      this.notelp,
      this.posisi,
      this.status,
      this.alamat,
      this.gambar});

  final String? id;
  final String? nama;
  final String? notelp;
  final String? posisi;
  final String? status;
  final String? alamat;
  final String? gambar;

  @override
  State<DetailDataPage> createState() => _DetailDataPageState();
}

class _DetailDataPageState extends State<DetailDataPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        title: const Text("Detail Data Karyawan"),
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
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  initialValue: widget.nama,
                  readOnly: true,
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
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.smartphone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  initialValue: widget.notelp,
                  readOnly: true,
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
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.smartphone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  initialValue: widget.posisi,
                  readOnly: true,
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
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.smartphone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  initialValue: widget.status,
                  readOnly: true,
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
                  keyboardType: TextInputType.name,
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
                  initialValue: widget.alamat,
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
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "Masukkan gambar anda",
                    prefixIcon: const Icon(Icons.image),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  initialValue: widget.gambar,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: const Text("Back"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
