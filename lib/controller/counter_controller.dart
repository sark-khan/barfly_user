import 'package:barfly_user/models/CounterListResponse.dart';
import 'package:barfly_user/services/ApiService.dart';
import 'package:get/get.dart';

class InsiderController extends GetxController {
  var counterLists = <CounterList>[].obs;
  var isLoading = true.obs;
  final String entityId;

  InsiderController(this.entityId);

  @override
  void onInit() {
    fetchCounters(entityId);
    super.onInit();
  }

  Future<void> fetchCounters(String entityId) async {
    try {
      var result = await Apiservice().getCounters(entityId);
      if (result.status) {
        counterLists.value = result.data!;
      } else {
        // Handle error
      }
    } finally {
      isLoading.value = false;
    }
  }
}
