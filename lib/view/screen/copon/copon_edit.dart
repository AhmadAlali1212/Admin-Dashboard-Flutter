import 'package:adminapplication/core/constant/color_constant.dart';
import 'package:adminapplication/controller/copon/copon_edit_controller.dart';
import 'package:adminapplication/core/class/handlind_data_view.dart';
import 'package:adminapplication/core/shared/custom_text_form_field_global.dart';
import 'package:adminapplication/view/widget/section/section_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoponEdit extends StatelessWidget {
  const CoponEdit({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CoponEditController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Coupon Edit',
          style: TextStyle(color: ColorConstant.whitePrimary),
        ),
        backgroundColor: ColorConstant.puplerDistinct,
      ),
      body: GetBuilder<CoponEditController>(
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
                        'Update coupon',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      CustomTextFormFieldGlobal(
                        labelName: 'Coupon name',
                        iconData: Icons.local_offer_outlined,
                        hint: 'Enter coupon name',
                        validator: (val) => val == null || val.isEmpty
                            ? 'Value cannot be empty'
                            : null,
                        isNumber: false,
                        mycontroller: controller.couponName,
                      ),
                      const SizedBox(height: 12),
                      CustomTextFormFieldGlobal(
                        labelName: 'Coupon count',
                        iconData: Icons.numbers,
                        hint: 'Enter count',
                        validator: (val) => val == null || val.isEmpty
                            ? 'Value cannot be empty'
                            : null,
                        isNumber: true,
                        mycontroller: controller.couponCount,
                      ),
                      const SizedBox(height: 12),
                      CustomTextFormFieldGlobal(
                        labelName: 'Coupon discount',
                        iconData: Icons.discount_outlined,
                        hint: 'Enter discount',
                        validator: (val) => val == null || val.isEmpty
                            ? 'Value cannot be empty'
                            : null,
                        isNumber: true,
                        mycontroller: controller.couponDiscount,
                      ),
                      const SizedBox(height: 12),
                      CustomTextFormFieldGlobal(
                        labelName: 'Expire date',
                        iconData: Icons.date_range_outlined,
                        hint: 'YYYY-MM-DD',
                        validator: (val) => val == null || val.isEmpty
                            ? 'Value cannot be empty'
                            : null,
                        isNumber: false,
                        mycontroller: controller.couponExpiredate,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                SectionActionButton(
                  label: 'Update coupon',
                  onPressed: controller.editCoupon,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
