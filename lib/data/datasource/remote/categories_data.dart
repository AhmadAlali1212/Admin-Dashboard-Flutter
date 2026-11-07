import 'dart:io';

import 'package:adminapplication/core/class/crud.dart';
import 'package:adminapplication/core/constant/app_link.dart';

class CategoriesData {
  Crud crud;
  CategoriesData(this.crud);
  view() async {
    var respons = await crud.postData(AppLink.categoriesView, {});
    return respons.fold((l) => l, (r) => r);
  }

  add(String name, String nameAr, File file) async {
    var respons = await crud.addRequestWithImageOne(AppLink.categoriesAdd, {
      "name": name,
      "namear": nameAr,
    }, file);
    return respons.fold((l) => l, (r) => r);
  }

  edit(
    String cateId,
    String name,
    String nameAr,
    String image, [
    File? file,
  ]) async {
    if (file != null) {
      var respons = await crud.addRequestWithImageOne(AppLink.categoriesEdit, {
        "cateid": cateId,
        "name": name,
        "namear": nameAr,
        "imagename": image,
      }, file);
      return respons.fold((l) => l, (r) => r);
    } else {
      var respons = await crud.postData(AppLink.categoriesEdit, {
        "cateid": cateId,
        "name": name,
        "namear": nameAr,
        "imagename": image,
      });
      return respons.fold((l) => l, (r) => r);
    }
  }

  remove(String cateId, String image) async {
    var respons = await crud.postData(AppLink.categoriesRemove, {
      "cateid": cateId,
      "imagename": image,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
