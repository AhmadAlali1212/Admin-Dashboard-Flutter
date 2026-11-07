import 'package:adminapplication/core/constant/app_routes.dart';
import 'package:adminapplication/core/middleware/my_middle_ware.dart';
import 'package:adminapplication/view/screen/copon/copon_add.dart';
import 'package:adminapplication/view/screen/copon/copon_edit.dart';
import 'package:adminapplication/view/screen/copon/copon_remove.dart';
import 'package:adminapplication/view/screen/copon/copon_view.dart';
import 'package:adminapplication/view/screen/deliveryworker/deliveryworker_add.dart';
import 'package:adminapplication/view/screen/deliveryworker/deliveryworker_edit.dart';
import 'package:adminapplication/view/screen/deliveryworker/deliveryworker_remove.dart';
import 'package:adminapplication/view/screen/deliveryworker/deliveryworker_view.dart';
import 'package:adminapplication/view/screen/orders/orders_screen.dart';
import 'package:adminapplication/view/screen/auth/login.dart';
import 'package:adminapplication/view/screen/auth/verificationCode.dart';
import 'package:adminapplication/view/screen/categories/categories_add.dart';
import 'package:adminapplication/view/screen/categories/categories_edit.dart';
import 'package:adminapplication/view/screen/categories/categories_view.dart';
import 'package:adminapplication/view/screen/home.dart';
import 'package:adminapplication/view/screen/items/items_add.dart';
import 'package:adminapplication/view/screen/items/items_edit.dart';
import 'package:adminapplication/view/screen/items/items_view.dart';
import 'package:adminapplication/view/screen/setting/setting_add.dart';
import 'package:adminapplication/view/screen/setting/setting_edit.dart';
import 'package:adminapplication/view/screen/setting/setting_remove.dart';
import 'package:adminapplication/view/screen/setting/setting_view.dart';
import 'package:adminapplication/view/screen/orders/accepted.dart';
import 'package:adminapplication/view/screen/orders/archive.dart';
import 'package:adminapplication/view/screen/orders/order_details.dart';
import 'package:adminapplication/view/screen/orders/pending.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? route = [
  GetPage(name: "/", page: () => Login(), middlewares: [MyMiddleWare()]),
  // GetPage(name: "/", page: () => TestView()),
  GetPage(name: AppRoutes.login, page: () => Login()),
  GetPage(name: AppRoutes.home, page: () => Home()),

  GetPage(name: AppRoutes.ordersScreen, page: () => OrdersScreen()),
  GetPage(name: AppRoutes.orderDetails, page: () => OrderDetails()),
  GetPage(name: AppRoutes.orderAccepted, page: () => OrdersAccepted()),
  GetPage(name: AppRoutes.archive, page: () => OrdersArchive()),
  GetPage(name: AppRoutes.ordersPending, page: () => OrdersPending()),

  GetPage(name: AppRoutes.verificationCode, page: () => Verificationcode()),
  GetPage(name: AppRoutes.categories, page: () => CategoriesView()),
  GetPage(name: AppRoutes.categoriesAdd, page: () => CategoriesAdd()),
  GetPage(name: AppRoutes.categoriesEdit, page: () => CategoriesEdit()),
  GetPage(name: AppRoutes.items, page: () => ItemsView()),
  GetPage(name: AppRoutes.itemsAdd, page: () => ItemsAdd()),
  GetPage(name: AppRoutes.itemsEdit, page: () => ItemsEdit()),
  GetPage(name: AppRoutes.copon, page: () => CoponView()),
  GetPage(name: AppRoutes.coponAdd, page: () => CoponAdd()),
  GetPage(name: AppRoutes.coponEdit, page: () => CoponEdit()),
  GetPage(name: AppRoutes.coponRemove, page: () => CoponRemove()),
  GetPage(name: AppRoutes.deliveryworker, page: () => DeliveryworkerView()),
  GetPage(name: AppRoutes.deliveryworkerAdd, page: () => DeliveryworkerAdd()),
  GetPage(name: AppRoutes.deliveryworkerEdit, page: () => DeliveryworkerEdit()),
  GetPage(
    name: AppRoutes.deliveryworkerRemove,
    page: () => DeliveryworkerRemove(),
  ),
  GetPage(name: AppRoutes.setting, page: () => SettingView()),
  GetPage(name: AppRoutes.settingAdd, page: () => SettingAdd()),
  GetPage(name: AppRoutes.settingEdit, page: () => SettingEdit()),
  GetPage(name: AppRoutes.settingRemove, page: () => SettingRemove()),
];
