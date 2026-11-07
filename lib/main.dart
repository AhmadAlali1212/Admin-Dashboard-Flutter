import 'package:adminapplication/bindings/my_binding.dart';
import 'package:adminapplication/core/localization/changed_local.dart';
import 'package:adminapplication/core/localization/translation.dart';
import 'package:adminapplication/core/services/service.dart';
import 'package:adminapplication/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ChangedLocal controller = Get.put(ChangedLocal());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      initialBinding: MyBinding(),
      locale: controller.language,
      theme: controller.appTheme,

      getPages: route,
    );
  }
}
