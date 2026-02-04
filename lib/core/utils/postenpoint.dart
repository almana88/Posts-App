import 'package:third_project/core/utils/network_config.dart';

class Postenpoint {
  static String getall = NetworkConfig.getFullApiRoute("/posts");

  static String courseRecordedSession(String postId) =>
      NetworkConfig.getFullApiRoute('/albums/$postId/photos');
  static String deletepost(String postId) =>
      NetworkConfig.getFullApiRoute('/posts/$postId');
}
