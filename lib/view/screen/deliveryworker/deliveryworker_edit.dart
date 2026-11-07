import 'package:adminapplication/core/constant/color_constant.dart';
import 'package:adminapplication/controller/deliveryworker/deliveryworker_edit_controller.dart';
import 'package:adminapplication/core/class/handlind_data_view.dart';
import 'package:adminapplication/core/shared/custom_text_form_field_global.dart';
import 'package:adminapplication/view/widget/section/section_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryworkerEdit extends StatelessWidget {
  const DeliveryworkerEdit({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DeliveryworkerEditController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Delivery Worker Edit',
          style: TextStyle(color: ColorConstant.whitePrimary),
        ),
        backgroundColor: ColorConstant.puplerDistinct,
      ),
      body: GetBuilder<DeliveryworkerEditController>(
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
                        'Edit worker data',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      CustomTextFormFieldGlobal(
                        labelName: 'Name',
                        iconData: Icons.person_outline,
                        hint: 'Enter worker name',
                        validator: (val) => val == null || val.isEmpty
                            ? 'Value cannot be empty'
                            : null,
                        isNumber: false,
                        mycontroller: controller.name,
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
                        labelName: 'Password',
                        iconData: Icons.lock_outline,
                        hint: 'Enter password',
                        validator: (val) => val == null || val.isEmpty
                            ? 'Value cannot be empty'
                            : null,
                        isNumber: false,
                        obscureText: true,
                        mycontroller: controller.password,
                      ),
                      const SizedBox(height: 12),
                      CustomTextFormFieldGlobal(
                        labelName: 'Verify code',
                        iconData: Icons.verified_outlined,
                        hint: 'Enter verify code',
                        validator: (val) => val == null || val.isEmpty
                            ? 'Value cannot be empty'
                            : null,
                        isNumber: true,
                        mycontroller: controller.verifyCode,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                SectionActionButton(
                  label: 'Update worker',
                  onPressed: controller.editDeliveryworker,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
