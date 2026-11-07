import 'package:adminapplication/core/constant/app_routes.dart';
import 'package:adminapplication/core/constant/status_requset.dart';
import 'package:adminapplication/core/functions/handlingdatacontroller.dart';
import 'package:adminapplication/data/datasource/remote/copon_data.dart';
import 'package:adminapplication/data/model/coupon_model.dart';
import 'package:get/get.dart';

abstract class CoponViewControllerAbstract extends GetxController {
  getCoupons();
  removeCoupon(String couponId);
  goToEditPage(CouponModel couponModel);
}

class CoponViewController extends CoponViewControllerAbstract {
  final CoponData coponData = CoponData(Get.find());
  final List<CouponModel> data = [];
  StatusRequset statusRequset = StatusRequset.none;

  @override
  getCoupons() async {
    data.clear();
    statusRequset = StatusRequset.loading;
    update();
    final response = await coponData.view();
    statusRequset = handdlingData(response);
    if (statusRequset == StatusRequset.success) {
      if (response['status'] == 'success') {
        final dataList = response['data'] as List;
        data.addAll(dataList.map((e) => CouponModel.fromJson(e)));
      } else {
        statusRequset = StatusRequset.failure;
      }
    } else {
      statusRequset = StatusRequset.failure;
    }
    update();
  }

  @override
  removeCoupon(String couponId) {
    coponData.remove(couponId);
    data.removeWhere((element) => element.couponId.toString() == couponId);
    update();
  }

  @override
  goToEditPage(CouponModel couponModel) {
    Get.toNamed(AppRoutes.coponEdit, arguments: {'couponModel': couponModel});
  }

  @override
  void onInit() {
    getCoupons();
    super.onInit();
  }
}
