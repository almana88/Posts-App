import 'package:dartz/dartz.dart';
import 'package:third_project/core/enums/request_type.dart';
import 'package:third_project/core/data/models/photomodel.dart';
import 'package:third_project/core/utils/common_response.dart';
import 'package:third_project/core/utils/network_config.dart';
import 'package:third_project/core/utils/network_utils.dart';
import 'package:third_project/core/utils/photo_enpoint.dart';

class PhotoRepositry {
  Future<Either<String, List<PhotoModel>>> getAll(String postId) async {
    try {
      return NetworkUtil.sendRequest(
        requestType: RequestType.GET,
        url: Photoenpoint.getphotos(postId),
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          // requestType: RequestType.GET,
        ),
      ).then((response) {
        CommonResponseModel<List<dynamic>> commonResponse =
            CommonResponseModel.fromJson(response);
        if (commonResponse.getStatus) {
          List<PhotoModel> resultList = [];

          commonResponse.data!.forEach((element) {
            resultList.add(PhotoModel.fromJson(element));
          });

          return Right(resultList);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
