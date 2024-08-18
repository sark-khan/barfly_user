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
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: screenWidth * 0.0407),
                  child: GestureDetector(
                    onTap: () {
                      Storage.removeOrderDetails();
                      Storage.removeTotalOrderPrice();
                      // Navigator.pop(context);
                      Navigator.pushNamed(context, "/home-screen");
                    },
                    child: Container(
                        width: 34,
                        height: 32,
                        child: Image.asset("back_button.png")),
                  ),
                ),
                SizedBox(
                  height: 39,
                ),
                Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.0407),
                    child: Text(
                      entityName,
                      style: TextStyle(
                          fontFamily: "Helvetica",
                          color: Colors.white,
                          fontSize: 45,
                          height: 0.9,
                          fontWeight: FontWeight.w800),
                    )),

                SizedBox(
                  height: 19,
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
                        return const Center(child: Text('No data available'));
                      } else {
                        return Expanded(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.only(bottom: 100),
                            child: Align(
                              alignment: screenWidth > 603
                                  ? Alignment.centerLeft
                                  : Alignment.center,
                              child: Wrap(
                                spacing: screenWidth < 393
                                    ? screenWidth * 0.0610
                                    : 24,
                                runSpacing: 24,
                                children: [
                                  ...controller.counterLists.map((counter) {
                                    return InsiderButton(
                                      isCounter: true,
                                      widthofButton: screenWidth < 393
                                          ? screenWidth * 0.3867
                                          : 152,
                                      heightofButton: screenHeight < 852
                                          ? 168
                                          : screenHeight * 0.1971,
                                      borderRadius: 20,
                                      text: counter.counterName,
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, "/menu-category-screen",
                                            arguments: {
                                              "entityId": entityId,
                                              "entityName": entityName,
                                              "counterName":
                                                  counter.counterName,
                                              "counterId": counter.id
                                            });
                                      },
                                      imagePath: "Icon_Counter.svg",
                                      useSvg: true,
                                      statusOpen: false,
                                      statusSoon: true,
                                    );
                                  }).toList(),
                                  InsiderButton(
                                    isCounter: false,
                                    widthofButton: screenWidth < 393
                                        ? screenWidth * 0.3867
                                        : 152,
                                    heightofButton: screenHeight < 852
                                        ? 168
                                        : screenHeight * 0.1971,
                                    borderRadius: 20,
                                    text: "Feedback",
                                    onPressed: () {},
                                    imagePath: "Feedback.png",
                                    useSvg: false,
                                  ),
                                  InsiderButton(
                                    isCounter: false,
                                    widthofButton: screenWidth < 393
                                        ? screenWidth * 0.3867
                                        : 152,
                                    heightofButton: screenHeight < 852
                                        ? 168
                                        : screenHeight * 0.1971,
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
                            ),
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
                borderRadius: 20,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
