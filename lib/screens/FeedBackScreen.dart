import 'package:barfly_user/appConstants.dart';
import 'package:barfly_user/commonFunctions.dart';
import 'package:barfly_user/components/Buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Feedbackscreen extends StatelessWidget {
  const Feedbackscreen({Key? key}) : super(key: key);

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
              ],
            ),
            SizedBox(height: 40),
            Center(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:
                        getResponsiveFontSize(screenWidth, screenHeight, 40),
                  ),
                  children: [
                    const TextSpan(
                      text: "Feedback  ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
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
                            child: FeedBackButton(
                              text: "Atmosphere",
                              onPressed: () => {},
                              widthofButton: screenWidth * 0.834,
                              heightofButton: 0.123 * screenHeight,
                              borderRadius: 20,
                              isLoading: false,
                              updateTotalValue: (double sliderValue,
                                  String text, String param1, String param2) {
                                // Your logic here to handle the slider value update
                                print('Slider Value: $sliderValue');
                                print('Text: $text');
                                print('Param1: $param1');
                                print('Param2: $param2');
                              },
                            ),
                          ),
                          Flexible(
                            child: FeedBackTextButton(
                              onPressed: () => {},
                              widthofButton: screenWidth * 0.834,
                              heightofButton: 0.123 * screenHeight,
                              borderRadius: 20,
                              isLoading: false,
                              updateTotalValue: (double sliderValue,
                                  String text, String param1) {
                                // Your logic here to handle the slider value update
                                print('Slider Value: $sliderValue');
                                print('Text: $text');
                                print('Param1: $param1');
                              },
                            ),
                          ),
                          Flexible(
                            child: FeedBackButton(
                              text: "Atmosphere",
                              onPressed: () => {},
                              widthofButton: screenWidth * 0.834,
                              heightofButton: 0.123 * screenHeight,
                              borderRadius: 20,
                              isLoading: false,
                              updateTotalValue: (double sliderValue,
                                  String text, String param1, String param2) {
                                // Your logic here to handle the slider value update
                                print('Slider Value: $sliderValue');
                                print('Text: $text');
                                print('Param1: $param1');
                                print('Param2: $param2');
                              },
                            ),
                          ),
                          Flexible(
                            child: FeedBackTextButton(
                              onPressed: () => {},
                              widthofButton: screenWidth * 0.834,
                              heightofButton: 0.123 * screenHeight,
                              borderRadius: 20,
                              isLoading: false,
                              updateTotalValue: (double sliderValue,
                                  String text, String param1) {
                                // Your logic here to handle the slider value update
                                print('Slider Value: $sliderValue');
                                print('Text: $text');
                                print('Param1: $param1');
                              },
                            ),
                          ),
                          Flexible(
                            child: FeedBackButton(
                              text: "Atmosphere",
                              onPressed: () => {},
                              widthofButton: screenWidth * 0.834,
                              heightofButton: 0.123 * screenHeight,
                              borderRadius: 20,
                              isLoading: false,
                              updateTotalValue: (double sliderValue,
                                  String text, String param1, String param2) {
                                // Your logic here to handle the slider value update
                                print('Slider Value: $sliderValue');
                                print('Text: $text');
                                print('Param1: $param1');
                                print('Param2: $param2');
                              },
                            ),
                          ),
                          Flexible(
                            child: FeedBackTextButton(
                              onPressed: () => {},
                              widthofButton: screenWidth * 0.834,
                              heightofButton: 0.123 * screenHeight,
                              borderRadius: 20,
                              isLoading: false,
                              updateTotalValue: (double sliderValue,
                                  String text, String param1) {
                                // Your logic here to handle the slider value update
                                print('Slider Value: $sliderValue');
                                print('Text: $text');
                                print('Param1: $param1');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
                          vertical: screenHeight * 0.02), // Responsive padding
                      backgroundColor: Color.fromARGB(255, 59, 198, 233),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                            color: Color.fromARGB(255, 63, 173, 247), width: 2),
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
                              'Send Feedback!',
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
            SizedBox(height: screenHeight * 0.05),
          ],
        ),
      ),
    );
  }
}
