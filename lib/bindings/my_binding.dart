import 'package:adminapplication/controller/auth/login_controller.dart';
import 'package:adminapplication/controller/auth/verificationCode_controller.dart';
import 'package:adminapplication/controller/categories/add_categories_controller.dart';
import 'package:adminapplication/controller/categories/edit_categories_controller.dart';
import 'package:adminapplication/controller/categories/view_categories_controller.dart';
import 'package:adminapplication/controller/items/add_items_controller.dart';
import 'package:adminapplication/controller/items/edit_items_controller.dart';
import 'package:adminapplication/controller/items/view_items_controller.dart';
import 'package:adminapplication/controller/orders/order_details_controller.dart';
import 'package:adminapplication/controller/orders/orders_accepted_controller.dart';
import 'package:adminapplication/controller/orders/orders_pending_controller.dart';
import 'package:adminapplication/controller/orders/orders_screen_controller.dart';
import 'package:adminapplication/core/class/crud.dart';
import 'package:adminapplication/core/services/service.dart';
import 'package:get/get.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(), fenix: true);

    Get.lazyPut(() => OrdersScreenController(), fenix: true);
    Get.lazyPut(() => VerificationCodeController(), fenix: true);

    Get.lazyPut(() => OrdersPendingController(), fenix: true);
    Get.lazyPut(() => OrdersPendingController(), fenix: true);
    Get.lazyPut(() => OrdersAcceptedController(), fenix: true);
    Get.lazyPut(() => OrderDetailsController(), fenix: true);
    Get.lazyPut(() => OrdersScreenController(), fenix: true);
    Get.lazyPut(() => CategoriesViewController(), fenix: true);
    Get.lazyPut(() => CategoriesAddController(), fenix: true);
    Get.lazyPut(() => CategoriesEditController(), fenix: true);
    Get.lazyPut(() => ItemsEditController(), fenix: true);
    Get.lazyPut(() => ItemsAddController(), fenix: true);
    Get.lazyPut(() => ItemsViewController(), fenix: true);
    Get.lazyPut(() => MyService(), fenix: true);

    //  Get.put(() => TestController());
    Get.lazyPut(() => Crud(), fenix: true);
  }
}
