import 'package:adminapplication/controller/categories/view_categories_controller.dart'; // تأكد من اسم الكنترولر داخل الملف
import 'package:adminapplication/controller/items/view_items_controller.dart';
import 'package:adminapplication/core/class/handlind_data_view.dart';
import 'package:adminapplication/core/constant/app_link.dart';
import 'package:adminapplication/core/constant/app_routes.dart';
import 'package:adminapplication/core/constant/color_constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    // تم تصحيح القوسين وتغيير الاسم ليتوافق مع الفيديو
    ItemsViewController controller = Get.put(ItemsViewController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Items",
          style: TextStyle(color: ColorConstant.whitePrimary),
        ),
        backgroundColor: ColorConstant.puplerDistinct,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // التوجيه لصفحة الإضافة كما يظهر في كود الصورة
          Get.toNamed(AppRoutes.itemsAdd);
        },
        child: const Icon(Icons.add),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Get.offAllNamed(AppRoutes.home);
          return false;
        },
        child: GetBuilder<ItemsViewController>(
          builder: (controller) => HandlindDataView(
            statusRequset: controller.statusRequset,
            widget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                itemCount: controller.data.length, // جعل العدد ديناميكي
                itemBuilder: (context, index) => CustomItemsCard(
                  onPressedEdit: () {
                    controller.goToEditPage(controller.data[index]);
                  },
                  image:
                      "${AppLink.itemsImage}/${controller.data[index].itemsImage}",
                  title: "${controller.data[index].itemsName}",
                  date:
                      "${controller.data[index].itemsDesc}", // إضافة التاريخ الظاهر بالمحاكي
                  onRemove: () {
                    Get.defaultDialog(
                      title: "Warning",
                      middleText: "Are you sure of remove this items",
                      cancel: ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text("Cancel"),
                      ),
                      onConfirm: () {
                        controller.removeItems(
                          controller.data[index].itemsId.toString(),
                          controller.data[index].itemsImage.toString(),
                        );
                        Get.back();
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomItemsCard extends StatelessWidget {
  const CustomItemsCard({
    super.key,
    required this.image,
    required this.title,
    required this.date,
    required this.onPressedEdit,
    this.onRemove,
  });

  final String image;
  final String title;
  final String date;
  final void Function()? onPressedEdit;
  final void Function()? onRemove;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // عرض الصورة مع إعطائها مساحة محددة (Flex 2) كالموجود في كود الشاشة
            Expanded(
              flex: 2,
              child: CachedNetworkImage(height: 80, imageUrl: image),
            ),

            const SizedBox(width: 15),
            // عرض النصوص (الاسم والتاريخ) في المنتصف بشكل عمودي (Flex 3)
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ColorConstant.blackPrimary,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    date,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            // زر التعديل في أقصى اليمين
            Column(
              children: [
                IconButton(
                  onPressed: onPressedEdit,
                  icon: const Icon(Icons.edit, color: Colors.grey),
                ),
                const SizedBox(height: 5),
                IconButton(
                  onPressed: onRemove,
                  icon: const Icon(Icons.delete_outlined, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
