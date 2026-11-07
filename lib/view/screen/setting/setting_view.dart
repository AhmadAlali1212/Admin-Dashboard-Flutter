import 'package:adminapplication/core/constant/app_routes.dart';
import 'package:adminapplication/core/constant/color_constant.dart';
import 'package:adminapplication/controller/setting/setting_view_controller.dart';
import 'package:adminapplication/core/class/handlind_data_view.dart';
import 'package:adminapplication/view/widget/section/section_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingViewController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(color: ColorConstant.whitePrimary),
        ),
        backgroundColor: ColorConstant.puplerDistinct,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.settingAdd),
        child: const Icon(Icons.add),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Get.offAllNamed(AppRoutes.home);
          return false;
        },
        child: GetBuilder<SettingViewController>(
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
                        'Setting ${item.settingId ?? ''}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 14),
                      SectionInfoRow(
                        label: 'Delivery price',
                        value: item.settingDeliveryPrice?.toString() ?? '-',
                      ),
                      SectionInfoRow(
                        label: 'Phone',
                        value: item.settingPhone ?? '-',
                      ),
                      SectionInfoRow(
                        label: 'Email',
                        value: item.settingEmail ?? '-',
                      ),
                      SectionInfoRow(
                        label: 'About',
                        value: item.settingAbout ?? '-',
                      ),
                      SectionInfoRow(
                        label: 'Currency',
                        value: item.settingCurrency ?? '-',
                      ),
                      SectionInfoRow(
                        label: 'About AR',
                        value: item.settingAboutAr ?? '-',
                      ),
                      SectionInfoRow(
                        label: 'Surprise title',
                        value: item.settingTitlessuriprise ?? '-',
                      ),
                      SectionInfoRow(
                        label: 'Surprise title AR',
                        value: item.settingTitlessuripriseAr ?? '-',
                      ),
                      SectionInfoRow(
                        label: 'Delivery time',
                        value: item.settingDeliverytime ?? '-',
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
                                  middleText: 'Delete this settings record?',
                                  cancel: ElevatedButton(
                                    onPressed: Get.back,
                                    child: const Text('Cancel'),
                                  ),
                                  confirm: ElevatedButton(
                                    onPressed: () {
                                      controller.removeSetting(
                                        item.settingId.toString(),
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
