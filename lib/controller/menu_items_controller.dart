import 'package:barfly_user/models/menu_category_items.dart';
import 'package:barfly_user/services/ApiService.dart';
import 'package:get/get.dart';

class MenuItemsController extends GetxController {
  final String menuId;
  var menuItems = <MenuItem>[].obs;
  var isLoading = true.obs;

  MenuItemsController(this.menuId);

  @override
  void onInit() {
    fetchMenuItems();
    super.onInit();
  }

  Future<void> fetchMenuItems() async {
    try {
      var result = await Apiservice().getMenuCategoryItems(menuId);
      print(
          "${result.data}  ${result.status} ${result.message}??????????????????????????????????????????????????");
      if (result.status) {
        menuItems.value = result.data!;
      } else {
        print("Error occured in fetchMenuItems");
      }
    } finally {
      isLoading.value = false;
    }
  }
}
