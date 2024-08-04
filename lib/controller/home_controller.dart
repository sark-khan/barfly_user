import 'package:barfly_user/services/ApiService.dart';
import 'package:get/get.dart';
import 'package:barfly_user/models/getEntities.dart';
import 'package:barfly_user/return_obj.dart';

class HomeController extends GetxController {
  var isSearchActive = false.obs;
  var isLoading = true.obs;
  var ongoingEvents = <Entity>[].obs;
  var remainingEvents = <Entity>[].obs;

  void toggleSearch() {
    isSearchActive.value = !isSearchActive.value;
  }

  Future<ReturnObj> fetchEntities() async {
    isLoading.value = true;
    var result = await Apiservice().getEntities();
    if (result.status) {
      ongoingEvents.value = result.data!.ongoingEventEntities;
      remainingEvents.value = result.data!.remainingEntities;
    } else {
      print("Failed to fetch entities: ${result.message}");
    }
    isLoading.value = false;
    return result;
  }
}
