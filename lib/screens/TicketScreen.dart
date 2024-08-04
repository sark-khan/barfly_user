import 'package:barfly_user/appConstants.dart';
import 'package:barfly_user/commonFunctions.dart';
import 'package:barfly_user/components/Buttons.dart';
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
                            screenWidth, screenHeight, 35)),
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
                padding: const EdgeInsets.only(bottom: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          Flexible(
                            child: TicketDateButton(
                              text1: "XTRA ",
                              text2: '17.10.2024',
                              text3: '1 active ticket',
                              onPressed: () => {},
                              widthofButton: screenWidth * 0.834,
                              heightofButton: 0.123 * screenHeight,
                              borderRadius: 20,
                              isLoading: false,
                            ),
                          ),
                          Flexible(
                            child: TicketDateButton(
                              text1: "XTRA ",
                              text2: '17.10.2024',
                              text3: '1 active ticket',
                              onPressed: () => {},
                              widthofButton: screenWidth * 0.834,
                              heightofButton: 0.123 * screenHeight,
                              borderRadius: 20,
                              isLoading: false,
                            ),
                          ),
                          Flexible(
                            child: TicketDateButton(
                              text1: "XTRA ",
                              text2: '17.10.2024',
                              text3: '1 active ticket',
                              onPressed: () => {},
                              widthofButton: screenWidth * 0.834,
                              heightofButton: 0.123 * screenHeight,
                              borderRadius: 20,
                              isLoading: false,
                            ),
                          ),
                          Flexible(
                            child: TicketDateButton(
                              text1: "XTRA ",
                              text2: '17.10.2024',
                              text3: '1 active ticket',
                              onPressed: () => {},
                              widthofButton: screenWidth * 0.834,
                              heightofButton: 0.123 * screenHeight,
                              borderRadius: 20,
                              isLoading: false,
                            ),
                          ),
                          Flexible(
                            child: TicketDateButton(
                              text1: "XTRA ",
                              text2: '17.10.2024',
                              text3: '1 active ticket',
                              onPressed: () => {},
                              widthofButton: screenWidth * 0.834,
                              heightofButton: 0.123 * screenHeight,
                              borderRadius: 20,
                              isLoading: false,
                            ),
                          ),
                          Flexible(
                            child: TicketDateButton(
                              text1: "XTRA ",
                              text2: '17.10.2024',
                              text3: '1 active ticket',
                              onPressed: () => {},
                              widthofButton: screenWidth * 0.834,
                              heightofButton: 0.123 * screenHeight,
                              borderRadius: 20,
                              isLoading: false,
                            ),
                          ),
                          Flexible(
                            child: TicketDateButton(
                              text1: "XTRA ",
                              text2: '17.10.2024',
                              text3: '1 active ticket',
                              onPressed: () => {},
                              widthofButton: screenWidth * 0.834,
                              heightofButton: 0.123 * screenHeight,
                              borderRadius: 20,
                              isLoading: false,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    Center(
                      child: SizedBox(
                        width: screenWidth * 0.5, // Adjust width as needed
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  vertical: screenHeight *
                                      0.02), // Responsive padding
                              backgroundColor:
                                  Color.fromARGB(255, 117, 116, 116),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(color: Colors.white, width: 2),
                              ),
                            ),
                            child: const Padding(
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
                                        fontSize: 23,
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
