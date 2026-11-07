import 'dart:io';

import 'package:adminapplication/controller/items/view_items_controller.dart';
import 'package:adminapplication/core/constant/app_routes.dart';
import 'package:adminapplication/core/constant/status_requset.dart';
import 'package:adminapplication/core/functions/handlingdatacontroller.dart';
import 'package:adminapplication/core/functions/uploadFile.dart';
import 'package:adminapplication/core/services/service.dart';
import 'package:adminapplication/data/datasource/remote/categories_data.dart';
import 'package:adminapplication/data/datasource/remote/items_data.dart';
import 'package:adminapplication/data/model/categories_model.dart';
import 'package:adminapplication/data/model/items_model.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class AbstraItemsEditController extends GetxController {
  editItems();
  showChooseImageOptions();
  addImageFromGallery();
  addImageFromCamera();
  changeActive(val);
  getCategories();
}

class ItemsEditController extends AbstraItemsEditController {
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
  late String isActive;
  late String dateNow;
  late String itemid;
  File? file;
  GlobalKey<FormState> fromState = GlobalKey<FormState>();
  ItemsModel? itemsModel;
  List<CategoriesModel> data = [];
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
    isActive = val;
    update();
  }

  @override
  editItems() async {
    var fromApp = fromState.currentState;
    if (fromApp != null && fromApp.validate()) {
      statusRequset = StatusRequset.loading;
      update();

      Map<String, dynamic> dataMap = {
        "itemid": itemid,
        "name": name.text,
        "namear": nameAr.text,
        "desc": desc.text,
        "descar": descar.text,
        "price": price.text,
        "isactive": isActive,
        "discount": discount.text,
        "cateid": cateid.text,
        "count": count.text,
        "imageold": itemsModel!.itemsImage,
        "dateNow": DateTime.now().toString(),
      };
      var response = await itemsData.edit(dataMap, file);
      print("rwa response");
      print(response);
      statusRequset = handdlingData(response);
      if (statusRequset == StatusRequset.success) {
        if (response["status"] == "success") {
          Get.offNamed(AppRoutes.items);
          ItemsViewController c = Get.find();
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
    getCategories();
    itemsModel = Get.arguments['itemsModel'];
    itemid = itemsModel!.itemsId.toString();
    name = TextEditingController(text: itemsModel!.itemsName);
    nameAr = TextEditingController(text: itemsModel!.itemsNameAr);
    desc = TextEditingController(text: itemsModel!.itemsName);
    descar = TextEditingController(text: itemsModel!.itemsName);
    price = TextEditingController(text: itemsModel!.itemsName);
    discount = TextEditingController(text: itemsModel!.itemsName);
    count = TextEditingController(text: itemsModel!.itemsName);
    cateid = TextEditingController(text: itemsModel!.itemsName);
    cateName = TextEditingController(text: itemsModel!.itemsName);
    isActive = itemsModel!.itemsActive.toString();
    name.text = itemsModel!.itemsName!;
    nameAr.text = itemsModel!.itemsNameAr!;
    desc.text = itemsModel!.itemsDesc!;
    descar.text = itemsModel!.itemsDescAr!;
    price.text = itemsModel!.itemsPrice!.toString();
    discount.text = itemsModel!.itemsDiscount.toString();
    count.text = itemsModel!.itemsCount.toString();
    cateid.text = itemsModel!.categoriesId!.toString();
    cateName.text = itemsModel!.categoriesNameAr!;
    dateNow = itemsModel!.itemsDate.toString();
    super.onInit();
  }
}
