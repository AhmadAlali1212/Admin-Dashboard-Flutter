import 'dart:io';

import 'package:adminapplication/controller/categories/view_categories_controller.dart';
import 'package:adminapplication/core/constant/app_routes.dart';
import 'package:adminapplication/core/constant/status_requset.dart';
import 'package:adminapplication/core/functions/handlingdatacontroller.dart';
import 'package:adminapplication/core/functions/uploadFile.dart';
import 'package:adminapplication/core/services/service.dart';
import 'package:adminapplication/data/datasource/remote/categories_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AbstractategoriesAddController extends GetxController {
  AddCategories();
}

class CategoriesAddController extends AbstractategoriesAddController {
  StatusRequset statusRequset = StatusRequset.none;
  MyService myService = Get.find();
  TextEditingController? name;
  TextEditingController? nameAr;
  File? file;
  GlobalKey<FormState> fromState = GlobalKey<FormState>();

  CategoriesData categoriesData = CategoriesData(Get.find());
  addImage() async {
    file = await imageUploadGallery(true);
    update();
  }

  AddCategories() async {
    if (file == null) {
      Get.snackbar("Error", "Please add an image for the category");
      return;
    }
    var fromApp = fromState.currentState;
    if (fromApp!.validate()) {
      statusRequset = StatusRequset.loading;
      update();
      var response = await categoriesData.add(name!.text, nameAr!.text, file!);
      print("rwa response");
      print(response);
      statusRequset = handdlingData(response);
      if (statusRequset == StatusRequset.success) {
        if (response["status"] == "success") {
          Get.offNamed(AppRoutes.categories);
          CategoriesViewController c = Get.find();
          c.getCategories();
        } else {
          statusRequset = StatusRequset.failure;
        }
      } else {
        print("$statusRequset");
      }
      update();
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    name = TextEditingController();
    nameAr = TextEditingController();

    super.onInit();
  }
}
