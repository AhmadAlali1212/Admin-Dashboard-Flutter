import 'dart:io';

import 'package:adminapplication/controller/categories/view_categories_controller.dart';
import 'package:adminapplication/controller/items/view_items_controller.dart';
import 'package:adminapplication/core/constant/app_routes.dart';
import 'package:adminapplication/core/constant/status_requset.dart';
import 'package:adminapplication/core/functions/handlingdatacontroller.dart';
import 'package:adminapplication/core/functions/uploadFile.dart';
import 'package:adminapplication/core/services/service.dart';
import 'package:adminapplication/data/datasource/remote/categories_data.dart';
import 'package:adminapplication/data/datasource/remote/items_data.dart';
import 'package:adminapplication/data/model/categories_model.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AbstraItemsAddController extends GetxController {
  AddItems();
  showChooseImageOptions();
  addImageFromGallery();
  addImageFromCamera();
  changeActive(val);
  getCategories();
}

class ItemsAddController extends AbstraItemsAddController {
  StatusRequset statusRequset = StatusRequset.none;
  MyService myService = Get.find();
  late TextEditingController name;
  late TextEditingController nameAr;
  late TextEditingController desc;
  late TextEditingController descar;
  late TextEditingController price;
  late TextEditingController discount;
  late TextEditingController count;
  late TextEditingController cateid;
  late TextEditingController cateName;
  String isActive = "1";

  List<CategoriesModel> data = [];
  File? file;
  GlobalKey<FormState> fromState = GlobalKey<FormState>();
  List<SelectedListItem> selectedListItem = [];
  ItemsData itemsData = ItemsData(Get.find());
  CategoriesData categoriesData = CategoriesData(Get.find());
  @override
  showChooseImageOptions() {
    showbottommenue(addImageFromCamera, addImageFromGallery);
  }

  @override
  addImageFromGallery() async {
    file = await imageUploadGallery(false);
    update();
  }

  @override
  addImageFromCamera() async {
    file = await imageUploadCamera();
    update();
  }

  @override
  changeActive(val) {
    if (val != null) {
      isActive = val;
      update();
    }
  }

  @override
  AddItems() async {
    var fromApp = fromState.currentState;
    if (fromApp!.validate()) {
      statusRequset = StatusRequset.loading;
      update();
      Map<String, dynamic> dataMap = {
        "name": name.text,
        "namear": nameAr.text,
        "desc": desc.text,
        "descar": descar.text,
        "price": price.text,
        "isactive": isActive,
        "discount": discount.text,
        "cateid": cateid.text,
        "count": count.text,
        "dateNow": DateTime.now().toString(),
      };
      var response = await itemsData.add(dataMap, file!);
      print("rwa response");
      print(response);
      statusRequset = handdlingData(response);
      if (statusRequset == StatusRequset.success) {
        if (response["status"] == "success") {
          Get.offNamed(AppRoutes.items);
          final ItemsViewController c = Get.find();
          c.getItems();
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
  getCategories() async {
    data.clear();
    statusRequset = StatusRequset.loading;
    update();
    var response = await categoriesData.view();
    print(response);
    statusRequset = handdlingData(response);
    if (statusRequset == StatusRequset.success) {
      if (response["status"] == "success") {
        List dataList = response['data'];
        data.addAll(dataList.map((e) => CategoriesModel.fromJson(e)));
        selectedListItem.clear();
        for (var element in data) {
          selectedListItem.add(
            SelectedListItem<CategoriesModel>(data: element, isSelected: false),
          );
        }
      } else {
        statusRequset = StatusRequset.failure;
      }
    } else {
      statusRequset = StatusRequset.failure;
    }
    update();
  }

  @override
  void onInit() {
    name = TextEditingController();
    nameAr = TextEditingController();
    desc = TextEditingController();
    descar = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    count = TextEditingController();
    cateid = TextEditingController();
    cateName = TextEditingController();
    getCategories();
    super.onInit();
  }
}
