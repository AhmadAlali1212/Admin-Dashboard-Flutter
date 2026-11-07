import 'package:adminapplication/controller/copon/copon_view_controller.dart';
import 'package:adminapplication/core/constant/app_routes.dart';
import 'package:adminapplication/core/constant/status_requset.dart';
import 'package:adminapplication/core/functions/handlingdatacontroller.dart';
import 'package:adminapplication/data/datasource/remote/copon_data.dart';
import 'package:adminapplication/data/model/coupon_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CoponEditControllerAbstract extends GetxController {
  editCoupon();
}

class CoponEditController extends CoponEditControllerAbstract {
  final CoponData coponData = CoponData(Get.find());
  final GlobalKey<FormState> fromState = GlobalKey<FormState>();
  final TextEditingController couponName = TextEditingController();
  final TextEditingController couponCount = TextEditingController();
  final TextEditingController couponDiscount = TextEditingController();
  final TextEditingController couponExpiredate = TextEditingController();
  late CouponModel couponModel;
  StatusRequset statusRequset = StatusRequset.none;

  @override
  editCoupon() async {
    final form = fromState.currentState;
    if (form != null && form.validate()) {
      statusRequset = StatusRequset.loading;
      update();
      final response = await coponData.edit(
        couponModel.couponId.toString(),
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
  void onInit() {
    couponModel = Get.arguments['couponModel'];
    couponName.text = couponModel.couponName ?? '';
    couponCount.text = couponModel.couponCount.toString();
    couponDiscount.text = couponModel.couponDiscount.toString();
    couponExpiredate.text = couponModel.couponExpiredate ?? '';
    super.onInit();
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
