import 'package:barfly_user/appConstants.dart';
import 'package:barfly_user/commonFunctions.dart';
import 'package:barfly_user/components/Buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPickupQrScreen extends StatelessWidget {
  const MenuPickupQrScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Obtain the screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.1, // Responsive horizontal padding
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.12), // Responsive top space
            Row(
              children: [
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
                      borderRadius: BorderRadius.circular(12.0),
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
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Center(
              child: Container(
                margin: EdgeInsets.only(left: 0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: getResponsiveFontSize(
                                screenWidth, screenHeight, 30)),
                        children: [
                          TextSpan(
                            text: "Kaufleuten ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Helvetica'),
                          ),
                          TextSpan(
                            text: "Tickets \n",
                            style: TextStyle(
                                fontWeight: FontWeight.w100,
                                fontFamily: 'Helvetica'),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0, // Adjust position as needed
                      child: Text(
                        "10.08.2024",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: getResponsiveFontSize(
                                screenWidth, screenHeight, 30),
                            fontWeight: FontWeight.w100,
                            fontFamily: 'Helvetica'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          Flexible(
                            child: TicketQrPickupButton(
                              text1: "40 ",
                              text2: '1x ',
                              text3: 'Red Bull',
                              text4: '22:06:32 ',
                              onPressed: () => {},
                              widthofButton: screenWidth * 0.834,
                              heightofButton: 0.123 * screenHeight,
                              borderRadius: 20,
                              isLoading: false,
                              imagePath: "qr-code.png",
                              isVisible: true,
                            ),
                          ),
                          Flexible(
                            child: TicketQrPickupButton(
                                text1: "40 ",
                                text2: '1x ',
                                text3: 'Red Bull',
                                text4: '22:06:32 ',
                                onPressed: () => {},
                                widthofButton: screenWidth * 0.834,
                                heightofButton: 0.123 * screenHeight,
                                borderRadius: 20,
                                isLoading: false,
                                imagePath: "qr-code.png",
                                isVisible: true),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
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
