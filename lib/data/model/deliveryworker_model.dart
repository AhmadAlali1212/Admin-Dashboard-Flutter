class DeliveryworkerModel {
  int? deliveryworkersId;
  String? deliveryworkersName;
  String? deliveryworkersEmail;
  String? deliveryworkersPhone;
  String? deliveryworkersPassword;
  int? deliveryworkersVerifycode;
  int? deliveryworkersApprove;

  DeliveryworkerModel({
    this.deliveryworkersId,
    this.deliveryworkersName,
    this.deliveryworkersEmail,
    this.deliveryworkersPhone,
    this.deliveryworkersPassword,
    this.deliveryworkersVerifycode,
    this.deliveryworkersApprove,
  });

  DeliveryworkerModel.fromJson(Map<String, dynamic> json) {
    deliveryworkersId = json['deliveryworkers_id'];
    deliveryworkersName = json['deliveryworkers_name'];
    deliveryworkersEmail = json['deliveryworkers_email'];
    deliveryworkersPhone = json['deliveryworkers_phone'];
    deliveryworkersPassword = json['deliveryworkers_password'];
    deliveryworkersVerifycode = json['deliveryworkers_verifycode'];
    deliveryworkersApprove = json['deliveryworkers_approve'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['deliveryworkers_id'] = deliveryworkersId;
    data['deliveryworkers_name'] = deliveryworkersName;
    data['deliveryworkers_email'] = deliveryworkersEmail;
    data['deliveryworkers_phone'] = deliveryworkersPhone;
    data['deliveryworkers_password'] = deliveryworkersPassword;
    data['deliveryworkers_verifycode'] = deliveryworkersVerifycode;
    data['deliveryworkers_approve'] = deliveryworkersApprove;
    return data;
  }
}
