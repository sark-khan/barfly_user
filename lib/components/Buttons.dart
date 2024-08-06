import 'package:barfly_user/appConstants.dart';
import 'package:barfly_user/commonFunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class FavorotiesButton extends StatelessWidget {
  final String location;
  final String entityName;
  final bool status;
  final double fontSize;
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

  const FavorotiesButton({
    Key? key,
    required this.location,
    required this.entityName,
    required this.status,
    required this.onPressed,
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
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: widthofButton,
        maxWidth: widthofButton,
        minHeight: heightofButton,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: IntrinsicHeight(
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(0),
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
            child: isLoading
                ? Shimmer.fromColors(
                    baseColor: Color(0xFF623E87),
                    highlightColor: Color(0xFF473F88),
                    child: Container(
                      width: double.infinity,
                      height: heightofButton,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(
                        top: 16, left: 16, right: 16, bottom: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: 24,
                                      color: Colors.black,
                                    ),
                                    SizedBox(width: 5),
                                    Expanded(
                                      child: Text(
                                        location,
                                        style: TextStyle(
                                          fontFamily: "Helvetica",
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Visibility(
                                      visible: status,
                                      child: Text(
                                        "Open",
                                        style: TextStyle(
                                          fontFamily: "Helvetica",
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Visibility(
                                      visible: status,
                                      child: Icon(Icons.circle,
                                          color: Colors.green, size: 16),
                                    ),
                                    SizedBox(width: 20),
                                    Icon(Icons.star,
                                        color: Colors.black, size: 24),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 5,
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(
                                entityName,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
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
    );
  }
}

class InsiderButton extends StatelessWidget {
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

  const InsiderButton({
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
          gradient: gradient,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 66,
                    height: 66,
                    child: useSvg
                        ? SvgPicture.asset(
                            imagePath,
                            color: Colors.white,
                            fit: BoxFit.contain,
                            // scale: 5,
                          )
                        : Image.asset(
                            imagePath,
                            color: Colors.white,
                            fit: BoxFit.contain,
                            scale: 5,
                          ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    text,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuItemsButton extends StatefulWidget {
  final String itemId;
  final String itemName;
  final String currency;
  final double price;
  final String weightOrVolume;
  final double fontSize;
  final String imagePath;
  final VoidCallback onPressed;
  final Color textColor;
  final Color buttonBackgroundColor;
  final double minHeight;
  final double minWidth;
  final double borderRadius;
  final FontWeight fontWeight;
  final double verticalPadding;
  final double horizontalPadding;
  final Gradient gradient;
  final bool isLoading;
  int selectedQuantity;
  final Function(double, String, String, String)
      updateTotalQuantity; // Add this

  MenuItemsButton({
    Key? key,
    required this.itemId,
    required this.itemName,
    required this.onPressed,
    required this.imagePath,
    required this.currency,
    required this.price,
    required this.weightOrVolume,
    this.selectedQuantity = 0,
    this.isLoading = true,
    this.minHeight = 70,
    this.minWidth = 240,
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
    required this.updateTotalQuantity, // Add this
  }) : super(key: key);

  @override
  _MenuItemsButtonState createState() => _MenuItemsButtonState();
}

class _MenuItemsButtonState extends State<MenuItemsButton> {
  int selectedQuantity = 0;

  void _addSelectedQuantity() {
    setState(() {
      widget.selectedQuantity += 1;
    });
    widget.updateTotalQuantity(widget.price, widget.itemName, widget.itemId,
        widget.weightOrVolume); // Update total weightOrVolume
  }

  void _subtractSelectedQuantity() {
    if (widget.selectedQuantity > 0) {
      setState(() {
        widget.selectedQuantity -= 1; // Properly decrement the quantity
      });

      widget.updateTotalQuantity(-widget.price, widget.itemName, widget.itemId,
          widget.weightOrVolume); // Update total weightOrVolume
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: widget.minWidth,
        maxWidth: widget.minWidth,
        // minHeight: widget.minHeight,
      ),
      child: IntrinsicHeight(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: widget.gradient,
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: ElevatedButton(
            onPressed: widget.onPressed,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(0),
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        widget.imagePath,
                        width: 73.57,
                        height: 172.17,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.itemName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Helvetica",
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: getResponsiveFontSize(
                              widget.minWidth, widget.minHeight, 30),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "${widget.currency} ${widget.price} / ${widget.weightOrVolume}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Helvetica",
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            fontSize: getResponsiveFontSize(
                                widget.minWidth, widget.minHeight, 21),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomButtonStroked(
                            borderRadius: 5,
                            text: "+",
                            fontSize: 22,
                            onPressed: _addSelectedQuantity,
                            widthofButton: 58,
                            heightofButton: 33,
                            backgroundColor: Colors.transparent,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          CustomButtonStroked(
                            borderRadius: 5,
                            text: "-",
                            fontSize: 22,
                            onPressed: _subtractSelectedQuantity,
                            widthofButton: 58,
                            heightofButton: 33,
                            backgroundColor: Colors.transparent,
                          ),
                        ],
                      ),
                    ],
                  ),
                  widget.selectedQuantity != 0
                      ? Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            padding: EdgeInsets.zero,
                            width: 54,
                            height: 54,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF36D1D1),
                            ),
                            child: Center(
                              child: Text(
                                "${widget.selectedQuantity}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Helvetica",
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButtonStroked extends StatelessWidget {
  final String text;
  final double fontSize;
  final VoidCallback onPressed;
  final Color textColor;
  final Color buttonBackgroundColor;
  final double heightofButton;
  final double widthofButton;
  final double borderRadius;
  final FontWeight fontWeight;
  final double verticalPadding;
  final double horizontalPadding;
  final Color backgroundColor;
  const CustomButtonStroked({
    Key? key,
    required this.text,
    required this.onPressed,
    this.heightofButton = 70,
    this.widthofButton = 240,
    this.fontSize = 24,
    this.textColor = Colors.white,
    this.borderRadius = 8.0,
    this.fontWeight = FontWeight.w300,
    this.verticalPadding = 15.0,
    this.horizontalPadding = 25.0,
    this.backgroundColor = Colors.transparent,
    this.buttonBackgroundColor = AppColors.buttonColor,
    gradient = const LinearGradient(
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
    return SizedBox(
      height: heightofButton,
      width: widthofButton > 200 ? 200 : widthofButton,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            side: const BorderSide(
              strokeAlign: 2,
              color: Colors.white,
            ),
            backgroundColor: backgroundColor),
        child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.zero,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w300,

                  // backgroundColor: Color(0xFF2ac4aa)
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoungeListButton extends StatelessWidget {
  final String loungeName;
  final String time;
  final String people;
  final double fontSize;
  final VoidCallback onPressed;
  final Color textColor;
  final double minWidth;
  final double maxWidth;
  final Color buttonBackgroundColor;
  final double heightofButton;
  final double widthofButton;
  final double borderRadius;
  final FontWeight fontWeight;
  final double verticalPadding;
  final double horizontalPadding;
  final Gradient gradient;
  final bool isLoading;

  const LoungeListButton({
    Key? key,
    required this.loungeName,
    required this.onPressed,
    required this.time,
    required this.people,
    this.isLoading = true,
    this.heightofButton = 70,
    this.widthofButton = 240,
    this.minWidth = 428,
    this.maxWidth = 428,
    this.fontSize = 28,
    this.textColor = Colors.white,
    this.borderRadius = 8.0,
    this.fontWeight = FontWeight.w300,
    this.verticalPadding = 15.0,
    this.horizontalPadding = 25.0,
    this.buttonBackgroundColor = Colors.white,
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
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: minWidth,
        maxWidth: minWidth,
      ),
      child: IntrinsicHeight(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
            child: Container(
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 11, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        loungeName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Helvetica",
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  child: Image.asset(
                                    "person.png",
                                    color: Colors.white,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  people,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Helvetica",
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 70),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  child: Image.asset(
                                    "time.png",
                                    color: Colors.white,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  time,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Helvetica",
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 11),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//tickets case
class TicketButton extends StatelessWidget {
  final String text;
  final double fontSize;
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

  const TicketButton({
    Key? key,
    required this.text,
    required this.onPressed,
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 350,
        maxWidth: 350,
      ),
      child: IntrinsicHeight(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(0),
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
            child: isLoading
                ? Shimmer.fromColors(
                    baseColor: Color(0xFF623E87),
                    highlightColor: Color(0xFF473F88),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                text,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: getResponsiveFontSize(
                                        screenWidth, screenHeight, 30)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class TicketYearButton extends StatelessWidget {
  final String text1;
  final String text2;
  final double fontSize;
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

  const TicketYearButton({
    Key? key,
    required this.text1,
    required this.text2,
    required this.onPressed,
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 350,
        maxWidth: 350,
      ),
      child: IntrinsicHeight(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
              child: Container(
                width: widthofButton,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment
                        .start, // Aligns all children to the start
                    children: [
                      // Column directly for vertical stacking
                      Text(
                        text1,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Helvetica'),
                      ),
                      Text(
                        text2,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w200,
                            fontFamily: 'Helvetica'),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

class TicketDateButton extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final double fontSize;
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

  const TicketDateButton({
    Key? key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.onPressed,
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 350,
        maxWidth: 350,
      ),
      child: IntrinsicHeight(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(10),
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
              child: isLoading
                  ? Shimmer.fromColors(
                      baseColor: Color(0xFF623E87),
                      highlightColor: Color(0xFF473F88),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(borderRadius),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  text1,
                                  maxLines: null,
                                  style: const TextStyle(
                                    fontFamily: "Helvetica",
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  softWrap: true,
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  text2,
                                  style: const TextStyle(
                                    fontFamily: "Helvetica",
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w200,
                                  ),
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            text3,
                            style: TextStyle(
                              fontFamily: "Helvetica",
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                    )),
        ),
      ),
    );
  }
}
