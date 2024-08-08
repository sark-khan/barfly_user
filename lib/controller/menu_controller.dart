import 'package:barfly_user/models/MenuCategory.dart';
import 'package:barfly_user/services/ApiService.dart';
import 'package:get/get.dart';

class MenuCategoryController extends GetxController {
  final String counterId;
  var menuLists = <MenuList>[].obs;
  var isLoading = true.obs;
  // var currency = "".obs;

  MenuCategoryController(this.counterId);

  @override
  void onInit() {
    fetchMenuCategory();
    super.onInit();
  }

  Future<void> fetchMenuCategory() async {
    try {
      var result = await Apiservice().getMenuCategory(counterId);
      if (result.status) {
        menuLists.value = result.data!;
      } else {
        // Handle error
      }
    } finally {
      isLoading.value = false;
    }
  }
}
