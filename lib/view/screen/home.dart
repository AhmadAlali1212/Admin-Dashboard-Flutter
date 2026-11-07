import 'package:adminapplication/core/constant/app_routes.dart';
import 'package:adminapplication/core/constant/color_constant.dart';
import 'package:adminapplication/core/constant/image_assest.dart';
import 'package:adminapplication/view/widget/home/custom_card_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // تخصيص الـ AppBar ليطابق اللون البرتقالي/الأحمر في الصورة
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor:
            ColorConstant.puplerDistinct, // اللون التقريبي من الصورة
        elevation: 0,
      ),
      backgroundColor:
          Colors.grey[100], // خلفية خفيفة للتطبيق ليبرز الكارت الأبيض
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: ListView(
          children: [
            GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 3 أعمدة
                mainAxisSpacing: 12, // مسافة عمودية بين الكروت
                crossAxisSpacing: 12, // مسافة أفقية بين الكروت
                childAspectRatio:
                    0.85, // لجعل الكارت مستطيل طولي قليلاً ليناسب الأيقونة والنص
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                // تأكد من ربط كل متغير في ImageAssest بالصورة الصحيحة له
                CustomCardHome(
                  onTap: () {
                    Get.toNamed(AppRoutes.categories);
                  },
                  image: ImageAssest.categories,
                  title: "Categories",
                ),
                CustomCardHome(
                  onTap: () {
                    Get.toNamed(AppRoutes.items);
                  },
                  image: ImageAssest.items,
                  title: "Items",
                ),
                CustomCardHome(
                  onTap: () {},
                  image: ImageAssest.users,
                  title: "Users",
                ),
                CustomCardHome(
                  onTap: () {
                    Get.toNamed(AppRoutes.ordersScreen);
                  },
                  image: ImageAssest.orders,
                  title: "Orders",
                ),
                CustomCardHome(
                  onTap: () {
                    Get.toNamed(AppRoutes.copon);
                  },
                  icon: Icons.local_offer_outlined,
                  title: "Coupons",
                ),
                CustomCardHome(
                  onTap: () {
                    Get.toNamed(AppRoutes.deliveryworker);
                  },
                  icon: Icons.delivery_dining_outlined,
                  title: "Delivery Workers",
                ),
                CustomCardHome(
                  onTap: () {
                    Get.toNamed(AppRoutes.setting);
                  },
                  icon: Icons.settings_outlined,
                  title: "Settings",
                ),
                CustomCardHome(
                  onTap: () {},
                  image: ImageAssest.notifications,
                  title: "Notifications",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
