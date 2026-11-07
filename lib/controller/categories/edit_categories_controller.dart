import 'dart:io';

import 'package:adminapplication/controller/categories/view_categories_controller.dart';
import 'package:adminapplication/core/constant/app_routes.dart';
import 'package:adminapplication/core/constant/status_requset.dart';
import 'package:adminapplication/core/functions/handlingdatacontroller.dart';
import 'package:adminapplication/core/functions/uploadFile.dart';
import 'package:adminapplication/core/services/service.dart';
import 'package:adminapplication/data/datasource/remote/categories_data.dart';
import 'package:adminapplication/data/model/categories_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class AbstractategoriesEditController extends GetxController {
  editCategories();
}

class CategoriesEditController extends AbstractategoriesEditController {
  StatusRequset statusRequset = StatusRequset.none;
  MyService myService = Get.find();
  TextEditingController? name;
  TextEditingController? nameAr;
  File? file;
  GlobalKey<FormState> fromState = GlobalKey<FormState>();
  CategoriesModel? categoriesModel;
  CategoriesData categoriesData = CategoriesData(Get.find());
  addImage() async {
    file = await imageUploadGallery(true);
    update();
  }

  @override
  editCategories() async {
    var fromApp = fromState.currentState;
    if (fromApp != null && fromApp.validate()) {
      statusRequset = StatusRequset.loading;
      update();
      var response = await categoriesData.edit(
        categoriesModel!.categoriesId.toString(),
        name!.text,
        nameAr!.text,
        categoriesModel!.categoriesImage.toString(),
        file,
      );
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
    categoriesModel = Get.arguments['categoriesModel'];
    name = TextEditingController(text: categoriesModel!.categoriesName);
    nameAr = TextEditingController(text: categoriesModel!.categoriesNameAr);
    name!.text = categoriesModel!.categoriesName!;
    nameAr!.text = categoriesModel!.categoriesNameAr!;

    super.onInit();
  }
}
