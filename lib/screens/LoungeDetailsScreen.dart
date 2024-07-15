import 'package:barfly_user/appConstants.dart';
import 'package:barfly_user/commonFunctions.dart';
import 'package:barfly_user/components/Buttons.dart';
import 'package:flutter/material.dart';

class LoungeDetailsScreen extends StatelessWidget {
  final String loungeName;
  final String persons;
  final String time;
  LoungeDetailsScreen(
      {required this.loungeName, required this.persons, required this.time});
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
                          Navigator.pushNamed(context, "/lounge-list-screen");
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
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, "/lounge-list-screen");
                              },
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
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Lounge ',
                                    style: TextStyle(
                                      fontFamily: "Helvetica",
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      fontSize: getResponsiveFontSize(
                                          screenWidth, screenHeight, 30),
                                    ),
                                  ),
                                  TextSpan(
                                    text: loungeName,
                                    style: TextStyle(
                                      fontFamily: "Helvetica",
                                      fontWeight:
                                          FontWeight.bold, // Make 'Gold' bold
                                      color: Colors.white,
                                      fontSize: getResponsiveFontSize(
                                          screenWidth, screenHeight, 30),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      SizedBox(
                        height: getResponsiveSizedBoxHeight(screenHeight, 18),
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                        child: IntrinsicHeight(
                          child: Container(
                            margin: const EdgeInsets.only(left: 0, bottom: 30),
                            width: screenWidth * 0.834,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                colors: [Color(0xFF623E87), Color(0xFF473F88)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.081,
                                  vertical: screenHeight * 0.037),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "person.png",
                                        scale: 0.1,
                                        color: Colors.white,
                                        width: 60.46,
                                        height: 60,
                                      ),
                                      SizedBox(
                                        width: 24,
                                      ),
                                      FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          "$persons\nPersons",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily: "Helvetica"),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "time.png",
                                        color: Colors.white,
                                        scale: 0.1,
                                        width: 60.46,
                                        height: 60,
                                      ),
                                      SizedBox(
                                        width: 24,
                                      ),
                                      Text(
                                        "22.30–02.30\n(4 Hours)",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontFamily: "Helvetica"),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 150,
                                        child: Image.asset(
                                          "loungeDetails.png",
                                          color: Colors.white,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 24,
                                      ),
                                      FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          "1Fl. Vodka\n1Fl. Gin\n1Fl. Ginger-Ale\n1Fl. Passoa",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily: "Helvetica"),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )),
                      Center(
                        child: Container(
                          margin:
                              const EdgeInsets.only(bottom: 44.0, top: 22.0),
                          width: 264,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, "/order-overview-screen");
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              backgroundColor: APP_COLORS
                                  .buttonColor, // Change this to your desired color
                            ),
                            child: Center(
                              child: Text(
                                'Reserve (CHF 599.0) ',
                                style: TextStyle(
                                  fontFamily: "Helvetica",
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]))));
  }
}
