import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:third_project/core/enums/option_type.dart';
import 'package:third_project/core/enums/request_status.dart';

class BaseController extends GetxController {
  var requestStatus = RequestStatus.DEFAULT.obs;
  RxList<OperationType> operationTypeList = <OperationType>[].obs;

  bool get isLoading => requestStatus.value == RequestStatus.LOADING;

  set setRequestStatus(RequestStatus value) {
    requestStatus.value = value;
  }

  Future<void> runFutureFunctionWithLoading({
    required Future<void> Function() function,
    OperationType? operationType = OperationType.NONE,
  }) async {
    requestStatus.value = RequestStatus.LOADING;

    try {
      await function();
      requestStatus.value = RequestStatus.SUCCESS;
    } catch (e) {
      requestStatus.value = RequestStatus.ERROR;

      print('Error kkkkkkkkkkkkkkkkk in runFutureFunctionWithLoading: $e');
    }
  }
}
