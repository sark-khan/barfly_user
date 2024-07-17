import 'package:barfly_user/appConstants.dart';
import 'package:barfly_user/components/Buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountDetailsScreen extends StatefulWidget {
  @override
  State createState() => _AccountDetailsScreenState();
}

class _AccountDetailsScreenState extends State<AccountDetailsScreen> {
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
                height: screenHeight * 0.14812,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 16),
                  child: Text(
                    "Account",
                    style: TextStyle(
                        fontFamily: "Helvetica",
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w900),
                  )),
              SizedBox(
                height: 13,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: IntrinsicHeight(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: InsiderButton(
                                    widthofButton: screenWidth * 0.3867,
                                    heightofButton: screenHeight * 0.2171,
                                    borderRadius: 20,
                                    text: "Personal Data",
                                    onPressed: () {},
                                    imagePath: "person.png"),
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              Flexible(
                                child: InsiderButton(
                                    widthofButton: screenWidth * 0.3867,
                                    heightofButton: screenHeight * 0.2171,
                                    borderRadius: 20,
                                    text: "Overview Tokens",
                                    onPressed: () {},
                                    imagePath: "person.png"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: InsiderButton(
                                  widthofButton: screenWidth * 0.3867,
                                  heightofButton: screenHeight * 0.2171,
                                  borderRadius: 20,
                                  text: "Data Protection",
                                  onPressed: () {},
                                  imagePath: "DataProtection.png",
                                ),
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              Flexible(
                                child: InsiderButton(
                                    widthofButton: screenWidth * 0.3867,
                                    heightofButton: screenHeight * 0.2171,
                                    borderRadius: 20,
                                    text: "Payment Options",
                                    onPressed: () {},
                                    imagePath: "paymentOptions.png"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )));
  }
}
