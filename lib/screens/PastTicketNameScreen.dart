import 'package:barfly_user/appConstants.dart';
import 'package:barfly_user/commonFunctions.dart';
import 'package:barfly_user/components/Buttons.dart';
import 'package:barfly_user/components/Search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PastTicketNameScreen extends StatelessWidget {
  const PastTicketNameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05, // Responsive horizontal padding
        ),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.08),
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
                SizedBox(
                  width: screenWidth * 0.6,
                ),
                SearchComponent(
                  onPressed: () {
                    // Define the action when the icon button is pressed
                  },
                  routeName: '/home-screen',
                ),
              ],
            ),
            const SizedBox(height: 40),
            Center(
              child: RichText(
                textAlign:
                    TextAlign.center, // Center the text in the RichText widget
                text: TextSpan(
                  style: TextStyle(
                      color: Colors.white,
                      fontSize:
                          getResponsiveFontSize(screenWidth, screenHeight, 30)),
                  children: [
                    const TextSpan(
                      text: "Kaufleuten  ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                      text: "Tickets\n",
                      style: TextStyle(fontWeight: FontWeight.w100),
                    ),
                    WidgetSpan(
                      child: Container(
                        width: double.infinity, // Take up full width
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "2024",
                            style: TextStyle(
                                fontWeight: FontWeight.w100,
                                color: Colors.white,
                                fontSize: getResponsiveFontSize(
                                    screenWidth, screenHeight, 30)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.02),
            // Use Expanded to take up remaining space
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
                            child: TicketYearButton(
                              text1: "Kaufleuten",
                              text2: '10.08.2024',
                              onPressed: () => {},
                              widthofButton: screenWidth * 0.834,
                              heightofButton: 0.123 * screenHeight,
                              borderRadius: 20,
                              isLoading: false,
                            ),
                          ),
                          Flexible(
                            child: TicketYearButton(
                              text1: "Kaufleuten",
                              text2: '10.08.2024',
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
