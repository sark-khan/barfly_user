import 'package:barfly_user/Storage.dart';
import 'package:barfly_user/appConstants.dart';
import 'package:barfly_user/commonFunctions.dart';
import 'package:barfly_user/components/Buttons.dart';
import 'package:barfly_user/controller/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Add this import

class Menuscreen extends StatelessWidget {
  final String counterId;
  final String counterName;
  final String entityName;
  final String entityId;

  Menuscreen(
      {required this.counterId,
      required this.counterName,
      required this.entityId,
      required this.entityName});

  @override
  Widget build(BuildContext context) {
    print("${counterId} in the menu Screen");
    final MenuCategoryController controller =
        Get.put(MenuCategoryController(counterId));
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.0407),
                child: GestureDetector(
                  onTap: () {
                    Get.delete<MenuCategoryController>();
                    Storage.removeOrderDetails();
                    Storage.removeTotalOrderPrice();
                    Navigator.pop(context);
                  },
                  child: Container(
                      width: 34,
                      height: 32,
                      child: Image.asset("back_button.png")),
                ),
              ),
              SizedBox(
                height: getResponsiveSizedBoxHeight(screenHeight, 59),
              ),
              Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: screenWidth * 0.0407),
                  child: Text(
                    counterName,
                    style: TextStyle(
                        fontFamily: "Helvetica",
                        color: Colors.white,
                        fontSize: 45,
                        height: 0.9,
                        fontWeight: FontWeight.w800),
                  )),
              SizedBox(
                height: getResponsiveSizedBoxHeight(screenHeight, 13),
              ),
              Expanded(
                child: FutureBuilder(
                  future: controller.fetchMenuCategory(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (controller.menuLists.isEmpty) {
                      return Center(child: Text('No data available'));
                    } else {
                      return SingleChildScrollView(
                        padding: const EdgeInsets.only(bottom: 100),
                        child: Align(
                          alignment: screenWidth > 603
                              ? Alignment.centerLeft
                              : Alignment.center,
                          child: Wrap(
                            spacing:
                                screenWidth < 393 ? screenWidth * 0.0610 : 24,
                            runSpacing: 24,
                            children: [
                              ...controller.menuLists.map((menu) {
                                return InsiderButton(
                                  widthofButton: screenWidth < 393
                                      ? screenWidth * 0.3867
                                      : 152,
                                  heightofButton: screenHeight < 852
                                      ? 168
                                      : screenHeight * 0.1971,
                                  borderRadius: 20,
                                  text: menu.name,
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, "/menu-items-screen",
                                        arguments: {
                                          "menuId": menu.id,
                                          "menuCategoryName": menu.name
                                        });
                                  },
                                  imagePath: "SoftDrinks.png", // Example path
                                  useSvg: menu.icon.endsWith(".svg"),
                                );
                              }).toList(),
                              // InsiderButton(
                              //   widthofButton: screenWidth < 393
                              //       ? screenWidth * 0.3857
                              //       : 152,
                              //   heightofButton: screenHeight < 852
                              //       ? 168
                              //       : screenHeight * 0.2171,
                              //   borderRadius: 20,
                              //   text: "Feedback",
                              //   onPressed: () {},
                              //   imagePath: "Feedback.png", // Example path
                              //   useSvg: false, // Flag to use SVG
                              // ),
                              InsiderButton(
                                widthofButton: screenWidth < 393
                                    ? screenWidth * 0.3867
                                    : 152,
                                heightofButton: screenHeight < 852
                                    ? 168
                                    : screenHeight * 0.1971,
                                borderRadius: 20,
                                text: "Favorites",
                                onPressed: () {},
                                imagePath: "favorites.png", // Example path
                                useSvg: false, // Flag to use SVG
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
