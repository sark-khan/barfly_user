import 'package:barfly_user/appConstants.dart';
import 'package:barfly_user/components/Buttons.dart';
import 'package:barfly_user/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return PopScope(
        canPop: true,
        child: Scaffold(
            body: Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.08142, right: screenWidth * 0.08396),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.04812,
              ),
              Obx(() => controller.isSearchActive.value
                  ? Container(
                      margin: const EdgeInsets.only(top: 10, left: 0),
                      width: screenWidth,
                      height: screenHeight * 0.03755,
                      child: TextField(
                        style:
                            const TextStyle(fontSize: 12, color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {},
                            padding: const EdgeInsets.symmetric(vertical: 5),
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: controller.toggleSearch,
                            padding: const EdgeInsets.symmetric(vertical: 5),
                          ),
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 0),
                          fillColor: AppColors.searchInputBackgroundColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: controller.toggleSearch,
                      child: Container(
                        width: 32,
                        height: 32,
                        margin: const EdgeInsets.only(left: 16),
                        decoration: BoxDecoration(
                          color: AppColors.searchButtonBackgroundColor,
                          borderRadius: BorderRadius.circular(
                              12.0), // Adjust the radius as needed
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.search,
                            color: AppColors.searchIconColor,
                            size: 17,
                          ),
                        ),
                      ),
                    )),
              Obx(() => controller.isSearchActive.value
                  ? SizedBox(
                      height: screenHeight * 0.04577,
                    )
                  : SizedBox(
                      height: screenHeight * 0.04577,
                    )),
              Obx(() => controller.isSearchActive.value
                  ? SizedBox(
                      height: 0,
                    )
                  : Container(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(AppText.Favorites,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: "Helvetica",
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          )))),
              SizedBox(
                height: 13,
              ),
              Obx(() => Flexible(
                    child: FavorotiesButton(
                      text: "Zurich",
                      onPressed: () => {},
                      widthofButton: screenWidth * 0.834,
                      heightofButton: 0.197 * screenHeight,
                      borderRadius: 20,
                      isLoading: controller.isSearchActive.value,
                    ),
                  )),
            ],
          ),
        )));
  }
}
