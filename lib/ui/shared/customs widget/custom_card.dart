import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:third_project/core/data/models/postmodel.dart';
import 'package:third_project/ui/veiws/detiales_veiw/detailes_veiw.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        title: Text(
          post.title ?? 'بدون عنوان',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.teal,
            fontSize: 16,
          ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          post.body ?? '',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.grey),
        ),
        onTap: () {
          Get.to(PostDetailView(post: post));
        },
      ),
    );
  }
}
