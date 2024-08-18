import 'package:barfly_user/appConstants.dart';
import 'package:flutter/material.dart';

class BottomNavigator extends StatelessWidget {
  final String text;
  final double fontSize;
  final String imagePath;
  final VoidCallback onPressed;
  final Color textColor;
  final Color buttonBackgroundColor;
  final double heightofButton;
  final double widthofButton;
  final double borderRadius;
  final FontWeight fontWeight;
  final double verticalPadding;
  final double horizontalPadding;
  final Gradient gradient;
  final bool isLoading;
  final bool useSvg;

  const BottomNavigator({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.imagePath,
    this.useSvg = false,
    this.isLoading = true,
    this.heightofButton = 70,
    this.widthofButton = 240,
    this.fontSize = 28,
    this.textColor = Colors.white,
    this.borderRadius = 8.0,
    this.fontWeight = FontWeight.w300,
    this.verticalPadding = 15.0,
    this.horizontalPadding = 25.0,
    this.buttonBackgroundColor = AppColors.backgroundColor,
    this.gradient = const LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: [
        Color(0xFF623E87), // Dark Blue
        Color(0xFF473F88), // Blue/Purple
      ],
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 196,
      height: 56,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xFF34396e),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => {Navigator.pushNamed(context, "/ticket-screen")},
                child: Container(
                  // padding: EdgeInsets.symmetric(horizontal: 5),
                  width: 40,
                  height: 38,
                  child: Image.asset(
                    "ticket.png",
                    color: Colors.white,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => {Navigator.pushNamed(context, "/home-screen")},
                child: Container(
                  // padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Image.asset(
                    "Home.png",
                    color: Colors.white,
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () =>
                    {Navigator.pushNamed(context, "/account-details-screen")},
                child: Container(
                  // padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Image.asset(
                    "person.png",
                    color: Colors.white,
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
