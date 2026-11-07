import 'package:adminapplication/controller/setting/setting_view_controller.dart';
import 'package:adminapplication/core/constant/app_routes.dart';
import 'package:adminapplication/core/constant/status_requset.dart';
import 'package:adminapplication/core/functions/handlingdatacontroller.dart';
import 'package:adminapplication/data/datasource/remote/setting_data.dart';
import 'package:adminapplication/data/model/setting_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SettingEditControllerAbstract extends GetxController {
  editSetting();
}

class SettingEditController extends SettingEditControllerAbstract {
  final SettingData settingData = SettingData(Get.find());
  final GlobalKey<FormState> fromState = GlobalKey<FormState>();
  final TextEditingController deliveryPrice = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController about = TextEditingController();
  final TextEditingController currency = TextEditingController();
  final TextEditingController aboutAr = TextEditingController();
  final TextEditingController titleSurprise = TextEditingController();
  final TextEditingController titleSurpriseAr = TextEditingController();
  final TextEditingController deliveryTime = TextEditingController();
  late SettingModel settingModel;
  StatusRequset statusRequset = StatusRequset.none;

  @override
  editSetting() async {
    final form = fromState.currentState;
    if (form != null && form.validate()) {
      statusRequset = StatusRequset.loading;
      update();
      final response = await settingData.edit(
        settingModel.settingId.toString(),
        deliveryPrice.text,
        phone.text,
        email.text,
        about.text,
        currency.text,
        aboutAr.text,
        titleSurprise.text,
        titleSurpriseAr.text,
        deliveryTime.text,
      );
      statusRequset = handdlingData(response);
      if (statusRequset == StatusRequset.success &&
          response['status'] == 'success') {
        Get.offNamed(AppRoutes.setting);
        Get.find<SettingViewController>().getSettings();
      } else {
        statusRequset = StatusRequset.failure;
      }
      update();
    }
  }

  @override
  void onInit() {
    settingModel = Get.arguments['settingModel'];
    deliveryPrice.text = settingModel.settingDeliveryPrice?.toString() ?? '';
    phone.text = settingModel.settingPhone ?? '';
    email.text = settingModel.settingEmail ?? '';
    about.text = settingModel.settingAbout ?? '';
    currency.text = settingModel.settingCurrency ?? '';
    aboutAr.text = settingModel.settingAboutAr ?? '';
    titleSurprise.text = settingModel.settingTitlessuriprise ?? '';
    titleSurpriseAr.text = settingModel.settingTitlessuripriseAr ?? '';
    deliveryTime.text = settingModel.settingDeliverytime ?? '';
    super.onInit();
  }

  @override
  void onClose() {
    deliveryPrice.dispose();
    phone.dispose();
    email.dispose();
    about.dispose();
    currency.dispose();
    aboutAr.dispose();
    titleSurprise.dispose();
    titleSurpriseAr.dispose();
    deliveryTime.dispose();
    super.onClose();
  }
}
