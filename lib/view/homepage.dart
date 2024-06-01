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
  var dkController = DataKaryawanController();

  @override
  void initState() {
    dkController.getDataKaryawan();
    super.initState();
  }

  // Future<void> _refreshData() async {
  //   await dkController.getDataKaryawan();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Karyawan'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: StreamBuilder<List<DocumentSnapshot>>(
                stream: dkController.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final List<DocumentSnapshot> datakaryawan = snapshot.data!;

                  return ListView.builder(
                    itemCount: datakaryawan.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailDataPage(
                                  id: datakaryawan[index]['id'],
                                  nama: datakaryawan[index]['nama'],
                                  notelp: datakaryawan[index]['notelp'],
                                  posisi: datakaryawan[index]['posisi'],
                                  status: datakaryawan[index]['status'],
                                  alamat: datakaryawan[index]['alamat'],
                                  gambar: datakaryawan[index]['gambar'],
                                ),
                              ),
                            ).then((value) {
                              if (value == true) {
                                setState(() {
                                  dkController.getDataKaryawan();
                                });
                              }
                            });
                          },
                          child: Card(
                            elevation: 10,
                            child: ListTile(
                              title: Text(datakaryawan[index]['nama']),
                              subtitle: Text(datakaryawan[index]['notelp']),
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
                  dkController.getDataKaryawan();
                })
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
