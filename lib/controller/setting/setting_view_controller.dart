import 'package:adminapplication/core/constant/app_routes.dart';
import 'package:adminapplication/core/constant/status_requset.dart';
import 'package:adminapplication/core/functions/handlingdatacontroller.dart';
import 'package:adminapplication/data/datasource/remote/setting_data.dart';
import 'package:adminapplication/data/model/setting_model.dart';
import 'package:get/get.dart';

abstract class SettingViewControllerAbstract extends GetxController {
  getSettings();
  removeSetting(String settingId);
  goToEditPage(SettingModel settingModel);
}

class SettingViewController extends SettingViewControllerAbstract {
  final SettingData settingData = SettingData(Get.find());
  final List<SettingModel> data = [];
  StatusRequset statusRequset = StatusRequset.none;

  @override
  getSettings() async {
    data.clear();
    statusRequset = StatusRequset.loading;
    update();
    final response = await settingData.view();
    statusRequset = handdlingData(response);
    if (statusRequset == StatusRequset.success) {
      if (response['status'] == 'success') {
        final dataList = response['data'] as List;
        data.addAll(dataList.map((e) => SettingModel.fromJson(e)));
      } else {
        statusRequset = StatusRequset.failure;
      }
    } else {
      statusRequset = StatusRequset.failure;
    }
    update();
  }

  @override
  removeSetting(String settingId) {
    settingData.remove(settingId);
    data.removeWhere((element) => element.settingId.toString() == settingId);
    update();
  }

  @override
  goToEditPage(SettingModel settingModel) {
    Get.toNamed(
      AppRoutes.settingEdit,
      arguments: {'settingModel': settingModel},
    );
  }

  @override
  void onInit() {
    getSettings();
    super.onInit();
  }
}
