import 'package:fe_pawartos_lelayu/data/general_controller.dart';
import 'package:fe_pawartos_lelayu/data/generate_controller.dart';
import 'package:fe_pawartos_lelayu/mobile_view/screens/container_halaman_utama_mobile.dart';
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Get.put(GenerateController());
    final controllerGeneral = Get.put(GeneralController());
    controllerGeneral.isMobile.value = MediaQuery.of(context).size.width < 600;
    return GetMaterialApp(
      home: controllerGeneral.isMobile.value
          ? const ContainerHalamanUtamaMobile()
          : const ContainerHalamanUtama(),
    );
  }
}
