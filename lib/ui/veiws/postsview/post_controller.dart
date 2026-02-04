// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:third_project/core/services/base_controller.dart';
import 'package:third_project/core/data/models/postmodel.dart';
import 'package:third_project/core/utils/post_repositry.dart';

class PostsController extends BaseController {
  final PostRepositry _postRepository;

  PostsController(this._postRepository);

  var posts = <PostModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts(); // ← هذا السطر هو المفتاح!
  }

  void fetchPosts() {
    runFutureFunctionWithLoading(
      function: () async {
        final result = await _postRepository.getAll();
        result.fold(
          (l) {
            print('Error fetching posts: $l');
          },
          (r) {
            print('Fetched ${r.length} posts');
            posts.assignAll(r);
          },
        );
      },
    );
  }
}
