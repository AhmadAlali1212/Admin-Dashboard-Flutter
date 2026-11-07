import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

imageUploadCamera() async {
  final XFile? file = await ImagePicker().pickImage(source: ImageSource.camera);

  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

imageUploadGallery([bool isSvg = false]) async {
  FilePickerResult? result = await FilePicker.pickFiles(
    type: FileType.custom,
    allowedExtensions: isSvg
        ? ["SVG", "svg"]
        : [
            "PNG",
            "png",
            "JPG",
            "jpg",
            "JPEG",
            "jpeg",
            "GIF",
            "gif",
            "JPEG",
            "jpeg",
          ],
  );

  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}

void showbottommenue(imageUploadCamera, imageUploadGallery) {
  Get.bottomSheet(
    Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Wrap(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              child: const Center(
                child: Text(
                  "Choose Image",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const Divider(height: 1),

            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Camera"),
              onTap: () async {
                await imageUploadCamera();
                Get.back();
              },
            ),

            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text("Gallery"),
              onTap: () async {
                await imageUploadGallery();
                Get.back();
              },
            ),
            
            const SizedBox(height: 10),
       
          ],
        ),
      ),
    ),
    isScrollControlled: true,
  );
}
