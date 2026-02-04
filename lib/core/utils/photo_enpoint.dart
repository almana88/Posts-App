import 'package:third_project/core/utils/network_config.dart';

class Photoenpoint {
  static String getphotos(String postId) =>
      NetworkConfig.getFullApiRoute('/albums/$postId/photos');
}
