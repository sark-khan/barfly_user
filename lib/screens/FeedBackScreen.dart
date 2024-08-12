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
        padding: EdgeInsets.all(35.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:
                        getResponsiveFontSize(screenWidth, screenHeight, 40),
                  ),
                  children: [
                    TextSpan(
                      text: "Feedback",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontFamily: 'Helvetica'),
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
                  mainAxisAlignment: MainAxisAlignment.start,
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
            SizedBox(height: screenHeight * 0.02),
            Center(
              child: Container(
                height: 80,
                width: 350,
                decoration: BoxDecoration(
                  color: const Color(
                      0xFF34396F), // Background color of the text field container
                  borderRadius: BorderRadius.circular(20.0), // Rounded corners
                  border: Border.all(
                    color: Color(0xFF34396F), // Border color
                    width: 2.0, // Border width
                  ),
                ),
                child: const TextField(
                  maxLines: null,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Helvetica',
                    color: Colors.white, // Set the text color
                  ),
                  decoration: const InputDecoration(
                    hintText: 'General Feedback?',
                    hintStyle: TextStyle(
                      fontFamily: 'Helvetica',
                      color: Colors.white, // Set the hint color
                    ),
                    border: InputBorder.none, // Remove the underline
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0), // Padding inside the text field
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Center(
              child: SizedBox(
                width: screenWidth * 0.5, // Adjust width as needed
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02), // Responsive padding
                      backgroundColor: Color(0xFF35D1D1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: const BorderSide(
                            color: Color(0xFF35D1D1), width: 2),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 300,
                              child: const Center(
                                child: Text(
                                  'Send Feedback!',
                                  style: TextStyle(
                                    fontFamily: "Helvetica",
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
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
            ),
            SizedBox(height: screenHeight * 0.05),
          ],
        ),
      ),
    );
  }
}
