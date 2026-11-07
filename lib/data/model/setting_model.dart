class SettingModel {
  int? settingId;
  int? settingDeliveryPrice;
  String? settingPhone;
  String? settingEmail;
  String? settingAbout;
  String? settingCurrency;
  String? settingAboutAr;
  String? settingTitlessuriprise;
  String? settingTitlessuripriseAr;
  String? settingDeliverytime;

  SettingModel({
    this.settingId,
    this.settingDeliveryPrice,
    this.settingPhone,
    this.settingEmail,
    this.settingAbout,
    this.settingCurrency,
    this.settingAboutAr,
    this.settingTitlessuriprise,
    this.settingTitlessuripriseAr,
    this.settingDeliverytime,
  });

  SettingModel.fromJson(Map<String, dynamic> json) {
    settingId = json['setting_id'];
    settingDeliveryPrice = json['setting_delivery_price'];
    settingPhone = json['setting_phone'];
    settingEmail = json['setting_email'];
    settingAbout = json['setting_about'];
    settingCurrency = json['setting_currency'];
    settingAboutAr = json['setting_about_ar'];
    settingTitlessuriprise = json['setting_titlesuriprise'];
    settingTitlessuripriseAr = json['setting_titlesuriprise_ar'];
    settingDeliverytime = json['setting_deliverytime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['setting_id'] = settingId;
    data['setting_delivery_price'] = settingDeliveryPrice;
    data['setting_phone'] = settingPhone;
    data['setting_email'] = settingEmail;
    data['setting_about'] = settingAbout;
    data['setting_currency'] = settingCurrency;
    data['setting_about_ar'] = settingAboutAr;
    data['setting_titlesuriprise'] = settingTitlessuriprise;
    data['setting_titlesuriprise_ar'] = settingTitlessuripriseAr;
    data['setting_deliverytime'] = settingDeliverytime;
    return data;
  }
}
