import 'package:barfly_user/Storage.dart';
import 'package:barfly_user/appConstants.dart';
import 'package:barfly_user/commonFunctions.dart';
import 'package:barfly_user/components/BottomNavigator.dart';
import 'package:barfly_user/components/Buttons.dart';
import 'package:barfly_user/controller/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Add this import

class InsiderScreen extends StatelessWidget {
  final String entityId;
  final String entityName;

  InsiderScreen({required this.entityId, required this.entityName});

  @override
  Widget build(BuildContext context) {
    final InsiderController controller = Get.put(InsiderController(entityId));
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

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
                GestureDetector(
                  onTap: () {
                    Storage.removeOrderDetails();
                    Storage.removeTotalOrderPrice();
                    Navigator.pushNamed(context, "/home-screen");
                  },
                  child: Container(
                    width: 34,
                    height: 32,
                    margin: const EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                      color: AppColors.searchButtonBackgroundColor,
                      borderRadius: BorderRadius.circular(
                          12.0), // Adjust the radius as needed
                    ),
                    child: Center(
                      child: IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                          Storage.removeOrderDetails();
                          Storage.removeTotalOrderPrice();
                          Navigator.pushNamed(context, "/home-screen");
                        },
                        icon: const Icon(
                          Icons.chevron_left,
                          color: AppColors.searchIconColor,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getResponsiveSizedBoxHeight(screenHeight, 59),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: getResponsiveSizedBoxWidth(screenWidth, 32)),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Helvetica',
                          fontSize: getResponsiveFontSize(
                              screenWidth, screenHeight, 40),
                        ),
                        children: [
                          TextSpan(
                            text: entityName,
                            style: TextStyle(
                              fontFamily: "Helvetica",
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getResponsiveSizedBoxHeight(screenHeight, 13),
                ),
                Expanded(
                  child: FutureBuilder(
                    future: controller.fetchCounters(entityId),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (controller.counterLists.isEmpty) {
                        return Center(child: Text('No data available'));
                      } else {
                        return SingleChildScrollView(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: Wrap(
                            spacing: 24,
                            runSpacing: 20,
                            children: [
                              ...controller.counterLists.map((counter) {
                                return InsiderButton(
                                  widthofButton: screenWidth < 393
                                      ? screenWidth * 0.3857
                                      : 152,
                                  heightofButton: screenHeight < 852
                                      ? 168
                                      : screenHeight * 0.2171,
                                  borderRadius: 20,
                                  text: counter.counterName,
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, "/menu-category-screen",
                                        arguments: {
                                          "entityId": entityId,
                                          "entityName": entityName,
                                          "counterName": counter.counterName,
                                          "counterId": counter.id
                                        });
                                  },
                                  imagePath: "Icon_Counter.svg",
                                  useSvg: true,
                                );
                              }).toList(),
                              InsiderButton(
                                widthofButton: screenWidth < 393
                                    ? screenWidth * 0.3857
                                    : 152,
                                heightofButton: screenHeight < 852
                                    ? 168
                                    : screenHeight * 0.2171,
                                borderRadius: 20,
                                text: "Feedback",
                                onPressed: () {},
                                imagePath: "Feedback.png",
                                useSvg: false,
                              ),
                              InsiderButton(
                                widthofButton: screenWidth < 393
                                    ? screenWidth * 0.3857
                                    : 152,
                                heightofButton: screenHeight < 852
                                    ? 168
                                    : screenHeight * 0.2171,
                                borderRadius: 20,
                                text: "Lounge",
                                imagePath: "Lounge.png",
                                useSvg: false,
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    "/lounge-list-screen",
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
                // Container(
                //   alignment: Alignment.center,
                //   margin: EdgeInsets.only(bottom: 30),
                //   child: BottomNavigator(
                //     onPressed: () => {},
                //     text: "dsds",
                //     imagePath: "sdsdsd",
                //     widthofButton: 200,
                //     heightofButton: 56,
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
