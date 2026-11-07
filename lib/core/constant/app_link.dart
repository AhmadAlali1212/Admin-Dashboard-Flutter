class AppLink {
  static const String server = "http://10.0.2.2/ecommeceapp/admain";
  static const String images = "http://10.0.2.2/ecommeceapp";

  static const String test = "$server/test.php";
  //                      Auth
  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verificationCode = "$server/auth/verify_code.php";
  static const String resend = "$server/auth/resend.php";

  //                      Forget Password

  static const String forgetPasswordData =
      "$server/forgetpassword/check_email.php";
  static const String verifyCodeEmail =
      "$server/forgetpassword/verify_code_email.php";
  static const String resetPassword =
      "$server/forgetpassword/reset_password.php";
  //             image
  static const String categoriesImage = "$images/Upload/categories";
  static const String itemsImage = "$images/Upload/items";
  //     Orders
  static const String ordersPending = "$server/orders/viewpending.php";
  static const String accepted = "$server/orders/accepted.php";
  static const String archive = "$server/orders/archive.php";
  static const String details = "$server/orders/details.php";
  static const String approve = "$server/orders/approve.php";
  static const String prepare = "$server/orders/prepare.php";

  //     Categories
  static const String categoriesView = "$server/categories/view.php";
  static const String categoriesAdd = "$server/categories/add.php";
  static const String categoriesEdit = "$server/categories/edit.php";
  static const String categoriesRemove = "$server/categories/remove.php";

  //     Items
  static const String itemsView = "$server/items/view.php";
  static const String itemsAdd = "$server/items/add.php";
  static const String itemsEdit = "$server/items/edit.php";
  static const String itemsRemove = "$server/items/remove.php";

  //     Copon / Coupon
  static const String coponView = "$server/copon/view.php";
  static const String coponAdd = "$server/copon/add.php";
  static const String coponEdit = "$server/copon/edit.php";
  static const String coponRemove = "$server/copon/remove.php";

  //     Delivery worker
  static const String deliveryworkerView = "$server/deliveryworker/view.php";
  static const String deliveryworkerAdd = "$server/deliveryworker/add.php";
  static const String deliveryworkerEdit = "$server/deliveryworker/edit.php";
  static const String deliveryworkerRemove =
      "$server/deliveryworker/remove.php";

  //     Setting
  static const String settingView = "$server/setting/view.php";
  static const String settingAdd = "$server/setting/add.php";
  static const String settingEdit = "$server/setting/edit.php";
  static const String settingRemove = "$server/setting/remove.php";
}
