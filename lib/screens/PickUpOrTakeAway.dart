import 'package:barfly_user/appConstants.dart';
import 'package:barfly_user/commonFunctions.dart';
import 'package:flutter/material.dart';

class PickUp extends StatefulWidget {
  @override
  _PickUpState createState() => _PickUpState();
}

class _PickUpState extends State<PickUp> {
  String? selectedValue;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return PopScope(
        canPop: true,
        child: Scaffold(
            body: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.122),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenHeight * 0.04912,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/insider-screen");
                        },
                        child: Container(
                          width: 34,
                          height: 32,
                          decoration: BoxDecoration(
                            color: AppColors.searchButtonBackgroundColor,
                            borderRadius: BorderRadius.circular(
                                12.0), // Adjust the radius as needed
                          ),
                          child: Center(
                            child: IconButton(
                              padding: const EdgeInsets.all(0),
                              onPressed: () {},
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
                        height: getResponsiveSizedBoxHeight(screenHeight, 59),
                      ),
                      Center(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Way of pick-up",
                            style: TextStyle(
                              fontFamily: "Helvetica",
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: getResponsiveFontSize(
                                  screenWidth, screenHeight, 30),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getResponsiveSizedBoxHeight(screenHeight, 61),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: IntrinsicWidth(
                            child: Container(
                              margin: const EdgeInsets.only(left: 16),
                              width: screenWidth * 0.6717,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF4f5373),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth * 0.142),
                                    child: const Text(
                                      "What is your table number?",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xFFcbccd5),
                                          fontFamily: "Helvetica",
                                          fontWeight: FontWeight.w300,
                                          fontSize: 23),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 26,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF3d3f57),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: DropdownButton<String>(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          top: 0,
                                          bottom: 0,
                                          right: 1),
                                      hint: const Text(""),
                                      value: selectedValue,
                                      icon: Image.asset(
                                        'dropDown.png', // Path to your custom image
                                        width: 24,
                                        height: 24,
                                        color: Colors.white,
                                      ),
                                      iconSize: 24,
                                      dropdownColor: Color(0xFF3d3f57),
                                      underline: const SizedBox(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          selectedValue = newValue!;
                                        });
                                      },
                                      items: <String>['1', '2', '3', '4']
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 2),
                                            child: Text(value),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Transform.scale(
                                          scale: 1.4,
                                          child: Checkbox(
                                            value: isChecked,
                                            side: const BorderSide(
                                                color: Colors.white,
                                                width: 0.5),
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked = value!;
                                              });
                                            },
                                            checkColor: Colors.black,
                                            activeColor: Colors.blueGrey[900],
                                          ),
                                        ),
                                        const Text(
                                          "self pick-up",
                                          style: TextStyle(
                                              color: Color(0xFFcbccd5),
                                              fontSize: 23,
                                              fontFamily: "Helvetica",
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 21,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin:
                              const EdgeInsets.only(bottom: 44.0, top: 22.0),
                          width: 264,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, "/order-overview-screen");
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              backgroundColor: AppColors
                                  .buttonColor, // Change this to your desired color
                            ),
                            child: const Center(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 0),
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                      fontFamily: "Helvetica",
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]))));
  }
}
