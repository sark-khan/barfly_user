import 'package:barfly_user/appConstants.dart';
import 'package:barfly_user/commonFunctions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Obtain the screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05, // Responsive horizontal padding
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.12), // Responsive top space

            Center(
              child: Container(
                margin: EdgeInsets.only(left: 0),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: getResponsiveFontSize(
                            screenWidth, screenHeight, 50)),
                    children: [
                      TextSpan(
                        text: "Your  ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: "Tickets",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(
                height: screenHeight * 0.02), // Space between title and content

            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF623E87), Color(0xFF473F88)],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          screenWidth * 0.05, // Responsive horizontal padding
                      vertical:
                          screenHeight * 0.02, // Responsive vertical padding
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: getResponsiveFontSize(
                                          screenWidth, screenHeight, 20)),
                                  children: [
                                    TextSpan(
                                        text: "XTRA",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: getResponsiveFontSize(
                                                screenWidth,
                                                screenHeight,
                                                30))),
                                  ],
                                ),
                              ),
                              Text(
                                "17.10.2024",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: getResponsiveFontSize(
                                        screenWidth, screenHeight, 20),
                                    fontWeight: FontWeight.w100),
                              ),
                            ],
                          ),
                          SizedBox(
                              height: screenHeight *
                                  0.01), // Space between row and text
                          Text(
                            "1 active ticket",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: getResponsiveFontSize(
                                    screenWidth, screenHeight, 20),
                                fontWeight: FontWeight.w100,
                                fontStyle: FontStyle.italic),
                          ),
                          SizedBox(
                              height: screenHeight *
                                  0.02), // Space within gradient container
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.01),
            Center(
              child: SizedBox(
                width: screenWidth * 0.5, // Adjust width as needed
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02), // Responsive padding
                      backgroundColor: Color.fromARGB(255, 117, 116, 116),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.white, width: 2),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Past Tickets!',
                              style: TextStyle(
                                fontFamily: "Helvetica",
                                color: Colors.white,
                                fontSize: getResponsiveFontSize(
                                    screenWidth, screenHeight, 23),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
                height: screenHeight * 0.50), // Space between button and bottom
          ],
        ),
      ),
    );
  }
}
