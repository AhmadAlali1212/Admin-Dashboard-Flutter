import 'package:adminapplication/core/constant/app_routes.dart';
import 'package:adminapplication/core/constant/status_requset.dart';
import 'package:adminapplication/core/functions/handlingdatacontroller.dart';
import 'package:adminapplication/data/datasource/remote/deliveryworker_data.dart';
import 'package:adminapplication/data/model/deliveryworker_model.dart';
import 'package:get/get.dart';

abstract class DeliveryworkerViewControllerAbstract extends GetxController {
  getDeliveryworkers();
  removeDeliveryworker(String deliveryworkerId);
  goToEditPage(DeliveryworkerModel deliveryworkerModel);
}

class DeliveryworkerViewController
    extends DeliveryworkerViewControllerAbstract {
  final DeliveryworkerData deliveryworkerData = DeliveryworkerData(Get.find());
  final List<DeliveryworkerModel> data = [];
  StatusRequset statusRequset = StatusRequset.none;

  @override
  getDeliveryworkers() async {
    data.clear();
    statusRequset = StatusRequset.loading;
    update();
    final response = await deliveryworkerData.view();
    statusRequset = handdlingData(response);
    if (statusRequset == StatusRequset.success) {
      if (response['status'] == 'success') {
        final dataList = response['data'] as List;
        data.addAll(dataList.map((e) => DeliveryworkerModel.fromJson(e)));
      } else {
        statusRequset = StatusRequset.failure;
      }
    } else {
      statusRequset = StatusRequset.failure;
    }
    update();
  }

  @override
  removeDeliveryworker(String deliveryworkerId) {
    deliveryworkerData.remove(deliveryworkerId);
    data.removeWhere(
      (element) => element.deliveryworkersId.toString() == deliveryworkerId,
    );
    update();
  }

  @override
  goToEditPage(DeliveryworkerModel deliveryworkerModel) {
    Get.toNamed(
      AppRoutes.deliveryworkerEdit,
      arguments: {'deliveryworkerModel': deliveryworkerModel},
    );
  }

  @override
  void onInit() {
    getDeliveryworkers();
    super.onInit();
  }
}
