import 'package:adminapplication/controller/copon/copon_view_controller.dart';
import 'package:adminapplication/core/constant/app_routes.dart';
import 'package:adminapplication/core/constant/status_requset.dart';
import 'package:adminapplication/core/functions/handlingdatacontroller.dart';
import 'package:adminapplication/data/datasource/remote/copon_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CoponAddControllerAbstract extends GetxController {
  addCoupon();
}

class CoponAddController extends CoponAddControllerAbstract {
  final CoponData coponData = CoponData(Get.find());
  final GlobalKey<FormState> fromState = GlobalKey<FormState>();
  final TextEditingController couponName = TextEditingController();
  final TextEditingController couponCount = TextEditingController();
  final TextEditingController couponDiscount = TextEditingController();
  final TextEditingController couponExpiredate = TextEditingController();
  StatusRequset statusRequset = StatusRequset.none;

  @override
  addCoupon() async {
    final form = fromState.currentState;
    if (form != null && form.validate()) {
      statusRequset = StatusRequset.loading;
      update();
      final response = await coponData.add(
        couponName.text,
        couponCount.text,
        couponDiscount.text,
        couponExpiredate.text,
      );
      statusRequset = handdlingData(response);
      if (statusRequset == StatusRequset.success &&
          response['status'] == 'success') {
        Get.offNamed(AppRoutes.copon);
        Get.find<CoponViewController>().getCoupons();
      } else {
        statusRequset = StatusRequset.failure;
      }
      update();
    }
  }

  @override
  void onClose() {
    couponName.dispose();
    couponCount.dispose();
    couponDiscount.dispose();
    couponExpiredate.dispose();
    super.onClose();
  }
}
