
import 'package:adminapplication/core/class/crud.dart';
import 'package:adminapplication/core/constant/app_link.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);
  getOrders() async {
    var respons = await crud.postData(AppLink.ordersPending, {});
    return respons.fold((l) => l, (r) => r);
  }

  ordersApprove( String userid, String orderid) async {
    var respons = await crud.postData(AppLink.approve, {
      "userid": userid,
      "orderid": orderid,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
