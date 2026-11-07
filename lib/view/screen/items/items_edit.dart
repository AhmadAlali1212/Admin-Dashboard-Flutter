import 'package:adminapplication/controller/items/edit_items_controller.dart';
import 'package:adminapplication/core/class/handlind_data_view.dart';
import 'package:adminapplication/core/constant/app_link.dart';
import 'package:adminapplication/core/constant/color_constant.dart';
import 'package:adminapplication/core/functions/validator_auth.dart';
import 'package:adminapplication/core/shared/custom_drop_down_satat.dart';
import 'package:adminapplication/core/shared/custom_material_button__for_file_global.dart';
import 'package:adminapplication/core/shared/custom_material_button_global.dart';
import 'package:adminapplication/core/shared/custom_text_form_field_global.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ItemsEdit extends StatelessWidget {
  const ItemsEdit({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsEditController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Items Edit",
          style: TextStyle(color: ColorConstant.whitePrimary),
        ),
        backgroundColor: ColorConstant.puplerDistinct,
      ),
      body: GetBuilder<ItemsEditController>(
        builder: (controller) => HandlindDataView(
          statusRequset: controller.statusRequset,
          widget: Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 13),
            child: Form(
              key: controller.fromState,
              child: ListView(
                children: [
                  SizedBox(height: 20),

                  CustomTextFormFieldGlobal(
                    labelName: "Name",
                    iconData: Icons.person_outline,
                    hint: "Enter Name The Items(English)",
                    validator: (val) {
                      return validator(val!, 1, 50, "name");
                    },
                    isNumber: false,
                    mycontroller: controller.name,
                  ),
                  SizedBox(height: 10),
                  CustomTextFormFieldGlobal(
                    labelName: "NameAr",
                    iconData: Icons.person_outline,
                    hint: "Enter Name The Items(Arbic)",
                    validator: (val) {
                      return validator(val!, 1, 50, "nameAr");
                    },
                    isNumber: false,
                    mycontroller: controller.nameAr,
                  ),
                  SizedBox(height: 10),

                  CustomTextFormFieldGlobal(
                    labelName: "Description",
                    iconData: Icons.person_outline,
                    hint: "Enter Description The Items(English)",
                    validator: (val) {
                      return validator(val!, 1, 200, "name");
                    },
                    isNumber: false,
                    mycontroller: controller.desc,
                  ),
                  SizedBox(height: 10),

                  CustomTextFormFieldGlobal(
                    labelName: "DescriptionAr",
                    iconData: Icons.person_outline,
                    hint: "Enter DescriptionAr The Items(Arabic)",
                    validator: (val) {
                      return validator(val!, 5, 200, "nameAr");
                    },
                    isNumber: false,
                    mycontroller: controller.descar,
                  ),
                  SizedBox(height: 10),

                  CustomTextFormFieldGlobal(
                    labelName: "Price",
                    iconData: Icons.attach_money,
                    hint: "Enter Price",
                    validator: (val) {
                      return validator(val!, 1, 50, "price");
                    },
                    isNumber: true,
                    mycontroller: controller.price,
                  ),
                  SizedBox(height: 10),

                  CustomTextFormFieldGlobal(
                    labelName: "Count",
                    iconData: Icons.numbers,
                    hint: "Enter Count",
                    validator: (val) {
                      return validator(val!, 1, 50, "count");
                    },
                    isNumber: true,
                    mycontroller: controller.count,
                  ),

                  SizedBox(height: 10),

                  CustomTextFormFieldGlobal(
                    labelName: "Discount",
                    iconData: Icons.discount,
                    hint: "Enter Discount",
                    validator: (val) {
                      return validator(val!, 1, 50, "discount");
                    },
                    isNumber: true,
                    mycontroller: controller.discount,
                  ),
                  SizedBox(height: 10),

                  controller.selectedListItem.isEmpty
                      ? SizedBox(
                          height: 50,
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : CustomDropDownSearch(
                          title: "Choose Category",
                          listData: controller.selectedListItem,
                          dropDownSelectedName: controller.cateName,
                          dropDownSelectedID: controller.cateid,
                        ),
                  SizedBox(height: 14),
                  CustomMaterialButtonForFileGlobal(
                    onPressed: () {
                      controller.showChooseImageOptions();
                    },
                    text: "Edit Items image",
                  ),
                  controller.file != null
                      ? Container(
                          child: Image.file(
                            controller.file!,
                            width: 80,
                            height: 80,
                          ),
                        )
                      : Container(
                          child: Image.network(
                            "${AppLink.itemsImage}/${controller.itemsModel!.itemsImage}",
                            width: 80,
                            height: 80,
                          ),
                        ),
                  SizedBox(height: 10),
                  RadioListTile<String>(
                    title: const Text("Active"),
                    value: "1",
                    groupValue: controller.isActive,
                    onChanged: controller.changeActive,
                  ),
                  const SizedBox(height: 5),
                  RadioListTile<String>(
                    title: const Text("hidden"),
                    value: "0",
                    groupValue: controller.isActive,
                    onChanged: controller.changeActive,
                  ),
                  SizedBox(height: 25),

                  CustomMaterialButtonGlobal(
                    onPressed: () {
                      controller.editItems();
                    },
                    text: "Edit",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
