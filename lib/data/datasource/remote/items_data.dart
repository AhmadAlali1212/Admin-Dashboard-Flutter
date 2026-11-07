import 'dart:io';

import 'package:adminapplication/core/class/crud.dart';
import 'package:adminapplication/core/constant/app_link.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  view() async {
    var respons = await crud.postData(AppLink.itemsView, {});
    return respons.fold((l) => l, (r) => r);
  }

  add(Map data, File file) async {
    var respons = await crud.addRequestWithImageOne(
      AppLink.itemsAdd,
      data,
      file,
    );
    return respons.fold((l) => l, (r) => r);
  }

  edit(Map data, [File? file]) async {
    if (file != null) {
      var respons = await crud.addRequestWithImageOne(
        AppLink.itemsEdit,
        data,
        file,
      );
      return respons.fold((l) => l, (r) => r);
    } else {
      var respons = await crud.postData(AppLink.itemsEdit, data);
      return respons.fold((l) => l, (r) => r);
    }
  }

  remove(String itemid, String image) async {
    var respons = await crud.postData(AppLink.itemsRemove, {
      "itemid": itemid,
      "imagename": image,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
