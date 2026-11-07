import 'package:adminapplication/core/constant/color_constant.dart';
import 'package:flutter/material.dart';

class CustomMaterialButtonForFileGlobal extends StatelessWidget {
  CustomMaterialButtonForFileGlobal({
    super.key,
    required this.onPressed,
    required this.text,
  });
  void Function()? onPressed;
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20),
        ),
        padding: EdgeInsets.symmetric(vertical: 10),
        onPressed: onPressed,
        color: ColorConstant.puplerLight,
        textColor: ColorConstant.whitePrimary,
        child: Text(text, style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
