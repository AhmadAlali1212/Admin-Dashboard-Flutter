import 'package:flutter/material.dart';

class CustomCardHome extends StatelessWidget {
  const CustomCardHome({
    super.key,
    required this.title,
    this.onTap,
    this.image,
    this.icon,
  });

  final String? image;
  final String title;
  final Function()? onTap;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2, // ظل خفيف جداً يطابق التصميم
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // زوايا منحنية خفيفة للكارت
        side: BorderSide(color: Colors.grey.shade200, width: 1), // إطار خفيف
      ),
      child: InkWell(
        // لإضافة تأثير عند الضغط على الكارت مستقبلاً
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // توسيط المحتويات عمودياً
          crossAxisAlignment:
              CrossAxisAlignment.center, // توسيط المحتويات أفقياً
          children: [
            if (image != null)
              Image.asset(
                image!,
                width: 55, // حجم مناسب جداً للأيقونة داخل الكارت
                height: 55,
                fit: BoxFit.contain,
              )
            else
              Icon(
                icon ?? Icons.grid_view_outlined,
                size: 44,
                color: Colors.grey[700],
              ),
            const SizedBox(height: 12), // مسافة بين الصورة والنص
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700], // لون نص رمادي أنيق مثل المحاكي
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
