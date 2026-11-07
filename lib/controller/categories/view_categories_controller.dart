import 'package:adminapplication/core/constant/app_routes.dart';
import 'package:adminapplication/core/constant/status_requset.dart';
import 'package:adminapplication/core/functions/handlingdatacontroller.dart';
import 'package:adminapplication/core/services/service.dart';
import 'package:adminapplication/data/datasource/remote/categories_data.dart';
import 'package:adminapplication/data/model/categories_model.dart';
import 'package:get/get.dart';

abstract class AbstractategoriesViewController extends GetxController {
  getCategories();
  removeCategories(String cateId, String image);
  goToEditPage(CategoriesModel categoriesModel);
}

class CategoriesViewController extends AbstractategoriesViewController {
  MyService myService = Get.find();
  List<CategoriesModel> data = [];
  StatusRequset statusRequset = StatusRequset.none;
  CategoriesData categoriesData = CategoriesData(Get.find());
  CategoriesModel? categoriesModel;
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
      } else {
        statusRequset = StatusRequset.failure;
      }
    } else {
      statusRequset = StatusRequset.failure;
    }
    update();
  }

  @override
  removeCategories(String cateId, String image) {
    categoriesData.remove(cateId, image);
    data.removeWhere((element) => element.categoriesId.toString() == cateId);
    update();
  }

  @override
  goToEditPage(CategoriesModel categoriesModel) {
    Get.toNamed(
      AppRoutes.categoriesEdit,
      arguments: {"categoriesModel": categoriesModel},
    );
  }

  myback() {
    Get.offAllNamed(AppRoutes.home);
    return Future.value(false);
  }

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }
}
