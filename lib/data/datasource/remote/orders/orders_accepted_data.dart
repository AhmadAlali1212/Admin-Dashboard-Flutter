import 'package:adminapplication/core/class/crud.dart';
import 'package:adminapplication/core/constant/app_link.dart';

class OrdersAcceptedData {
  Crud crud;
  OrdersAcceptedData(this.crud);
  getOrders() async {
    var respons = await crud.postData(AppLink.ordersPending, {});
    return respons.fold((l) => l, (r) => r);
  }

  donePrepare(String orderid, String userid, String orderType) async {
    var respons = await crud.postData(AppLink.prepare, {
      "userid": userid,
      "orderid": orderid,
      "ordertype": orderType,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
