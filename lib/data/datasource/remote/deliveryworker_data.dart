import 'package:adminapplication/core/class/crud.dart';
import 'package:adminapplication/core/constant/app_link.dart';

class DeliveryworkerData {
  final Crud crud;

  DeliveryworkerData(this.crud);

  view() async {
    var response = await crud.postData(AppLink.deliveryworkerView, {});
    return response.fold((l) => l, (r) => r);
  }

  add(
    String name,
    String email,
    String phone,
    String password,
    String verifyCode,
    String approve,
  ) async {
    var response = await crud.postData(AppLink.deliveryworkerAdd, {
      'deliveryworkername': name,
      'email': email,
      'phone': phone,
      'password': password,
      'verifycode': verifyCode,
      'approve': approve,
    });
    return response.fold((l) => l, (r) => r);
  }

  edit(
    String deliveryworkerId,
    String name,
    String email,
    String phone,
    String password,
    String verifyCode,
    String approve,
  ) async {
    var response = await crud.postData(AppLink.deliveryworkerEdit, {
      'deliveryworkerid': deliveryworkerId,
      'deliveryworkername': name,
      'email': email,
      'phone': phone,
      'password': password,
      'verifycode': verifyCode,
      'approve': approve,
    });
    return response.fold((l) => l, (r) => r);
  }

  remove(String deliveryworkerId) async {
    var response = await crud.postData(AppLink.deliveryworkerRemove, {
      'deliveryworkerid': deliveryworkerId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
