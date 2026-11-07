import 'package:adminapplication/view/screen/orders/accepted.dart';
import 'package:adminapplication/view/screen/orders/archive.dart';
import 'package:adminapplication/view/screen/orders/pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrdersScreenControllerAbstract extends GetxController {
  changedPage(int i);
}

class OrdersScreenController extends OrdersScreenControllerAbstract {
  List<Widget> ordersPageList = [
    OrdersPending(),
    OrdersAccepted(),
    OrdersArchive(),
  ];
  List<IconData> ordersScreenIcon = [
    Icons.home,
    Icons.settings,
    Icons.archive_outlined,
  ];
  List<String> ordersScreenTitle = ["Pending", "Accepted", "Archive"];

  int currentPage = 0;
  @override
  changedPage(int i) {
    currentPage = i;
    update();
  }
}
