import 'package:adminapplication/core/constant/app_routes.dart';
import 'package:adminapplication/core/constant/color_constant.dart';
import 'package:adminapplication/view/widget/section/section_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryworkerRemove extends StatelessWidget {
  const DeliveryworkerRemove({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Delivery Worker Remove',
          style: TextStyle(color: ColorConstant.whitePrimary),
        ),
        backgroundColor: ColorConstant.puplerDistinct,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: SectionCard(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.warning_amber_rounded, size: 54),
                const SizedBox(height: 12),
                const Text(
                  'Delete this delivery worker?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'The worker record will be removed from the list.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[700], height: 1.4),
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: Get.back,
                        child: const Text('Cancel'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: SectionActionButton(
                        label: 'Delete',
                        icon: Icons.delete_outline,
                        onPressed: () =>
                            Get.offAllNamed(AppRoutes.deliveryworker),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
