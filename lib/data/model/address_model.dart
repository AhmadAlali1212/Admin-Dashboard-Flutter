class AddressModel {
  int? addressId;
  int? addressUserid;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLong;
  String? addressBuilding;
  String? addressName;

  AddressModel({
    this.addressId,
    this.addressUserid,
    this.addressCity,
    this.addressStreet,
    this.addressLat,
    this.addressLong,
    this.addressBuilding,
    this.addressName,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressUserid = json['address_userid'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
    addressBuilding = json['address_building'];
    addressName = json['address_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address_id'] = addressId;
    data['address_userid'] = addressUserid;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    data['address_building'] = addressBuilding;
    data['address_name'] = addressName;
    return data;
  }
}
