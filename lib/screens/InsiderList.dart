import 'package:barfly_user/appConstants.dart';
import 'package:barfly_user/components/Buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InsiderScreen extends StatefulWidget {
  @override
  State createState() => _InsiderScreenState();
}

class _InsiderScreenState extends State<InsiderScreen> {
  // bool _isSearchActive = false;

  void _toggleSearch() {
    setState(() {
      // _isSearchActive = !_isSearchActive;
    });
  }

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
                    color: APP_COLORS.searchButtonBackgroundColor,
                    borderRadius: BorderRadius.circular(
                        12.0), // Adjust the radius as needed
                  ),
                  child: Center(
                    child: IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.chevron_left,
                          color: APP_COLORS.searchIconColor,
                          size: 30,
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.0457,
              ),
              Container(
                margin: const EdgeInsets.only(left: 16),
                child: RichText(
                    text: const TextSpan(
                        style: TextStyle(color: Colors.white, fontSize: 40),
                        children: [
                      TextSpan(
                          text: "Inside ",
                          style: TextStyle(fontWeight: FontWeight.w100)),
                      TextSpan(
                          text: "XTRA",
                          style: TextStyle(fontWeight: FontWeight.w900))
                    ])),
              ),
              SizedBox(
                height: 13,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InsiderButton(
                          widthofButton: screenWidth * 0.3867,
                          heightofButton: screenHeight * 0.2171,
                          borderRadius: 20,
                          text: "Bar/Menu",
                          onPressed: () {},
                          imagePath: "BarMenuIcon.png"),
                      SizedBox(
                        width: 24,
                      ),
                      InsiderButton(
                          widthofButton: screenWidth * 0.3867,
                          heightofButton: screenHeight * 0.2171,
                          borderRadius: 20,
                          text: "Lounge",
                          onPressed: () {},
                          imagePath: "Lounge.png"),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InsiderButton(
                          widthofButton: screenWidth * 0.3867,
                          heightofButton: screenHeight * 0.2171,
                          borderRadius: 20,
                          text: "Feedback",
                          onPressed: () {},
                          imagePath: "Feedback.png"),
                      SizedBox(
                        width: 24,
                      ),
                      InsiderButton(
                          widthofButton: screenWidth * 0.3867,
                          heightofButton: screenHeight * 0.2171,
                          borderRadius: 20,
                          text: "Tokens",
                          onPressed: () {},
                          imagePath: "Lounge.png"),
                    ],
                  ),
                ],
              )
            ],
          ),
        )));
  }
}
