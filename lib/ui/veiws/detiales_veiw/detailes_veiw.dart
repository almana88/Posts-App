// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:third_project/ui/shared/customs%20widget/delete_dialog.dart';
import 'package:third_project/ui/veiws/detiales_veiw/detailes_controller.dart';
import 'package:third_project/core/enums/photo_repositry.dart';
import 'package:third_project/core/data/models/postmodel.dart';

class PostDetailView extends StatefulWidget {
  final PostModel post;

  const PostDetailView({super.key, required this.post});

  @override
  State<PostDetailView> createState() => _PostDetailViewState();
}

class _PostDetailViewState extends State<PostDetailView> {
  late PostDetailController controller;
  @override
  void initState() {
    super.initState();
    controller = Get.put(PostDetailController(PhotoRepositry()));
    controller.post.value = widget.post;
    print('جارٍ جلب الصور للمنشور: ${widget.post.id}');
    print("mmmmmmmmmmmmmmmmmmmmm${controller.post.value.id.toString()}");
    controller.loadPhotosByPostId(controller.post.value.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل المنشور'),
        backgroundColor: Colors.teal,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showDeleteDialog(
                context,
                widget.post,
                onPressed: () {
                  controller.deletePost(widget.post.id.toString());
                },
              );
            },
            icon: Icon(Icons.delete_forever_sharp, color: Colors.red, size: 35),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              widget.post.title ?? 'بدون عنوان',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 16),

            Text(
              widget.post.body ?? 'لا يوجد محتوى',
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 24),

            Obx(() {
              if (controller.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return const SizedBox.shrink();
            }),
            const SizedBox(height: 12),

            Obx(() {
              return Column(
                children: [
                  if (controller.photos.isNotEmpty)
                    const Text(
                      'الصور المرفقة',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ...controller.photos.map((photo) {
                    print('🖼️ رابط الصورة: ${photo.url}');

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          photo.url,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 200,
                              color: Colors.grey[300],
                              child: const Center(
                                child: Icon(Icons.broken_image, size: 50),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }).toList(),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
