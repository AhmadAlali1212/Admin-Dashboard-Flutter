# Admin Application

لوحة تحكم إدارية مبنية باستخدام **Flutter وDart** لإدارة متجر إلكتروني. يتيح
التطبيق للمسؤول إدارة الطلبات، التصنيفات، المنتجات، الكوبونات، عمال التوصيل
وإعدادات المتجر من خلال واجهة واحدة متصلة بخدمة PHP API.

> **ملاحظة:** هذا المستودع يحتوي على تطبيق لوحة التحكم فقط. خدمة الـ API
> وقاعدة البيانات الخلفية غير موجودتين ضمن هذا المستودع.

## المحتويات

- [المزايا](#المزايا)
- [التقنيات والاعتمادات](#التقنيات-والاعتمادات)
- [متطلبات التشغيل](#متطلبات-التشغيل)
- [التثبيت والتشغيل](#التثبيت-والتشغيل)
- [إعداد الاتصال بالـ API](#إعداد-الاتصال-بالـ-api)
- [هيكل المشروع](#هيكل-المشروع)
- [الوحدات والشاشات](#الوحدات-والشاشات)
- [المسارات داخل التطبيق](#المسارات-داخل-التطبيق)
- [نماذج البيانات](#نماذج-البيانات)
- [حالات الطلبات والاستجابات](#حالات-الطلبات-والاستجابات)
- [التخزين والإشعارات](#التخزين-والإشعارات)
- [بناء نسخة الإنتاج](#بناء-نسخة-الإنتاج)
- [استكشاف الأخطاء](#استكشاف-الأخطاء)
- [ملاحظات أمنية](#ملاحظات-أمنية)

## المزايا

| المجال | الوظائف |
|---|---|
| المصادقة | تسجيل الدخول، التحقق من رمز التفعيل، استعادة كلمة المرور |
| الطلبات | عرض الطلبات المعلقة والمقبولة والمؤرشفة، وعرض التفاصيل، والاعتماد والتحضير |
| التصنيفات | عرض، إضافة، تعديل، وحذف التصنيفات مع صورة |
| المنتجات | عرض، إضافة، تعديل، وحذف المنتجات وربطها بالتصنيفات |
| الكوبونات | عرض، إضافة، تعديل، وحذف كوبونات الخصم |
| عمال التوصيل | عرض، إضافة، تعديل، وحذف بيانات عمال التوصيل |
| إعدادات المتجر | تعديل سعر التوصيل، العملة، بيانات التواصل، والوصف |
| تجربة الاستخدام | دعم الترجمة، الثيم، الصور، ملفات Lottie، والتصميم المتجاوب |

## التقنيات والاعتمادات

| التقنية/الحزمة | الاستخدام |
|---|---|
| Flutter / Dart | بناء التطبيق متعدد المنصات |
| GetX | إدارة الحالة، الحقن، والتنقل عبر المسارات |
| HTTP | الاتصال بخدمات PHP API |
| `dartz` | إرجاع النتائج بصيغة `Either` للنجاح أو الخطأ |
| Firebase Core | تهيئة Firebase |
| Firebase Messaging | طلب صلاحيات الإشعارات واستقبال FCM |
| Shared Preferences | حفظ الإعدادات والبيانات المحلية |
| Google Maps / Geolocator / Geocoding | الخرائط والموقع والعناوين |
| Image Picker / File Picker | اختيار الصور والملفات |
| Cached Network Image | تخزين الصور القادمة من الشبكة مؤقتًا |
| Lottie | حالات التحميل وعدم وجود البيانات والأخطاء |
| QR Flutter | إنشاء رموز QR |
| Cairo | الخط العربي الأساسي للتطبيق |

يمكن مراجعة الإصدارات الفعلية لجميع الحزم في
[`pubspec.yaml`](./pubspec.yaml).

## متطلبات التشغيل

| المتطلب | القيمة المستخدمة في المشروع |
|---|---|
| Flutter | إصدار متوافق مع Dart `^3.11.0` |
| Dart SDK | `3.11.0` أو أحدث ضمن نطاق Flutter المستخدم |
| Android Studio / SDK | مطلوب لتشغيل Android |
| Firebase | إعداد Android موجود في `android/app/google-services.json` |
| PHP API | خدمة خارجية متوافقة مع المسارات المعرفة في `AppLink` |

تحقق من البيئة قبل التشغيل:

```bash
flutter doctor
flutter --version
```

## التثبيت والتشغيل

```bash
git clone <repository-url>
cd adminapplication
flutter pub get
flutter devices
flutter run
```

لتشغيل التطبيق على Android Emulator، استخدم جهازًا يعمل ثم نفّذ:

```bash
flutter run -d <device-id>
```

> لا يحتوي المستودع حاليًا على اختبارات آلية موثقة. يفضل تنفيذ `flutter
> analyze` قبل إنشاء نسخة توزيع.

## إعداد الاتصال بالـ API

تعريفات الخادم موجودة في
[`lib/core/constant/app_link.dart`](./lib/core/constant/app_link.dart):

| المتغير | القيمة الحالية | الغرض |
|---|---|---|
| `server` | `http://10.0.2.2/ecommeceapp/admain` | جذر API |
| `images` | `http://10.0.2.2/ecommeceapp` | جذر الصور |

العنوان `10.0.2.2` هو عنوان الجهاز المضيف من داخل **Android Emulator**. عند
استخدام جهاز حقيقي يجب استبداله بعنوان IP المحلي للحاسوب، وعند استخدام خادم
بعيد يجب وضع عنوان HTTPS الخاص به.

قبل التشغيل تأكد من:

1. تشغيل خادم PHP وقاعدة البيانات.
2. وجود مجلد المشروع الخلفي والمسارات المتوقعة مثل `auth`, `orders`,
   `categories`, و`items`.
3. إمكانية الوصول إلى الخادم من الجهاز أو المحاكي.
4. رفع مجلدات الصور وفق المسارات `Upload/categories` و`Upload/items`.

### خدمات API المستخدمة

| المجال | المسارات |
|---|---|
| المصادقة | `auth/signup.php`, `auth/login.php`, `auth/verify_code.php`, `auth/resend.php` |
| استعادة كلمة المرور | `forgetpassword/check_email.php`, `verify_code_email.php`, `reset_password.php` |
| الطلبات | `orders/viewpending.php`, `accepted.php`, `archive.php`, `details.php`, `approve.php`, `prepare.php` |
| التصنيفات | `categories/view.php`, `add.php`, `edit.php`, `remove.php` |
| المنتجات | `items/view.php`, `add.php`, `edit.php`, `remove.php` |
| الكوبونات | `copon/view.php`, `add.php`, `edit.php`, `remove.php` |
| عمال التوصيل | `deliveryworker/view.php`, `add.php`, `edit.php`, `remove.php` |
| الإعدادات | `setting/view.php`, `add.php`, `edit.php`, `remove.php` |

تنفذ طلبات JSON العادية عبر `Crud.postData`، بينما تستخدم عمليات رفع الصور
`Crud.addRequestWithImageOne` بصيغة `multipart/form-data`.

## هيكل المشروع

```text
lib/
├── main.dart                 # نقطة تشغيل التطبيق
├── routes.dart               # تعريف مسارات GetX
├── bindings/                 # الحقن الأولي للخدمات والتحكم
├── core/
│   ├── class/                # أدوات الاتصال والتعامل مع البيانات
│   ├── constant/             # الروابط، الثيم، الألوان، الحالات
│   ├── functions/            # الإنترنت، التحقق، رفع الملفات
│   ├── localization/         # اللغات والترجمة
│   ├── middleware/           # الحماية قبل فتح المسارات
│   └── services/             # Firebase وShared Preferences
├── controller/               # Controllers الخاصة بكل وحدة
├── data/
│   ├── datasource/remote/    # مصادر البيانات وطلبات API
│   └── model/                # نماذج JSON
└── view/
    ├── screen/               # الشاشات
    └── widget/               # المكونات المشتركة
```

## الوحدات والشاشات

| الوحدة | شاشة العرض | شاشات العمليات |
|---|---|---|
| المصادقة | `auth/login.dart` | `auth/verificationCode.dart` |
| الطلبات | `orders/orders_screen.dart` | `pending.dart`, `accepted.dart`, `archive.dart`, `order_details.dart` |
| التصنيفات | `categories/categories_view.dart` | `categories_add.dart`, `categories_edit.dart` |
| المنتجات | `items/items_view.dart` | `items_add.dart`, `items_edit.dart` |
| الكوبونات | `copon/copon_view.dart` | `copon_add.dart`, `copon_edit.dart`, `copon_remove.dart` |
| عمال التوصيل | `deliveryworker/deliveryworker_view.dart` | `deliveryworker_add.dart`, `deliveryworker_edit.dart`, `deliveryworker_remove.dart` |
| الإعدادات | `setting/setting_view.dart` | `setting_add.dart`, `setting_edit.dart`, `setting_remove.dart` |
| الاستعادة | `checkEmail/forget_password.dart` | `verification_email.dart`, `reset_password.dart`, `success_reset_password.dart` |

كل وحدة تتبع غالبًا النمط التالي:

```text
view/screen/<module>/
controller/<module>/
data/datasource/remote/<module>_data.dart
data/model/<module>_model.dart
```

## المسارات داخل التطبيق

تُدار المسارات بواسطة GetX في
[`lib/routes.dart`](./lib/routes.dart)، وتُعرّف أسماؤها في
[`lib/core/constant/app_routes.dart`](./lib/core/constant/app_routes.dart).

| المسار | الشاشة |
|---|---|
| `/` أو `/login` | تسجيل الدخول |
| `/home` | الصفحة الرئيسية |
| `/ordersScreen` | مركز الطلبات |
| `/ordersPending` | الطلبات المعلقة |
| `/orderAccepted` | الطلبات المقبولة |
| `/archive` | أرشيف الطلبات |
| `/orderDetails` | تفاصيل الطلب |
| `/categories` | التصنيفات |
| `/items` | المنتجات |
| `/copon` | الكوبونات |
| `/deliveryworker` | عمال التوصيل |
| `/setting` | إعدادات المتجر |
| `/verificationcode` | التحقق من رمز التسجيل |
| `/verificationEmail` | التحقق من البريد |
| `/resetPassword` | إعادة تعيين كلمة المرور |

## نماذج البيانات

الجداول التالية تلخص الحقول التي يتعامل معها التطبيق كما تظهر في نماذج Dart.
هي **وصف لعقود البيانات المتوقعة** وليست مخطط SQL مؤكدًا؛ مخطط قاعدة البيانات
الفعلي يجب الرجوع فيه إلى مشروع الـ API.

### التصنيفات

| الحقل | النوع | الوصف |
|---|---|---|
| `categories_id` | `int` | المعرّف |
| `categories_name` / `categories_name_ar` | `String` | الاسم باللغتين |
| `categories_image` | `String` | اسم أو رابط الصورة |
| `categories_datetime` | `String` | تاريخ الإنشاء |

### المنتجات

| الحقل | النوع | الوصف |
|---|---|---|
| `items_id` | `int` | المعرّف |
| `items_name`, `items_name_ar` | `String` | الاسم |
| `items_desc`, `items_desc_ar` | `String` | الوصف |
| `items_image` | `String` | صورة المنتج |
| `items_count` | `int` | المخزون أو الكمية |
| `Items_active` | `int` | حالة التفعيل |
| `items_price` / `items_discount` | `int` | السعر والخصم |
| `items_cat` / `categories_id` | `int` | ربط المنتج بالتصنيف |
| `items_date` | `String` | تاريخ الإضافة |

### الطلبات وتفاصيلها

| المجموعة | الحقول الرئيسية |
|---|---|
| الطلب | `orders_id`, `orders_userid`, `orders_addressid`, `orders_datetime` |
| الأسعار | `orders_price`, `orders_pricedelivery`, `orders_totalprice`, `orders_couponid` |
| الدفع والحالة | `orders_paymentmethod`, `orders_status`, `orders_rating`, `orders_commet` |
| العنوان | `address_city`, `address_street`, `address_lat`, `address_long`, `address_building`, `address_name` |
| عناصر الطلب | `cart_id`, `cart_usersid`, `cart_itemsid`, `count_items`, `price_items` |

### الكوبونات والإعدادات

| النموذج | الحقول |
|---|---|
| `CouponModel` | `coupon_id`, `coupon_name`, `coupon_discount`, `coupon_count`, `coupon_expiredate` |
| `DeliveryworkerModel` | `deliveryworkers_id`, `deliveryworkers_name`, `deliveryworkers_email`, `deliveryworkers_phone`, `deliveryworkers_approve` |
| `SettingModel` | `setting_delivery_price`, `setting_phone`, `setting_email`, `setting_currency`, `setting_about`, `setting_deliverytime` |

## حالات الطلبات والاستجابات

يستخدم التطبيق `StatusRequset` مع `Either` لتوحيد نتيجة طلبات الشبكة:

| الحالة | المعنى |
|---|---|
| `success` | تمت العملية بنجاح |
| `loading` | العملية قيد التنفيذ |
| `failure` | فشل عام |
| `serviceFailure` | الخادم أعاد رمز HTTP غير ناجح |
| `OfflineFailure` | لا يوجد اتصال بالإنترنت |
| `exceptionFailure` | حدث استثناء أثناء الطلب أو تحليل JSON |

يُعتبر الطلب ناجحًا في طبقة CRUD عندما يعيد الخادم HTTP `200` أو `201` مع
استجابة JSON قابلة للتحليل.

## التخزين والإشعارات

عند بدء التطبيق تنفذ `initialServices` الخطوات التالية:

1. تهيئة Firebase.
2. طلب صلاحية الإشعارات عبر Firebase Messaging.
3. تهيئة `SharedPreferences`.
4. تسجيل الخدمة داخل GetX.

يلزم إعداد Firebase بشكل صحيح على كل منصة مستهدفة، وعدم الاعتماد على ملف
Android وحده عند بناء iOS أو Web أو Desktop.

## بناء نسخة الإنتاج

### Android APK

```bash
flutter clean
flutter pub get
flutter analyze
flutter build apk --release
```

الناتج المتوقع:

```text
build/app/outputs/flutter-apk/app-release.apk
```

### Android App Bundle

```bash
flutter build appbundle --release
```

قبل النشر، غيّر عنوان API من HTTP المحلي إلى HTTPS عام، واضبط توقيع Android
ومتغيرات Firebase الخاصة ببيئة الإنتاج.

## استكشاف الأخطاء

| المشكلة | التحقق والحل |
|---|---|
| `10.0.2.2` لا يعمل | استخدم Android Emulator أو استبدل العنوان بعنوان الجهاز الحقيقي |
| فشل الاتصال بالخادم | تحقق من تشغيل PHP، الجدار الناري، والمنفذ، ثم جرّب الرابط من الجهاز |
| الصور لا تظهر | تحقق من `AppLink.images` ومجلدات الرفع وصلاحيات الوصول |
| خطأ Firebase عند البدء | تحقق من `google-services.json` ومن إعداد Firebase للمشروع |
| فشل `flutter pub get` | تحقق من إصدار Flutter/Dart ثم نفّذ `flutter clean` وأعد المحاولة |
| الشاشة لا تفتح | راجع اسم المسار في `app_routes.dart` وتسجيله في `routes.dart` |
| نتيجة `serviceFailure` | افحص رمز HTTP وبنية JSON التي يعيدها الـ API |

أوامر تشخيص مفيدة:

```bash
flutter doctor -v
flutter analyze
flutter logs
```

## ملاحظات أمنية

- لا تستخدم HTTP في بيئة الإنتاج؛ استخدم HTTPS.
- لا تضع كلمات المرور أو مفاتيح الخدمات داخل المستودع.
- ملف `app_link.dart` يحتوي حاليًا على عنوان تطوير محلي، ويجب تغييره حسب
  البيئة.
- نموذج عامل التوصيل يتضمن حقل كلمة مرور ضمن البيانات؛ يجب أن تضمن خدمة الـ
  API عدم إرجاع كلمات المرور أو تخزينها بنص صريح.
- تحقق من مدخلات المستخدم على الخادم، وليس في الواجهة فقط.
- قيّد رفع الملفات بالامتداد والحجم ونوع MIME على الخادم.

## المساهمة

1. أنشئ فرعًا مستقلًا للتغيير.
2. حافظ على فصل `view`, `controller`, `data`, و`core`.
3. حدّث النماذج ومسارات API عند تغيير عقد الخدمة.
4. نفّذ `flutter analyze` قبل فتح طلب الدمج.
5. اشرح أي تغيير في سلوك الطلبات أو الصلاحيات أو إعدادات Firebase.

## الترخيص

لا يحدد المستودع حاليًا ملف ترخيص عامًا. أضف ترخيصًا مناسبًا قبل التوزيع
الخارجي أو النشر العام.
