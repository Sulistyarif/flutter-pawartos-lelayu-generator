import 'package:fe_pawartos_lelayu/data/generate_controller.dart';
import 'package:fe_pawartos_lelayu/screens/container_halaman_utama.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'utils/register_web_webview.dart'
    if (dart.lib.html) 'register_web_webview.dart';

void main() {
  registerWebViewWebImplementation();
  initializeDateFormatting('id_ID', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GenerateController());
    return const GetMaterialApp(
      home: ContainerHalamanUtama(),
    );
  }
}
