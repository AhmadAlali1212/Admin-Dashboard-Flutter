import 'package:adminapplication/core/constant/status_requset.dart';
import 'package:adminapplication/core/functions/handlingdatacontroller.dart';
import 'package:adminapplication/core/services/service.dart';
import 'package:adminapplication/data/datasource/remote/orders/orders_accepted_data.dart';
import 'package:adminapplication/data/datasource/static/model/orders_model.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class OrdersAcceptedControllerAbstract extends GetxController {
  printPaymentMethod(String val);
  printDeliveryType(String val);
  printOrderStatus(String val);
  donePrepare(String orderid, String userid, String ordertype);

  getOrders();
}

class OrdersAcceptedController extends OrdersAcceptedControllerAbstract {
  MyService myService = Get.find();
  List<OrdersModel> data = [];
  StatusRequset statusRequset = StatusRequset.none;
  OrdersAcceptedData ordersAcceptedData = OrdersAcceptedData(Get.find());
  @override
  printDeliveryType(val) {
    if (val == '0') {
      return "Delivery";
    } else {
      return "Recive";
    }
  }

  @override
  printPaymentMethod(val) {
    if (val == '0') {
      return "Cach On Delivery";
    } else {
      return "Payment Card";
    }
  }

  @override
  printOrderStatus(val) {
    if (val == '0') {
      return "Pending Approval";
    } else if (val == '1') {
      return "The Order is being Prepared";
    } else if (val == '2') {
      return "Ready To Picked up by Delivery man";
    } else if (val == '3') {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  @override
  getOrders() async {
    statusRequset = StatusRequset.loading;
    update();
    data.clear();

    var response = await ordersAcceptedData.getOrders();

    print(response);
    statusRequset = handdlingData(response);
    if (statusRequset == StatusRequset.success) {
      if (response["status"] == "success") {
        List dataList = response['data'];
        data.addAll(dataList.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequset = StatusRequset.failure;
      }
    } else {
      statusRequset = StatusRequset.failure;
    }

    update();
  }

  @override
  donePrepare(orderid, userid, ordertype) async {
    statusRequset = StatusRequset.loading;
    update();
    var response = await ordersAcceptedData.donePrepare(
      orderid,
      userid,
      ordertype,
    );
    print(response);
    statusRequset = handdlingData(response);
    if (statusRequset == StatusRequset.success) {
      if (response["status"] == "success") {
        refreshOrderStatus();
      } else {
        statusRequset = StatusRequset.failure;
      }
    } else {
      statusRequset = StatusRequset.failure;
    }

    update();
  }

  refreshOrderStatus() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
