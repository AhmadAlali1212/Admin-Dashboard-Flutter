import 'package:adminapplication/core/constant/app_routes.dart';
import 'package:adminapplication/core/constant/status_requset.dart';
import 'package:adminapplication/core/functions/handlingdatacontroller.dart';
import 'package:adminapplication/core/services/service.dart';
import 'package:adminapplication/data/datasource/remote/items_data.dart';
import 'package:adminapplication/data/model/categories_model.dart';
import 'package:adminapplication/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class AbstraItemsViewController extends GetxController {
  getItems();
  removeItems(String cateId, String image);
  goToEditPage(ItemsModel itemsModel);
}

class ItemsViewController extends AbstraItemsViewController {
  MyService myService = Get.find();
  List<ItemsModel> data = [];
  StatusRequset statusRequset = StatusRequset.none;
  ItemsData itemsData = ItemsData(Get.find());

  @override
  getItems() async {
    data.clear();
    statusRequset = StatusRequset.loading;
    update();
    var response = await itemsData.view();
    print(response);
    statusRequset = handdlingData(response);
    if (statusRequset == StatusRequset.success) {
      if (response["status"] == "success") {
        List dataList = response['data'];
        data.addAll(dataList.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequset = StatusRequset.failure;
      }
    } else {
      statusRequset = StatusRequset.failure;
    }
    update();
  }

  @override
  removeItems(String itemsId, String image) {
    itemsData.remove(itemsId, image);
    data.removeWhere((element) => element.itemsId.toString() == itemsId);
    update();
  }

  @override
  goToEditPage(ItemsModel itemsModel) {
    Get.toNamed(AppRoutes.itemsEdit, arguments: {"itemsModel": itemsModel});
  }

  myback() {
    Get.offAllNamed(AppRoutes.home);
    return Future.value(false);
  }

  @override
  void onInit() {
    getItems();
    super.onInit();
  }
}
