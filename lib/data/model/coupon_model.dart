class CouponModel {
  int? couponId;
  String? couponName;
  int? couponDiscount;
  int? couponCount;
  String? couponExpiredate;

  CouponModel({
    this.couponId,
    this.couponName,
    this.couponDiscount,
    this.couponCount,
    this.couponExpiredate,
  });

  CouponModel.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'];
    couponName = json['coupon_name'];
    couponDiscount = json['coupon_discount'];
    couponCount = json['coupon_count'];
    couponExpiredate = json['coupon_expiredate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coupon_id'] = couponId;
    data['coupon_name'] = couponName;
    data['coupon_discount'] = couponDiscount;
    data['coupon_count'] = couponCount;
    data['coupon_expiredate'] = couponExpiredate;
    return data;
  }
}
