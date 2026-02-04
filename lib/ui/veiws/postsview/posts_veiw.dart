// posts_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:third_project/ui/shared/customs%20widget/custom_card.dart';
import 'package:third_project/ui/veiws/postsview/post_controller.dart';
import 'package:third_project/core/data/models/postmodel.dart';
import 'package:third_project/core/utils/post_repositry.dart';
import 'package:third_project/ui/veiws/add_item/add_item_veiw.dart';

class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PostsController(PostRepositry()));

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFE0F2F1),
        appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                onPressed: () => Get.to(const CreatePostView()),
                icon: const Icon(Icons.add),
              ),
              const SizedBox(width: 8),
              Text(
                'Posts',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Obx(() {
          if (controller.isLoading) {
            return Center(child: SpinKitThreeBounce(color: Colors.teal));
          }

          if (controller.posts.isEmpty && !controller.isLoading) {
            return Center(
              child: Text(
                'لا توجد منشورات',
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.only(top: 10),
            itemCount: controller.posts.length,
            itemBuilder: (context, index) {
              PostModel post = controller.posts[index];
              return CustomCard(post: post);
            },
          );
        }),
      ),
    );
  }
}
