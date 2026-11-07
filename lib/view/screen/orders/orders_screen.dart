import 'dart:io';

import 'package:adminapplication/controller/orders/orders_screen_controller.dart';
import 'package:adminapplication/core/constant/app_routes.dart';
import 'package:adminapplication/core/constant/color_constant.dart';
import 'package:adminapplication/view/widget/ordersScreen/materialButton_orders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersScreenController());
    return GetBuilder<OrdersScreenController>(
      builder: (controller) => Scaffold(
        backgroundColor: ColorConstant.whitePrimary,
        appBar: AppBar(title: Text("Orders")),
        bottomNavigationBar: BottomAppBar(
          height: 79,
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          color: const Color.fromARGB(255, 249, 248, 248),
          child: Row(
            children: [
              ...List.generate(controller.ordersPageList.length, ((index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: MaterialButtonHome(
                    onPressed: () {
                      controller.changedPage(index);
                    },
                    icon: controller.ordersScreenIcon[index],
                    text: controller.ordersScreenTitle[index],
                    active: controller.currentPage == index ? true : false,
                  ),
                );
              })),
            ],
          ),

          // Row(
          //   children: [
          //     MaterialButtonHome(
          //       onPressed: () {
          //         controller.changedPage(0);
          //       },
          //       icon: Icons.home,
          //       text: "Home",
          //       active: controller.currentPage == 0 ? true : false,
          //     ),
          //     MaterialButtonHome(
          //       onPressed: () {
          //         controller.changedPage(1);
          //       },
          //       icon: Icons.settings,
          //       text: "Settings",
          //       active: controller.currentPage == 1 ? true : false,
          //     ),
          //   ],
          // ),
          // Spacer(),
          // Row(
          //   children: [
          //     MaterialButtonHome(
          //       onPressed: () {
          //         controller.changedPage(2);
          //       },
          //       icon: Icons.favorite,
          //       text: "Favorite",
          //       active: controller.currentPage == 2 ? true : false,
          //     ),
          //     MaterialButtonHome(
          //       onPressed: () {
          //         controller.changedPage(3);
          //       },
          //       icon: Icons.person,
          //       text: "Person",
          //       active: controller.currentPage == 3 ? true : false,
          //     ),
          //   ],
          // ),
          //    ],
        ),
        body: WillPopScope(
          onWillPop: () async {
            Get.offAllNamed(AppRoutes.home);
            return false;
          },
          child: controller.ordersPageList.elementAt(controller.currentPage),
        ),
      ),
    );
  }
}
