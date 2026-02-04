import 'package:dartz/dartz.dart';
import 'package:third_project/core/enums/request_type.dart';
import 'package:third_project/core/data/models/postmodel.dart';
import 'package:third_project/core/utils/common_response.dart';
import 'package:third_project/core/utils/network_config.dart';
import 'package:third_project/core/utils/network_utils.dart';
import 'package:third_project/core/utils/postenpoint.dart';

class PostRepositry {
  Future<Either<String, List<PostModel>>> getAll() async {
    try {
      return NetworkUtil.sendRequest(
        requestType: RequestType.GET,
        url: Postenpoint.getall,
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          // requestType: RequestType.GET,
        ),
      ).then((response) {
        CommonResponseModel<List<dynamic>> commonResponse =
            CommonResponseModel.fromJson(response);
        if (commonResponse.getStatus) {
          List<PostModel> resultList = [];

          commonResponse.data!.forEach((element) {
            resultList.add(PostModel.fromJson(element));
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

  Future<Either<String, PostModel>> createPost(PostModel post) async {
    try {
      return NetworkUtil.sendRequest(
        requestType: RequestType.POST,
        url: Postenpoint.getall,
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          requestType: RequestType.POST,
        ),
        body: post.toJson(),
      ).then((response) {
        if (response is Map<String, dynamic>) {
          final createdPost = PostModel.fromJson(response);
          return Right(createdPost);
        } else {
          return Left('استجابة غير متوقعة من الخادم');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> deletepost(String postid) async {
    try {
      return NetworkUtil.sendRequest(
        requestType: RequestType.DELETE,
        url: Postenpoint.deletepost(postid),
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          requestType: RequestType.DELETE,
        ),
        // body: {}
      ).then((response) {
        CommonResponseModel<dynamic> commonResponse =
            CommonResponseModel.fromJson(response);
        if (commonResponse.getStatus) {
          // List<PostModel> resultList = [];

          // commonResponse.data!.forEach((element) {
          //   resultList.add(PostModel.fromJson(element));
          // });

          return Right(commonResponse.getStatus);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
