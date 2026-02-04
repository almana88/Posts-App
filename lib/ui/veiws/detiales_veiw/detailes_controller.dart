// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:third_project/core/enums/photo_repositry.dart';
import 'package:third_project/core/services/base_controller.dart';
import 'package:third_project/core/data/models/photomodel.dart';
import 'package:third_project/core/data/models/postmodel.dart';
import 'package:third_project/core/utils/post_repositry.dart';

class PostDetailController extends BaseController {
  PhotoRepositry photoRepository = PhotoRepositry();
  PostRepositry postRepository = PostRepositry();
  PostDetailController(this.photoRepository);

  var post = PostModel().obs;
  var photos = <PhotoModel>[].obs;

  // void fetchPhotos() {
  // runFutureFunctionWithLoading(
  //  function: () async {
  //    final result = await photoRepository.getAll();
  //    result.fold(
  //      (l) {
  //        print('Error fetching posts: $l');
  //      },
  //      (r) {
  //         print('Fetched ${r.length} photos1000000');
  //         photos.assignAll(r);
  //       },
  //      );
  //    },
  // );
  // }

  Future<void> deletePost(String postId) async {
    runFutureFunctionWithLoading(
      function: () async {
        final result = await postRepository.deletepost(postId);
        result.fold(
          (l) {
            return Get.snackbar("يوجد خطأ", l);
          },
          (r) {
            Get.back();
            print('✅ تم الحذف');
          },
        );
      },
    );

    Get.back();
  }

  Future<void> loadPhotosByPostId(String postId) async {
    runFutureFunctionWithLoading(
      function: () async {
        final result = await photoRepository.getAll(postId);
        result.fold((l) => Get.snackbar("خطأ", l), (r) {
          photos.assignAll(r);
          print('✅ تم تحميل ${r.length} صورة');
        });
      },
    );

    // @override
    // void onInit() {
    //   super.onInit();
    //   print("+++++++++++++++++++++++++++++++++++++++++++++++++++");
    // }
  }
}
