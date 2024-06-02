import 'package:app_data_karyawan/controller/formdata_controller.dart';
import 'package:app_data_karyawan/view/detaildata.dart';
import 'package:app_data_karyawan/view/formdata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var dpController = DataPemilihController();

  @override
  void initState() {
    dpController.getDataPemilih();
    super.initState();
  }

  // Future<void> _refreshData() async {
  //   await dkController.getdatapemilih();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Karyawan'),
        backgroundColor: Colors.purple[200],
      ),
      backgroundColor: Colors.purple[100],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: StreamBuilder<List<DocumentSnapshot>>(
                stream: dpController.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final List<DocumentSnapshot> datapemilih = snapshot.data!;

                  return ListView.builder(
                    itemCount: datapemilih.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailDataPage(
                                  id: datapemilih[index]['id'],
                                  nik: datapemilih[index]['nik'],
                                  nama: datapemilih[index]['nama'],
                                  notelp: datapemilih[index]['notelp'],
                                  jk: datapemilih[index]['jk'],
                                  tanggal: datapemilih[index]['tanggal'],
                                  alamat: datapemilih[index]['alamat'],
                                  gambar: datapemilih[index]['gambar'],
                                ),
                              ),
                            ).then((value) {
                              if (value == true) {
                                setState(() {
                                  dpController.getDataPemilih();
                                });
                              }
                            });
                          },
                          child: Card(
                            color: Colors.purple[50],
                            elevation: 10,
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.network(
                                    datapemilih[index]['gambar'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nik : ${datapemilih[index]['nik']}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Nama : ${datapemilih[index]['nama']}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "No. Telp : ${datapemilih[index]['notelp']}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Tanggal : ${datapemilih[index]['tanggal']}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Formpage()),
          ).then((value) => {
                setState(() {
                  dpController.getDataPemilih();
                })
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
