import 'package:barfly_user/appConstants.dart';
import 'package:barfly_user/commonFunctions.dart';
import 'package:barfly_user/components/Buttons.dart';
import 'package:flutter/material.dart';

class LoungeList extends StatelessWidget {
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return PopScope(
        canPop: true,
        child: Scaffold(
            body: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.122),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenHeight * 0.04812,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/insider-screen");
                        },
                        child: Container(
                          width: 34,
                          height: 32,
                          decoration: BoxDecoration(
                            color: APP_COLORS.searchButtonBackgroundColor,
                            borderRadius: BorderRadius.circular(
                                12.0), // Adjust the radius as needed
                          ),
                          child: Center(
                            child: IconButton(
                              padding: const EdgeInsets.all(0),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.chevron_left,
                                color: APP_COLORS.searchIconColor,
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
                          child: Text(
                            "Lounge",
                            style: TextStyle(
                              fontFamily: "Helvetica",
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: getResponsiveFontSize(
                                  screenWidth, screenHeight, 40),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getResponsiveSizedBoxHeight(screenHeight, 18),
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child:
                                  Wrap(spacing: 20, runSpacing: 20, children: [
                                LoungeListButton(
                                  loungeName: "Gold",
                                  time: "22.30–02.30 / 4h",
                                  people: "8-10",
                                  onPressed: () => {
                                    Navigator.pushNamed(
                                        context, "/lounge-details-screen",
                                        arguments: {
                                          "loungeName": "Gold",
                                          "persons": "8-10",
                                          "time": "22.30–02.30\n4h",
                                        })
                                  },
                                  borderRadius: 20,
                                  maxWidth: 350,
                                  minWidth: 350,
                                ),
                                LoungeListButton(
                                  loungeName: "Premium",
                                  time: "22.30–03.30 / 5h",
                                  people: "2-3",
                                  onPressed: () => {
                                    Navigator.pushNamed(
                                        context, "/lounge-details-screen",
                                        arguments: {
                                          "loungeName": "Premium",
                                          "persons": "2-3",
                                          "time": "2.30–03.30\n5h",
                                        })
                                  },
                                  borderRadius: 20,
                                  maxWidth: 350,
                                  minWidth: 350,
                                ),
                                LoungeListButton(
                                  loungeName: "Basic",
                                  time: "20.30–02.30 / 6h",
                                  people: "5-10",
                                  onPressed: () => {
                                    Navigator.pushNamed(
                                        context, "/lounge-details-screen",
                                        arguments: {
                                          "loungeName": "Basic",
                                          "persons": "5-10",
                                          "time": "20.30–02.30\n6h",
                                        })
                                  },
                                  borderRadius: 20,
                                  maxWidth: 350,
                                  minWidth: 350,
                                )
                              ]),
                            )
                          ],
                        ),
                      ))
                    ]))));
  }
}
