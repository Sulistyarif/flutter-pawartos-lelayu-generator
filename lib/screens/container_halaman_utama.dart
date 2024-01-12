import 'package:fe_pawartos_lelayu/screens/halaman_form_isian.dart';
import 'package:fe_pawartos_lelayu/screens/preview_hasil_generate.dart';
import 'package:flutter/material.dart';

class ContainerHalamanUtama extends StatefulWidget {
  const ContainerHalamanUtama({super.key});

  @override
  State<ContainerHalamanUtama> createState() => _ContainerHalamanUtamaState();
}

class _ContainerHalamanUtamaState extends State<ContainerHalamanUtama> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pawartos Lelayu Generator',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: const Row(
        children: [
          Expanded(
            flex: 1,
            child: HalamanFormIsian(),
          ),
          Expanded(
            flex: 2,
            child: PreviewHasilGenerate(),
          ),
        ],
      ),
    );
  }
}
