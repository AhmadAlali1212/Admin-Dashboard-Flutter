import 'package:adminapplication/core/constant/app_routes.dart';
import 'package:adminapplication/core/constant/status_requset.dart';
import 'package:adminapplication/core/functions/handlingdatacontroller.dart';
import 'package:adminapplication/data/datasource/remote/auth/verification_code_data.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class AstractVerificationCodeController extends GetxController {
  verificationCode(String verificationCode) {}
}

class VerificationCodeController extends AstractVerificationCodeController {
  GlobalKey<FormState> fromState = GlobalKey<FormState>();
  String? email;

  StatusRequset statusRequset = StatusRequset.none;
  VerificationCodeData verificationCodeData = VerificationCodeData(Get.find());
  @override
  verificationCode(String verificationCode) async {
    statusRequset = StatusRequset.loading;
    update();
    var response = await verificationCodeData.postData(
      email!,
      verificationCode,
    );
    statusRequset = handdlingData(response);
    if (statusRequset == StatusRequset.success) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.home);
      } else {
        Get.defaultDialog(
          title: "Warning",

          middleText: "The Verification Code",
        );
      }
    } else {
      print("$statusRequset");
    }
    update();
  }

  resend() {
    print("kok");
    verificationCodeData.reSend(email!);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];

    super.onInit();
  }
}
