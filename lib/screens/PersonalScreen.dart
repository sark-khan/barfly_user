import 'package:barfly_user/appConstants.dart';
import 'package:barfly_user/commonFunctions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalScreen extends StatelessWidget {
  const PersonalScreen({Key? key})
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
                    SizedBox(
                      height: 30,
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
                              onPressed: () {
                                Navigator.pushNamed(context, "/home-screen");
                              },
                              icon: const Icon(
                                Icons.chevron_left,
                                color: APP_COLORS.searchIconColor,
                                size: 30,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 16),
                      child: RichText(
                          text: const TextSpan(
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                              children: [
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Data ",
                                  style: TextStyle(fontWeight: FontWeight.w100),
                                ),
                                TextSpan(
                                  text: "Protection",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ])),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Expanded(
                        child: SingleChildScrollView(
                          child: IntrinsicHeight(
                            child: Container(
                              margin:
                                  const EdgeInsets.only(left: 0, bottom: 30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF623E87),
                                    Color(0xFF473F88)
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 40),
                                        children: [
                                      TextSpan(
                                          text:
                                              "General Terms and Conditions\n\n",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w100,
                                              fontSize: getResponsiveFontSize(
                                                  screenWidth,
                                                  screenHeight,
                                                  18))),
                                      TextSpan(
                                          text:
                                              "In the general terms and conditions,the online seller summarizes all legal aspects of the transaction.Once the customer has agreed to this document,it become an integral part of the sales contract\n\n",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w100,
                                              fontSize: getResponsiveFontSize(
                                                  screenWidth,
                                                  screenHeight,
                                                  14))),
                                      TextSpan(
                                          text:
                                              "In Switzerland, the legal basis for the sale of goods or services can be modified via the contract and the contractual terms and conditions.As a rule, a trader summarizes all his terma and conditions of sale in a document known as ,,GTC''.This is a form of legal protection.More detailed information on the legal obligationsof the operator can be found in the corresponding chapter\n\n",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w100,
                                              fontSize: getResponsiveFontSize(
                                                  screenWidth,
                                                  screenHeight,
                                                  14))),
                                      TextSpan(
                                          text:
                                              "The laws  of Switzerland and the EU\n\n",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w100,
                                              fontSize: getResponsiveFontSize(
                                                  screenWidth,
                                                  screenHeight,
                                                  14))),
                                      TextSpan(
                                          text:
                                              "In order for the GTC to be valid,they must be accepted by both parties.They must be accepted by both parties.They must be available to the customer before the order process.For example, the webshop may contain a checkbox for the text ..I have\n\n",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w100,
                                              fontSize: getResponsiveFontSize(
                                                  screenWidth,
                                                  screenHeight,
                                                  14))),
                                    ])),
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
