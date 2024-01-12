import 'package:fe_pawartos_lelayu/screens/halaman_form_isian.dart';
import 'package:fe_pawartos_lelayu/screens/preview_hasil_generate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerHalamanUtamaMobile extends StatefulWidget {
  const ContainerHalamanUtamaMobile({super.key});

  @override
  State<ContainerHalamanUtamaMobile> createState() =>
      _ContainerHalamanUtamaMobileState();
}

class _ContainerHalamanUtamaMobileState
    extends State<ContainerHalamanUtamaMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pawartos Lelayu Generator',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        actions: [
          GestureDetector(
            onTap: () {
              Get.dialog(const Dialog(
                child: PreviewHasilGenerate(),
              ));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.visibility_outlined,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: const HalamanFormIsian(),
    );
  }
}
