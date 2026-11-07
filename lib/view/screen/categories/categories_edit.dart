import 'package:adminapplication/controller/categories/edit_categories_controller.dart';
import 'package:adminapplication/core/class/handlind_data_view.dart';
import 'package:adminapplication/core/constant/app_link.dart';
import 'package:adminapplication/core/constant/color_constant.dart';
import 'package:adminapplication/core/functions/validator_auth.dart';
import 'package:adminapplication/core/shared/custom_material_button__for_file_global.dart';
import 'package:adminapplication/core/shared/custom_material_button_global.dart';
import 'package:adminapplication/core/shared/custom_text_form_field_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CategoriesEdit extends StatelessWidget {
  const CategoriesEdit({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesEditController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Categories Edit",
          style: TextStyle(color: ColorConstant.whitePrimary),
        ),
        backgroundColor: ColorConstant.puplerDistinct,
      ),
      body: GetBuilder<CategoriesEditController>(
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
                    hint: "Enter Name The Categories(English)",
                    validator: (val) {
                      return validator(val!, 1, 50, "name");
                    },
                    isNumber: false,
                    mycontroller: controller.name,
                  ),
                  SizedBox(height: 14),
                  CustomTextFormFieldGlobal(
                    labelName: "NameAr",
                    iconData: Icons.person_outline,
                    hint: "Enter Name The Categories(Arbic)",
                    validator: (val) {
                      return validator(val!, 1, 50, "nameAr");
                    },
                    isNumber: false,
                    mycontroller: controller.nameAr,
                  ),
                  SizedBox(height: 14),
                  CustomMaterialButtonForFileGlobal(
                    onPressed: () {
                      controller.addImage();
                    },
                    text: "Edit categories image",
                  ),
                  controller.file != null
                      ? Container(child: SvgPicture.file(controller.file!))
                      : Container(
                          child: SvgPicture.network(
                            "${AppLink.categoriesImage}/${controller.categoriesModel!.categoriesImage}",
                          ),
                        ),

                  SizedBox(height: 25),

                  CustomMaterialButtonGlobal(
                    onPressed: () {
                      controller.editCategories();
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
