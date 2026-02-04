// photo_model.dart
class PhotoModel {
  final int albumId;
  final String id;
  final String title;
  final String url;
  final String thumbnailUrl;

  PhotoModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      albumId: json['albumId'],
      id: json['id']?.toString() ?? "0",
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}
