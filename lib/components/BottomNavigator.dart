import 'package:barfly_user/appConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color.fromARGB(255, 100, 87, 180), // Dark Blue
        Color.fromARGB(255, 134, 82, 202), // Blue/Purple
      ],
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("$imagePath imsssssssss $useSvg");
    return SizedBox(
      width: widthofButton,
      height: heightofButton,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xFF34396e),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => {Navigator.pushNamed(context, "/ticket-screen")},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                padding: const EdgeInsets.all(0),
                backgroundColor: Color(0xFF34396e),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Image.asset(
                  "ticket.png",
                  color: Colors.white,
                  width: 30,
                  height: 30,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => {Navigator.pushNamed(context, "/home-screen")},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                padding: const EdgeInsets.all(0),
                backgroundColor: Color(0xFF34396e),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Image.asset(
                  "Home.png",
                  color: Colors.white,
                  width: 30,
                  height: 30,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () =>
                  {Navigator.pushNamed(context, "/account-details-screen")},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                padding: const EdgeInsets.all(0),
                backgroundColor: Color(0xFF34396e),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
    );
  }
}
