import 'dart:async';
import 'package:adminapplication/core/constant/status_requset.dart';
import 'package:adminapplication/core/functions/handlingdatacontroller.dart';
import 'package:adminapplication/core/services/service.dart';
import 'package:adminapplication/data/datasource/remote/orders/order_details_data.dart';
import 'package:adminapplication/data/datasource/static/model/orders_details_model.dart';
import 'package:adminapplication/data/datasource/static/model/orders_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class OrderDetailsControllerAbstract extends GetxController {
  intailData();
  getOrderDetails();
}

class OrderDetailsController extends OrderDetailsControllerAbstract {
  late OrdersModel ordersModel;
  OrderDetailsData orderDetailsData = OrderDetailsData(Get.find());
  MyService myService = Get.find();

  StatusRequset statusRequset = StatusRequset.loading;
  Position? position;
  late Completer<GoogleMapController> completerController;
  CameraPosition? kGooglePlex;
  List<Marker> markers = [];
  List<OrdersDetailsModel> data = [];

  @override
  intailData() {
    completerController = Completer<GoogleMapController>();
    if (ordersModel.ordersType == 0) {
      kGooglePlex = CameraPosition(
        target: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
        zoom: 18.4746,
      );
      markers.add(
        Marker(
          markerId: MarkerId("1"),
          position: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
        ),
      );
    }
  }

  @override
  void onInit() {
    ordersModel = Get.arguments["orderModeslList"];
    intailData();
    getOrderDetails();
    super.onInit();
  }

  @override
  getOrderDetails() async {
    try {
      statusRequset = StatusRequset.loading;
      update();

      var response = await orderDetailsData.getOrders(
        ordersModel.ordersId.toString(),
      );

      print("============== RESPONSE ==============");
      print(response);

      statusRequset = handdlingData(response);

      print(statusRequset);

      if (statusRequset == StatusRequset.success) {
        if (response["status"] == "success") {
          data.clear();
          List dataList = response['data'];
          data.addAll(dataList.map((e) => OrdersDetailsModel.fromJson(e)));
        }
      }
    } catch (e) {
      print("============== ERROR ==============");
      print(e);
    }

    update();
  }
}
