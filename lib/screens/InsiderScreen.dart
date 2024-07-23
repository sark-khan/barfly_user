import 'package:barfly_user/appConstants.dart';
import 'package:barfly_user/commonFunctions.dart';
import 'package:barfly_user/components/Buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InsiderScreen extends StatefulWidget {
  @override
  State createState() => _InsiderScreenState();
}

class _InsiderScreenState extends State<InsiderScreen> {
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
                  GestureDetector(
                    onTap: () {
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
                            onPressed: () {},
                            icon: const Icon(
                              Icons.chevron_left,
                              color: AppColors.searchIconColor,
                              size: 30,
                            )),
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
                                      screenWidth, screenHeight, 40)),
                              children: [
                            TextSpan(
                                text: "Inside ",
                                style: TextStyle(fontWeight: FontWeight.w100)),
                            TextSpan(
                                text: "XTRA",
                                style: TextStyle(fontWeight: FontWeight.w900))
                          ])),
                    ),
                  ),
                  SizedBox(
                    height: getResponsiveSizedBoxHeight(screenHeight, 13),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: InsiderButton(
                                    widthofButton: screenWidth * 0.3867,
                                    heightofButton: screenHeight * 0.2171,
                                    borderRadius: 20,
                                    text: "Bar/Menu",
                                    onPressed: () {},
                                    imagePath: "BarMenuIcon.png"),
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              Flexible(
                                child: InsiderButton(
                                    widthofButton: screenWidth * 0.3867,
                                    heightofButton: screenHeight * 0.2171,
                                    borderRadius: 20,
                                    text: "Lounge",
                                    onPressed: () {},
                                    imagePath: "Lounge.png"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: InsiderButton(
                                widthofButton: screenWidth * 0.3867,
                                heightofButton: screenHeight * 0.2171,
                                borderRadius: 20,
                                text: "Feedback",
                                onPressed: () {},
                                imagePath: "Feedback.png"),
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          Flexible(
                            child: InsiderButton(
                                widthofButton: screenWidth * 0.3867,
                                heightofButton: screenHeight * 0.2171,
                                borderRadius: 20,
                                text: "Tokens",
                                onPressed: () {},
                                imagePath: "Lounge.png"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }
}
