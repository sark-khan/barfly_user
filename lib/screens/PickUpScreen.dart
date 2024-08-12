import 'package:barfly_user/appConstants.dart';
import 'package:barfly_user/commonFunctions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PickUpScreen extends StatelessWidget {
  const PickUpScreen({Key? key}) : super(key: key); // add a name key parameter
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
                      height: 60,
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(left: 0),
                        child: RichText(
                            text: const TextSpan(
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                                children: [
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Pick ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w100),
                                  ),
                                  TextSpan(
                                    text: "Up",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w100),
                                  ),
                                ],
                              )
                            ])),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Center(
                          child: Container(
                            constraints: BoxConstraints(
                              minHeight: screenHeight * 0.582,
                            ),
                            width: screenWidth * 0.834,
                            margin: const EdgeInsets.only(left: 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                colors: [Color(0xFF623E87), Color(0xFF473F88)],
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: getResponsiveFontSize(
                                              screenWidth, screenHeight, 20)),
                                      children: [
                                        TextSpan(
                                            text: "Pick up your order:\n\n",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: getResponsiveFontSize(
                                                    screenWidth,
                                                    screenHeight,
                                                    20))),
                                        TextSpan(
                                            text:
                                                "Turn on Push-Notifications!\n",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w100,
                                                fontSize: getResponsiveFontSize(
                                                    screenWidth,
                                                    screenHeight,
                                                    20),
                                                fontStyle: FontStyle.italic)),
                                        TextSpan(
                                            text: "Steps\n\n",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w100,
                                                fontSize: getResponsiveFontSize(
                                                    screenWidth,
                                                    screenHeight,
                                                    20),
                                                fontStyle: FontStyle.italic)),
                                        TextSpan(
                                            text:
                                                "1. Process – Go to the counter!\n\n",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w100,
                                                fontSize: getResponsiveFontSize(
                                                    screenWidth,
                                                    screenHeight,
                                                    20))),
                                        TextSpan(
                                            text:
                                                "2. Ready – Pick up your order!",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w100,
                                                fontSize: getResponsiveFontSize(
                                                    screenWidth,
                                                    screenHeight,
                                                    20))),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  SizedBox(
                                    width: screenWidth *
                                        0.5, // Set the desired width here
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16),
                                        backgroundColor: Color(0xFF623E87),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          side: BorderSide(
                                              color: Colors.white, width: 2),
                                        ),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'Got It!',
                                                style: TextStyle(
                                                  fontFamily: "Helvetica",
                                                  color: Colors.white,
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )))))));
  }
}
