

import 'package:adminapplication/core/class/crud.dart';
import 'package:adminapplication/core/constant/app_link.dart';

class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);
  getOrders() async {
    var respons = await crud.postData(AppLink.archive, {
    });
    return respons.fold((l) => l, (r) => r);
  }
}
