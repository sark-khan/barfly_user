import 'package:barfly_user/appConstants.dart';
import 'package:barfly_user/commonFunctions.dart';
import 'package:barfly_user/components/BottomNavigator.dart';
import 'package:barfly_user/components/Buttons.dart';
import 'package:barfly_user/controller/home_controller.dart';
import 'package:barfly_user/services/ApiService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    controller.fetchEntities("");
    return PopScope(
      canPop: true,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.08142, right: screenWidth * 0.08396),
          child: Stack(children: [
            Column(
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
                          style: const TextStyle(
                              fontSize: 12, color: Colors.white),
                          decoration: InputDecoration(
                            prefixIcon: IconButton(
                              icon: const Icon(Icons.search),
                              onPressed: () {
                                // print("dsadsadsa");
                              },
                              padding: const EdgeInsets.symmetric(vertical: 5),
                            ),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                controller.toggleSearch();
                                controller.fetchEntities("");
                              },
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
                          onChanged: (value) {
                            {
                              controller.fetchEntities(value);
                            }
                          },
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          controller.toggleSearch();
                        },
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
                    ? const SizedBox(
                        height: 0,
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller
                                  .mostPopularButtonPressed(); // Set most popular size
                            },
                            child: Container(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text(
                                'Most Popular',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: "Helvetica",
                                  fontSize:
                                      controller.mostPopularFontSize.value,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.favouritesButtonPressed();
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Text(
                                    'Favorites',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: "Helvetica",
                                      fontSize:
                                          controller.favoritesFontSize.value,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: controller.favoritesFontSize.value,
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                const SizedBox(
                  height: 13,
                ),
                Expanded(child: Obx(() {
                  if (controller.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  } else if (controller.remainingEvents.isEmpty &&
                      controller.ongoingEvents.isEmpty) {
                    return Center(child: Text('No data available'));
                  } else {
                    return SingleChildScrollView(
                      child: Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: [
                          ...controller.ongoingEvents.map((entity) {
                            return FavorotiesButton(
                              entityId: entity.id,
                              location: entity.city,
                              entityName: entity.entityName,
                              status: true,
                              homeController: controller,
                              onPressed: () => {
                                Navigator.pushNamed(context, "/insider-screen",
                                    arguments: {
                                      "entityId": entity.id,
                                      "entityName": entity.entityName
                                    })
                              },
                              onClick: () =>
                                  {controller.toggleStarIcon(entity.id)},
                              widthofButton:
                                  screenWidth > 650 ? 328 : screenWidth * 0.834,
                              heightofButton: getResponsiveSizedBoxHeight(
                                  screenHeight, 168),
                              borderRadius: 20,
                              isLoading: controller.isLoading.value,
                            );
                          }).toList(),
                          ...controller.remainingEvents.map((entity) {
                            return FavorotiesButton(
                              homeController: controller,
                              location: entity.city,
                              entityName: entity.entityName,
                              entityId: entity.id,
                              status: false,
                              onPressed: () => {
                                Navigator.pushNamed(context, "/insider-screen",
                                    arguments: {
                                      "entityId": entity.id,
                                      "entityName": entity.entityName
                                    })
                              },
                              widthofButton:
                                  screenWidth > 650 ? 328 : screenWidth * 0.834,
                              heightofButton: 168,
                              borderRadius: 20,
                              isLoading: controller.isLoading.value,
                              onClick: () =>
                                  {controller.toggleStarIcon(entity.id)},
                            );
                          }).toList(),
                        ],
                      ),
                    );
                  }
                }))
                //       }
                //     },
                //   ),
                // )),
                // Container(
                //   alignment: Alignment.center,
                //   margin: EdgeInsets.only(bottom: 30, top: 30),
                //   child: BottomNavigator(
                //     onPressed: () => {},
                //     text: "dsds",
                //     imagePath: "sdsdsd",
                //     widthofButton: 200,
                //     heightofButton: 56,
                //     borderRadius: 30,
                //   ),
                // )
              ],
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 30),
              child: BottomNavigator(
                onPressed: () => {},
                text: "dsds",
                imagePath: "sdsdsd",
                widthofButton: 200,
                heightofButton: 56,
                borderRadius: 30,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
