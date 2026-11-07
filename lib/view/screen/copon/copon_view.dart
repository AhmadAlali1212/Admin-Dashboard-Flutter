import 'package:adminapplication/core/constant/app_routes.dart';
import 'package:adminapplication/core/constant/color_constant.dart';
import 'package:adminapplication/controller/copon/copon_view_controller.dart';
import 'package:adminapplication/core/class/handlind_data_view.dart';
import 'package:adminapplication/view/widget/section/section_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoponView extends StatelessWidget {
  const CoponView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CoponViewController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Coupons',
          style: TextStyle(color: ColorConstant.whitePrimary),
        ),
        backgroundColor: ColorConstant.puplerDistinct,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.coponAdd),
        child: const Icon(Icons.add),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Get.offAllNamed(AppRoutes.home);
          return false;
        },
        child: GetBuilder<CoponViewController>(
          builder: (controller) => HandlindDataView(
            statusRequset: controller.statusRequset,
            widget: ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: controller.data.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final item = controller.data[index];
                return SectionCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.couponName ?? '',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 14),
                      SectionInfoRow(
                        label: 'Coupon name',
                        value: item.couponName ?? '-',
                      ),
                      SectionInfoRow(
                        label: 'Count',
                        value: item.couponCount?.toString() ?? '-',
                      ),
                      SectionInfoRow(
                        label: 'Discount',
                        value: item.couponDiscount?.toString() ?? '-',
                      ),
                      SectionInfoRow(
                        label: 'Expire date',
                        value: item.couponExpiredate ?? '-',
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: SectionActionButton(
                              label: 'Edit',
                              icon: Icons.edit_outlined,
                              onPressed: () => controller.goToEditPage(item),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: SectionActionButton(
                              label: 'Delete',
                              icon: Icons.delete_outline,
                              onPressed: () {
                                Get.defaultDialog(
                                  title: 'Warning',
                                  middleText: 'Delete this coupon?',
                                  cancel: ElevatedButton(
                                    onPressed: Get.back,
                                    child: const Text('Cancel'),
                                  ),
                                  confirm: ElevatedButton(
                                    onPressed: () {
                                      controller.removeCoupon(
                                        item.couponId.toString(),
                                      );
                                      Get.back();
                                    },
                                    child: const Text('Delete'),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
