import 'package:adminapplication/core/class/crud.dart';
import 'package:adminapplication/core/constant/app_link.dart';

class SettingData {
  final Crud crud;

  SettingData(this.crud);

  view() async {
    var response = await crud.postData(AppLink.settingView, {});
    return response.fold((l) => l, (r) => r);
  }

  add(
    String deliveryPrice,
    String phone,
    String email,
    String about,
    String currency,
    String aboutAr,
    String titleSurprise,
    String titleSurpriseAr,
    String deliveryTime,
  ) async {
    var response = await crud.postData(AppLink.settingAdd, {
      'deliveryprice': deliveryPrice,
      'phone': phone,
      'email': email,
      'about': about,
      'currency': currency,
      'aboutar': aboutAr,
      'titlesuriprise': titleSurprise,
      'titlesuriprisear': titleSurpriseAr,
      'deliverytime': deliveryTime,
    });
    return response.fold((l) => l, (r) => r);
  }

  edit(
    String settingId,
    String deliveryPrice,
    String phone,
    String email,
    String about,
    String currency,
    String aboutAr,
    String titleSurprise,
    String titleSurpriseAr,
    String deliveryTime,
  ) async {
    var response = await crud.postData(AppLink.settingEdit, {
      'settingid': settingId,
      'deliveryprice': deliveryPrice,
      'phone': phone,
      'email': email,
      'about': about,
      'currency': currency,
      'aboutar': aboutAr,
      'titlesuriprise': titleSurprise,
      'titlesuriprisear': titleSurpriseAr,
      'deliverytime': deliveryTime,
    });
    return response.fold((l) => l, (r) => r);
  }

  remove(String settingId) async {
    var response = await crud.postData(AppLink.settingRemove, {
      'settingid': settingId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
