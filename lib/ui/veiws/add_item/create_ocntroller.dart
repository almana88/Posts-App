import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:third_project/core/enums/request_status.dart';
import 'package:third_project/core/services/base_controller.dart';
import 'package:third_project/core/data/models/postmodel.dart';
import 'package:third_project/core/utils/post_repositry.dart';

class CreatePostController extends BaseController {
  final PostRepositry _repository;
  CreatePostController(this._repository);

  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  void onClose() {
    titleController.dispose();
    bodyController.dispose();
    super.onClose();
  }

  Future<void> createPost() async {
    if (titleController.text.trim().isEmpty ||
        bodyController.text.trim().isEmpty) {
      Get.snackbar('تنبيه', 'الرجاء ملء جميع الحقول');
      return;
    }

    setRequestStatus = RequestStatus.LOADING;

    final newPost = PostModel(
      title: titleController.text.trim(),
      body: bodyController.text.trim(),
    );

    final result = await _repository.createPost(newPost);

    result.fold(
      (error) {
        setRequestStatus = RequestStatus.ERROR;
        Get.snackbar('خطأ', error);
      },
      (createdPost) {
        setRequestStatus = RequestStatus.SUCCESS;
        Get.snackbar('نجاح', 'تم إنشاء المنشور بنجاح');
        // يمكنك العودة للخلف بعد النجاح
        Get.back();
      },
    );
  }
}
