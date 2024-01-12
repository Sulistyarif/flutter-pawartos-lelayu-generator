import 'dart:developer';

import 'package:get/get.dart';

import '../api/api_client.dart';

class GenerateController extends GetxController {
  RxString summarizeText = 'pawartos-lelayu-template.docx'.obs;
  Future<bool> generateDocx(dataParam) async {
    try {
      final result = await ApiClient.post('/generate', {'data': dataParam});
      if (result['success']) {
        summarizeText.value = result['result'];
        return true;
      } else {
        log('Gagal generate');
        Get.snackbar('Warning', result['message']);
        return false;
      }
    } catch (e) {
      Get.snackbar('Warning', e.toString());
      return false;
    }
  }
}
