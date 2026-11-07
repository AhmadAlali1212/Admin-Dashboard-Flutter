import 'package:adminapplication/core/class/crud.dart';
import 'package:adminapplication/core/constant/app_link.dart';

class CoponData {
  final Crud crud;

  CoponData(this.crud);

  view() async {
    var response = await crud.postData(AppLink.coponView, {});
    return response.fold((l) => l, (r) => r);
  }

  add(String name, String count, String discount, String expireDate) async {
    var response = await crud.postData(AppLink.coponAdd, {
      'couponname': name,
      'couponcount': count,
      'coupondiscount': discount,
      'couponexpiredate': expireDate,
    });
    return response.fold((l) => l, (r) => r);
  }

  edit(
    String couponId,
    String name,
    String count,
    String discount,
    String expireDate,
  ) async {
    var response = await crud.postData(AppLink.coponEdit, {
      'couponid': couponId,
      'couponname': name,
      'couponcount': count,
      'coupondiscount': discount,
      'couponexpiredate': expireDate,
    });
    return response.fold((l) => l, (r) => r);
  }

  remove(String couponId) async {
    var response = await crud.postData(AppLink.coponRemove, {
      'couponid': couponId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
