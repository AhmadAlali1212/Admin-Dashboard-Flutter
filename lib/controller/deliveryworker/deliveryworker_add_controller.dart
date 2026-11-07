import 'package:adminapplication/controller/deliveryworker/deliveryworker_view_controller.dart';
import 'package:adminapplication/core/constant/app_routes.dart';
import 'package:adminapplication/core/constant/status_requset.dart';
import 'package:adminapplication/core/functions/handlingdatacontroller.dart';
import 'package:adminapplication/data/datasource/remote/deliveryworker_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class DeliveryworkerAddControllerAbstract extends GetxController {
  addDeliveryworker();
}

class DeliveryworkerAddController extends DeliveryworkerAddControllerAbstract {
  final DeliveryworkerData deliveryworkerData = DeliveryworkerData(Get.find());
  final GlobalKey<FormState> fromState = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController verifyCode = TextEditingController();
  final TextEditingController approve = TextEditingController(text: '1');
  StatusRequset statusRequset = StatusRequset.none;

  @override
  addDeliveryworker() async {
    final form = fromState.currentState;
    if (form != null && form.validate()) {
      statusRequset = StatusRequset.loading;
      update();
      final response = await deliveryworkerData.add(
        name.text,
        email.text,
        phone.text,
        password.text,
        verifyCode.text,
        approve.text,
      );
      statusRequset = handdlingData(response);
      if (statusRequset == StatusRequset.success &&
          response['status'] == 'success') {
        Get.offNamed(AppRoutes.deliveryworker);
        Get.find<DeliveryworkerViewController>().getDeliveryworkers();
      } else {
        statusRequset = StatusRequset.failure;
      }
      update();
    }
  }

  @override
  void onClose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    verifyCode.dispose();
    approve.dispose();
    super.onClose();
  }
}
