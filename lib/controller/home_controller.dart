import 'package:get/get.dart';

class HomeController extends GetxController {
  var isSearchActive = false.obs;
  var selectedIndex = 0.obs;

  void toggleSearch() {
    isSearchActive.value = !isSearchActive.value;
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
