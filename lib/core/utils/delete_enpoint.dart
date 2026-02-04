import 'package:third_project/core/utils/network_config.dart';

class Photoenpoint {
  static String deletepost(String postId) =>
      NetworkConfig.getFullApiRoute('/posts/$postId');
}
