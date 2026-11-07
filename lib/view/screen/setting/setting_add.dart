import 'package:adminapplication/core/constant/color_constant.dart';
import 'package:adminapplication/controller/setting/setting_add_controller.dart';
import 'package:adminapplication/core/class/handlind_data_view.dart';
import 'package:adminapplication/core/shared/custom_text_form_field_global.dart';
import 'package:adminapplication/view/widget/section/section_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingAdd extends StatelessWidget {
  const SettingAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingAddController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Setting Add',
          style: TextStyle(color: ColorConstant.whitePrimary),
        ),
        backgroundColor: ColorConstant.puplerDistinct,
      ),
      body: GetBuilder<SettingAddController>(
        builder: (controller) => HandlindDataView(
          statusRequset: controller.statusRequset,
          widget: Form(
            key: controller.fromState,
            child: ListView(
              padding: const EdgeInsets.all(14),
              children: [
                SectionCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Store settings',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      CustomTextFormFieldGlobal(
                        labelName: 'Delivery price',
                        iconData: Icons.delivery_dining_outlined,
                        hint: 'Enter delivery price',
                        validator: (val) => val == null || val.isEmpty
                            ? 'Value cannot be empty'
                            : null,
                        isNumber: true,
                        mycontroller: controller.deliveryPrice,
                      ),
                      const SizedBox(height: 12),
                      CustomTextFormFieldGlobal(
                        labelName: 'Phone',
                        iconData: Icons.phone_outlined,
                        hint: 'Enter phone',
                        validator: (val) => val == null || val.isEmpty
                            ? 'Value cannot be empty'
                            : null,
                        isNumber: false,
                        mycontroller: controller.phone,
                      ),
                      const SizedBox(height: 12),
                      CustomTextFormFieldGlobal(
                        labelName: 'Email',
                        iconData: Icons.email_outlined,
                        hint: 'Enter email',
                        validator: (val) => val == null || val.isEmpty
                            ? 'Value cannot be empty'
                            : null,
                        isNumber: false,
                        mycontroller: controller.email,
                      ),
                      const SizedBox(height: 12),
                      CustomTextFormFieldGlobal(
                        labelName: 'About',
                        iconData: Icons.info_outline,
                        hint: 'Enter about text',
                        validator: (val) => val == null || val.isEmpty
                            ? 'Value cannot be empty'
                            : null,
                        isNumber: false,
                        mycontroller: controller.about,
                      ),
                      const SizedBox(height: 12),
                      CustomTextFormFieldGlobal(
                        labelName: 'Currency',
                        iconData: Icons.payments_outlined,
                        hint: 'Enter currency',
                        validator: (val) => val == null || val.isEmpty
                            ? 'Value cannot be empty'
                            : null,
                        isNumber: false,
                        mycontroller: controller.currency,
                      ),
                      const SizedBox(height: 12),
                      CustomTextFormFieldGlobal(
                        labelName: 'About AR',
                        iconData: Icons.info_outline,
                        hint: 'Enter Arabic about text',
                        validator: (val) => val == null || val.isEmpty
                            ? 'Value cannot be empty'
                            : null,
                        isNumber: false,
                        mycontroller: controller.aboutAr,
                      ),
                      const SizedBox(height: 12),
                      CustomTextFormFieldGlobal(
                        labelName: 'Surprise title',
                        iconData: Icons.star_outline,
                        hint: 'Enter surprise title',
                        validator: (val) => val == null || val.isEmpty
                            ? 'Value cannot be empty'
                            : null,
                        isNumber: false,
                        mycontroller: controller.titleSurprise,
                      ),
                      const SizedBox(height: 12),
                      CustomTextFormFieldGlobal(
                        labelName: 'Surprise title AR',
                        iconData: Icons.star_outline,
                        hint: 'Enter Arabic title',
                        validator: (val) => val == null || val.isEmpty
                            ? 'Value cannot be empty'
                            : null,
                        isNumber: false,
                        mycontroller: controller.titleSurpriseAr,
                      ),
                      const SizedBox(height: 12),
                      CustomTextFormFieldGlobal(
                        labelName: 'Delivery time',
                        iconData: Icons.schedule_outlined,
                        hint: 'Enter delivery time',
                        validator: (val) => val == null || val.isEmpty
                            ? 'Value cannot be empty'
                            : null,
                        isNumber: false,
                        mycontroller: controller.deliveryTime,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                SectionActionButton(
                  label: 'Save settings',
                  onPressed: controller.addSetting,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
