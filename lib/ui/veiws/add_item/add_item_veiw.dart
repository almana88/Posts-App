import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:third_project/ui/veiws/add_item/create_ocntroller.dart';
import 'package:third_project/core/utils/post_repositry.dart';

class CreatePostView extends StatelessWidget {
  const CreatePostView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreatePostController(PostRepositry()));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new post'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // حقل العنوان
            TextField(
              controller: controller.titleController,
              decoration: const InputDecoration(
                labelText: 'Titel',
                border: OutlineInputBorder(),
              ),
              maxLines: 1,
            ),
            const SizedBox(height: 16),

            // حقل المحتوى
            TextField(
              controller: controller.bodyController,
              decoration: const InputDecoration(
                labelText: 'Body',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 24),

            // زر الإنشاء
            Obx(() {
              return ElevatedButton(
                onPressed: controller.isLoading
                    ? null
                    : () => controller.createPost(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: controller.isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'Save',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
