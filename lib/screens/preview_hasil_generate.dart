import 'package:fe_pawartos_lelayu/api/konstanta.dart';
import 'package:fe_pawartos_lelayu/data/generate_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:html' as html;

class PreviewHasilGenerate extends StatefulWidget {
  const PreviewHasilGenerate({super.key});

  @override
  State<PreviewHasilGenerate> createState() => _PreviewHasilGenerateState();
}

class _PreviewHasilGenerateState extends State<PreviewHasilGenerate> {
  var controller = WebViewController();
  final controllerGenerator = Get.find<GenerateController>();

  @override
  void initState() {
    // controller = WebViewController()
    //   ..loadRequest(Uri.parse(
    //       'https://view.officeapps.live.com/op/embed.aspx?src=${Konstanta.baseUrl}/${controllerGenerator.summarizeText.value}'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        var controller = WebViewController();
        controller.loadRequest(Uri.parse(
          'https://view.officeapps.live.com/op/embed.aspx?src=${Konstanta.baseUrl}/${controllerGenerator.summarizeText.value}',
        ));
        return Column(
          children: [
            Expanded(child: WebViewWidget(controller: controller)),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      onPressed: () {
                        html.window.open(
                            '${Konstanta.baseUrl}/${controllerGenerator.summarizeText.value}',
                            '_blank');
                      },
                      child: const Text(
                        'Download File Docx',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey),
                      onPressed: () {
                        Get.snackbar('Warning', 'Masih dalam pengembangan');
                      },
                      child: const Text(
                        'Download File PDF',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
