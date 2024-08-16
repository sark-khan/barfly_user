import 'package:barfly_user/appConstants.dart';
import 'package:barfly_user/commonFunctions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalDataScreen extends StatelessWidget {
  const PersonalDataScreen({Key? key})
      : super(key: key); // add a name key parameter
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
                    SizedBox(height: screenHeight * 0.10),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/account-details-screen");
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
                                Navigator.pushNamed(
                                    context, "/account-details-screen");
                              },
                              icon: const Icon(
                                Icons.chevron_left,
                                color: AppColors.searchIconColor,
                                size: 30,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.08),
                    Container(
                      margin: const EdgeInsets.only(left: 16),
                      child: RichText(
                          text: const TextSpan(
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: 'Helvetica'),
                              children: [
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Personal ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'Helvetica'),
                                ),
                                TextSpan(
                                  text: "Data",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'Helvetica'),
                                ),
                              ],
                            )
                          ])),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Expanded(
                      child: SingleChildScrollView(
                        child: IntrinsicHeight(
                          child: Container(
                            margin: const EdgeInsets.only(left: 0, bottom: 30),
                            width: screenWidth * 0.834,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                colors: [
                                  Color(0xFF623E87), // Dark Blue
                                  Color(0xFF473F88), // Blue/Purple
                                ],
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: RichText(
                                  text: TextSpan(
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 40),
                                      children: [
                                    const TextSpan(
                                        text: "Name :\n",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 15,
                                            fontFamily: 'Helvetica')),
                                    const TextSpan(
                                        text: "Tobias Keller\n\n\n",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            fontFamily: 'Helvetica')),
                                    const TextSpan(
                                        text: "Flytag :\n",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 15,
                                            fontFamily: 'Helvetica')),
                                    const TextSpan(
                                        text: "@tobii3\n\n\n",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            fontFamily: 'Helvetica')),
                                    const TextSpan(
                                        text: "Date of birth :\n",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 15,
                                            fontFamily: 'Helvetica')),
                                    const TextSpan(
                                        text: "12.10.2000\n\n\n",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            fontFamily: 'Helvetica')),
                                    const TextSpan(
                                        text: "Residential address :\n",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 15,
                                            fontFamily: 'Helvetica')),
                                    const TextSpan(
                                        text: "Talweg 15 \n",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            fontFamily: 'Helvetica')),
                                    const TextSpan(
                                        text: "8708 Männedorf \n",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            fontFamily: 'Helvetica')),
                                    const TextSpan(
                                        text: "Schweiz \n\n\n",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            fontFamily: 'Helvetica')),
                                    const TextSpan(
                                        text: "Phone number :\n",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 15,
                                            fontFamily: 'Helvetica')),
                                    const TextSpan(
                                        text: "+41 79 330 23 90\n\n\n",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            fontFamily: 'Helvetica')),
                                    const TextSpan(
                                        text: "E-Mail :\n",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 15,
                                            fontFamily: 'Helvetica')),
                                    const TextSpan(
                                        text: "tobias.keller@yahoo.ch\n\n\n",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            fontFamily: 'Helvetica')),
                                    WidgetSpan(
                                      child: GestureDetector(
                                        onTap: () => {
                                          Navigator.pushNamed(
                                              context, "/delete-screen")
                                        },
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(Icons.delete,
                                                size: 20, color: Colors.white),
                                            SizedBox(
                                                width:
                                                    3), // Optional: Adds space between icon and text
                                            Text(
                                              "Delete Account",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w100,
                                                fontSize: 10,
                                                color: Colors
                                                    .white, // Ensure text color matches icon color
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ])),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )))))));
  }
}
