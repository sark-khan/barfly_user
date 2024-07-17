import 'package:barfly_user/appConstants.dart';
import 'package:barfly_user/commonFunctions.dart';
import 'package:flutter/material.dart';

class DeleteScreen extends StatelessWidget {
  const DeleteScreen({Key? key}) : super(key: key); // add a name key parameter
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
                        Navigator.pushNamed(context, "/account-details-screen");
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
                                Navigator.pushNamed(
                                    context, "/account-details-screen");
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
                                  text: "Delete ",
                                  style: TextStyle(fontWeight: FontWeight.w100),
                                ),
                                TextSpan(
                                  text: "Account",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ])),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: IntrinsicHeight(
                          child: Center(
                            child: Container(
                              margin:
                                  const EdgeInsets.only(left: 0, bottom: 30),
                              // margin: const EdgeInsets.only(left: 0),
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
                                    text: const TextSpan(
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                        children: [
                                      TextSpan(
                                          text: "Ohh that’s too bad\n\n",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15)),
                                      TextSpan(
                                          text:
                                              "This process will permanently delete your „barfly“ account. All saved data will be lost and cannot be restored.\n\n",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w100,
                                              fontSize: 15)),
                                    ])),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 44.0, top: 22.0),
                        width: 264,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, "/order-overview-screen");
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: APP_COLORS
                                .buttonColor, // Change this to your desired color
                          ),
                          child: const Text(
                            'Delete Your Account Now',
                            style: TextStyle(
                              fontFamily: "Helvetica",
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )))))));
  }
}
