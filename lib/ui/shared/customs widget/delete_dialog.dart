import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:third_project/core/data/models/postmodel.dart';

void showDeleteDialog(
  BuildContext context,
  PostModel post, {
  required void Function()? onPressed,
}) {
  Get.defaultDialog(
    title: "تأكيد الحذف",
    content: Text("هل تريد حذف منشور:\n\"${post.title}\"?"),
    confirm: ElevatedButton(
      onPressed: onPressed,
      // onPressed: () {
      //   //  controller = Get.put(PostDetailController(PhotoRepositry()));

      //   Get.back();
      //   Get.back();
      //   Get.snackbar('تم الحذف', 'المنشور تم حذفه');
      // },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      child: const Text('نعم'),
    ),
    cancel: TextButton(onPressed: () => Get.back(), child: const Text('إلغاء')),
  );
}
