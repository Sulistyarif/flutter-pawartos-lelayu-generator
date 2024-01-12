import 'dart:convert';

import 'package:fe_pawartos_lelayu/data/general_controller.dart';
import 'package:fe_pawartos_lelayu/data/generate_controller.dart';
import 'package:fe_pawartos_lelayu/screens/preview_hasil_generate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/data_pawartos.dart';

class HalamanFormIsian extends StatefulWidget {
  const HalamanFormIsian({super.key});

  @override
  State<HalamanFormIsian> createState() => _HalamanFormIsianState();
}

class _HalamanFormIsianState extends State<HalamanFormIsian> {
  String? formattedDate;
  String? formattedDay;
  String? formattedTime;
  List<Kerabat> kerabatList = [];
  final controllerKerabatNama = TextEditingController(text: '');
  final controllerKerabatStatus = TextEditingController(text: '');
  final controllerNama = TextEditingController(text: '');
  final controllerUmur = TextEditingController(text: '');
  final controllerAlamat = TextEditingController(text: '');
  final controllerSedoDinten = TextEditingController(text: '');
  final controllerSedoTgl = TextEditingController(text: '');
  final controllerSedoTabuh = TextEditingController(text: '');
  final controllerSedoWonten = TextEditingController(text: 'RS');
  final controllerKuburDinten = TextEditingController(text: '');
  final controllerKuburTgl = TextEditingController(text: '');
  final controllerKuburTabuh = TextEditingController(text: '');
  final controllerKuburWonten = TextEditingController(text: 'Makam');
  final controllerGenerator = Get.find<GenerateController>();
  final controllerGeneral = Get.find<GeneralController>();

  @override
  void initState() {
    formattedDate = DateFormat('d MMMM y', 'id_ID').format(DateTime.now());
    formattedDay = DateFormat('EEEE', 'id_ID').format(DateTime.now());
    formattedTime = DateFormat('HH:mm', 'id_ID').format(DateTime.now());
    controllerSedoDinten.text = formattedDay ?? '';
    controllerSedoTgl.text = formattedDate ?? '';
    controllerKuburDinten.text = formattedDay ?? '';
    controllerKuburTgl.text = formattedDate ?? '';
    controllerSedoTabuh.text = formattedTime ?? '';
    controllerKuburTabuh.text = formattedTime ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        children: [
          const Text(
            'Nama',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          CupertinoTextField(
            controller: controllerNama,
          ),
          const SizedBox(height: 10),
          const Text(
            'Umur',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          CupertinoTextField(
            controller: controllerUmur,
          ),
          const SizedBox(height: 10),
          const Text(
            'Alamat',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          CupertinoTextField(
            controller: controllerAlamat,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sedo Rikolo',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Dinten',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    CupertinoTextField(
                      controller: controllerSedoDinten,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Tanggal',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    CupertinoTextField(
                      controller: controllerSedoTgl,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Tabuh Jam',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    CupertinoTextField(
                      controller: controllerSedoTabuh,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Wonten',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    CupertinoTextField(
                      controller: controllerSedoWonten,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Badhe Kasarekaken',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Dinten',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    CupertinoTextField(
                      controller: controllerKuburDinten,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Tanggal',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    CupertinoTextField(
                      controller: controllerKuburTgl,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Tabuh Jam',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    CupertinoTextField(
                      controller: controllerKuburTabuh,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Wonten',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    CupertinoTextField(
                      controller: controllerKuburWonten,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Ahli Waris',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                          '${index + 1}. ${kerabatList[index].nama} (${kerabatList[index].status})'),
                    ),
                    GestureDetector(
                        onTap: () {
                          kerabatList.remove(kerabatList[index]);
                          setState(() {});
                        },
                        child: const Icon(Icons.close))
                  ],
                ),
              );
            },
            primary: false,
            shrinkWrap: true,
            itemCount: kerabatList.length,
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: CupertinoTextField(
                  controller: controllerKerabatNama,
                  placeholder: "nama..",
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: CupertinoTextField(
                  controller: controllerKerabatStatus,
                  placeholder: "status..",
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  kerabatList.add(
                    Kerabat(
                      nama: controllerKerabatNama.text,
                      status: controllerKerabatStatus.text,
                    ),
                  );
                  controllerKerabatNama.clear();
                  controllerKerabatStatus.clear();
                  setState(() {});
                },
                child: const Text('Tambah'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[400]),
            onPressed: () async {
              DataPawartos dataPawartos = DataPawartos(
                nama: controllerNama.text,
                alamat: controllerAlamat.text,
                umur: controllerUmur.text,
                kerabat: kerabatList,
                sedoDinten: controllerSedoDinten.text,
                kuburDinten: controllerKuburDinten.text,
                kuburTabuh: controllerKuburTabuh.text,
                kuburTgl: controllerKuburTgl.text,
                kuburWonten: controllerKuburWonten.text,
                sedoTabuh: controllerSedoTabuh.text,
                sedoTgl: controllerSedoTgl.text,
                sedoWonten: controllerSedoWonten.text,
              );
              await controllerGenerator.generateDocx(jsonEncode(dataPawartos));
              if (controllerGeneral.isMobile.value) {
                Get.dialog(
                  const Dialog(
                    child: PreviewHasilGenerate(),
                  ),
                );
              }
            },
            child: const Text(
              'GENERATE PAWARTOS',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
