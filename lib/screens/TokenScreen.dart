import 'package:barfly_user/appConstants.dart';
import 'package:barfly_user/commonFunctions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TokenScreen extends StatelessWidget {
  const TokenScreen({Key? key}) : super(key: key); // add a name key parameter
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return (PopScope(
        canPop: true,
        child: (Scaffold(
            body: Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.08142, right: screenWidth * 0.08396),
                child: (Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/account-details-screen");
                      },
                      child: Container(
                        width: 34,
                        height: 32,
                        margin: const EdgeInsets.only(left: 16),
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
                                    context, "/account-details-screen");
                              },
                              icon: const Icon(
                                Icons.chevron_left,
                                color: APP_COLORS.searchIconColor,
                                size: 30,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 16),
                      child: RichText(
                          text: const TextSpan(
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                              children: [
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Overview ",
                                  style: TextStyle(fontWeight: FontWeight.w100),
                                ),
                                TextSpan(
                                  text: "Tokens",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ])),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        height: getResponsiveSizedBoxHeight(screenHeight, 496),
                        width: getResponsiveSizedBoxWidth(screenWidth, 328),
                        margin: const EdgeInsets.only(left: 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                            colors: [Color(0xFF623E87), Color(0xFF473F88)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: RichText(
                              text: const TextSpan(
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 40),
                                  children: [
                                TextSpan(
                                    text: "XTRA ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25)),
                                TextSpan(
                                    text: "(60 Tokens)\n",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 25)),
                                TextSpan(
                                    text: "Kaufleuten ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25)),
                                TextSpan(
                                    text: "(55 Tokens)\n",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 25)),
                                TextSpan(
                                    text: "Jade ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25)),
                                TextSpan(
                                    text: "(40 Tokens)",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 25)),
                              ])),
                        ),
                      ),
                    ),
                  ],
                )))))));
  }
}
