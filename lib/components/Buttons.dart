import 'package:barfly_user/appConstants.dart';
import 'package:barfly_user/commonFunctions.dart';
import 'package:barfly_user/models/EntityLiveOrders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/utils.dart';
import 'package:shimmer/shimmer.dart';

double _currentSliderValue = 20;

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
              elevation: 0,
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
                    padding: const EdgeInsets.only(
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
                                    const Icon(
                                      Icons.location_on,
                                      size: 24,
                                      color: Colors.black,
                                    ),
                                    const SizedBox(width: 5),
                                    Expanded(
                                      child: Text(
                                        location,
                                        style: const TextStyle(
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
                              const SizedBox(width: 20),
                              const Icon(Icons.star,
                                  color: Colors.black, size: 24),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Visibility(
                                    visible: status,
                                    child: const Icon(Icons.circle,
                                        color: Colors.green, size: 16),
                                  ),
                                  const SizedBox(width: 5),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Visibility(
                                      visible: status,
                                      child: const Text(
                                        "Open",
                                        style: TextStyle(
                                          fontFamily: "Helvetica",
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
                                style: const TextStyle(
                                    fontFamily: "Helvetica",
                                    color: Colors.white,
                                    fontSize: 30),
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
  final bool statusOpen;
  final bool statusSoon;
  final bool isCounter;

  const InsiderButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.imagePath,
    this.useSvg = false,
    this.statusOpen = false,
    this.statusSoon = false,
    this.isLoading = true,
    this.heightofButton = 70,
    this.widthofButton = 240,
    this.fontSize = 28,
    this.textColor = Colors.white,
    this.borderRadius = 8.0,
    this.fontWeight = FontWeight.w300,
    this.verticalPadding = 15.0,
    this.horizontalPadding = 25.0,
    this.isCounter = false,
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
            padding: EdgeInsets.zero,
            elevation: 0,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: Container(
            width: widthofButton,
            padding: isCounter
                ? EdgeInsets.only(left: 4)
                : EdgeInsets.only(top: 16, left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Positioned(
                  top: -2,
                  child: useSvg
                      ? SvgPicture.asset(
                          imagePath,
                          color: Colors.white,
                          fit: BoxFit.fill,
                          height: 95,
                          // scale: 5,
                        )
                      : Container(
                          width: 66,
                          height: 66,
                          child: useSvg
                              ? SvgPicture.asset(
                                  imagePath,
                                  color: Colors.white,
                                  fit: BoxFit.fill,
                                  // scale: 5,
                                )
                              : Image.asset(
                                  imagePath,
                                  color: Colors.white,
                                  fit: BoxFit.contain,
                                  // scale: 5,
                                ),
                        ),
                ),
                SizedBox(
                  height: isCounter ? 25 : 56,
                ),
                Padding(
                  padding: isCounter
                      ? const EdgeInsets.symmetric(horizontal: 10)
                      : EdgeInsets.zero,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: statusOpen || statusSoon,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.circle,
                                color: statusOpen
                                    ? Color(0xFF2CCB10)
                                    : Color(0xFF696969),
                                size: 6,
                              ),
                            ),
                            const SizedBox(width: 3),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                margin: EdgeInsets.only(top: 2.5),
                                child: Text(
                                  statusOpen ? "open" : "open soon",
                                  style: const TextStyle(
                                    fontFamily: "Helvetica",
                                    fontWeight: FontWeight.w300,
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: isCounter
                      ? const EdgeInsets.only(left: 10.0)
                      : EdgeInsets.zero,
                  child: Text(
                    text,
                    // textAlign: TextAlign.end,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        // letterSpacing: 1.1,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.w600),
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

class InsiderButtonCounter extends StatelessWidget {
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
  final bool statusOpen;
  final bool statusSoon;
  final bool isCounter;

  const InsiderButtonCounter({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.imagePath,
    this.useSvg = false,
    this.statusOpen = false,
    this.statusSoon = false,
    this.isLoading = true,
    this.heightofButton = 70,
    this.widthofButton = 240,
    this.fontSize = 28,
    this.textColor = Colors.white,
    this.borderRadius = 8.0,
    this.fontWeight = FontWeight.w300,
    this.verticalPadding = 15.0,
    this.horizontalPadding = 25.0,
    this.isCounter = false,
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
            elevation: 0,
            padding: const EdgeInsets.all(0),
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: Padding(
            padding: isCounter
                ? EdgeInsets.zero
                : const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: useSvg
                      ? SvgPicture.asset(
                          imagePath,
                          color: Colors.white,
                          fit: BoxFit.fill,
                          height: 90,
                          // scale: 5,
                        )
                      : Container(
                          width: 66,
                          height: 66,
                          child: useSvg
                              ? SvgPicture.asset(
                                  imagePath,
                                  color: Colors.white,
                                  fit: BoxFit.fill,
                                  // scale: 5,
                                )
                              : Image.asset(
                                  imagePath,
                                  color: Colors.white,
                                  fit: BoxFit.contain,
                                  // scale: 5,
                                ),
                        ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: statusOpen,
                          child: const Icon(Icons.circle,
                              color: Colors.green, size: 14),
                        ),
                        Visibility(
                          visible: statusSoon,
                          child: const Icon(Icons.circle,
                              color: Color(0xFF696969), size: 14),
                        ),
                        const SizedBox(width: 5),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Visibility(
                            visible: statusOpen,
                            child: const Text(
                              "open",
                              style: TextStyle(
                                fontFamily: "Helvetica",
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Visibility(
                            visible: statusSoon,
                            child: const Text(
                              "open soon",
                              style: TextStyle(
                                fontFamily: "Helvetica",
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    text,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.w700),
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
    this.fontSize = 30,
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
              elevation: 0,
              padding: const EdgeInsets.all(0),
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black26,
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
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 4),
                          child:
                              Icon(Icons.star, color: Colors.amber, size: 24),
                        ),
                      ),
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
                        style: const TextStyle(
                          fontFamily: "Helvetica",
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "${widget.currency} ${widget.price} / ${widget.weightOrVolume}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: "Helvetica",
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            fontSize: 21,
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
                            fontSize: 30,
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
                            fontSize: 30,
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
    this.fontSize = 30,
    this.textColor = Colors.white,
    this.borderRadius = 8.0,
    this.fontWeight = FontWeight.w300,
    this.verticalPadding = 15.0,
    this.horizontalPadding = 25.0,
    this.backgroundColor = Colors.transparent,
    this.buttonBackgroundColor = AppColors.buttonColor,
    gradient = const LinearGradient(
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
      height: heightofButton,
      width: widthofButton > 200 ? 200 : widthofButton,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            elevation: 0,
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
                  fontFamily: "Helvetica",
                  color: Colors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w900,

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
              elevation: 0,
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
              elevation: 0,
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
                    child: Center(
                      child: Text(
                        text,
                        style: const TextStyle(
                            fontFamily: "Helvetica",
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.w800),
                      ),
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
                elevation: 0,
                padding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
              child: Container(
                width: widthofButton,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment
                        .start, // Aligns all children to the start
                    children: [
                      // Column directly for vertical stacking
                      Text(
                        text1,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Helvetica'),
                      ),
                      Text(
                        text2,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w300,
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return ConstrainedBox(
      constraints: BoxConstraints(
          minWidth: 350,
          maxWidth: 350,
          minHeight: heightofButton,
          maxHeight: heightofButton),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
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
              : Container(
                  width: widthofButton,
                  height: heightofButton,
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            text1,
                            style: const TextStyle(
                              fontFamily: "Helvetica",
                              color: Colors.white,
                              height: 1,
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                            ),
                            softWrap: true,
                          ),
                          Text(
                            text2,
                            style: const TextStyle(
                              fontFamily: "Helvetica",
                              color: Colors.white,
                              fontSize: 24,
                              height: 1,
                              fontWeight: FontWeight.w200,
                            ),
                            softWrap: true,
                          ),
                        ],
                      ),
                      Text(
                        text3,
                        style: const TextStyle(
                          fontFamily: "Helvetica",
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class FeedBackButton extends StatefulWidget {
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
  int selectedValue;
  final Function(double, String, String, String) updateTotalValue;

  FeedBackButton({
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
      colors: [Color(0xFF623E87), Color(0xFF473F88)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
    required this.updateTotalValue,
    this.selectedValue = 0,
  }) : super(key: key);

  @override
  _FeedBackButtonState createState() => _FeedBackButtonState();
}

class _FeedBackButtonState extends State<FeedBackButton> {
  double _currentSliderValue = 0;

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
            gradient: widget.gradient,
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: ElevatedButton(
            onPressed: widget.onPressed,
            style: ElevatedButton.styleFrom(
              elevation: 0,
              padding: EdgeInsets.all(2),
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
            ),
            child: widget.isLoading
                ? Shimmer.fromColors(
                    baseColor: Color(0xFF623E87),
                    highlightColor: Color(0xFF473F88),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius),
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
                        Text(
                          widget.text,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Helvetica'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              '1',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily:
                                      'Helvetica' // Adjust fontSize as needed
                                  ),
                            ), // Start label
                            Expanded(
                                flex: 5,
                                child: SliderTheme(
                                  data: const SliderThemeData(
                                    thumbColor: Colors.white,
                                    activeTrackColor: Colors.white,
                                  ),
                                  child: Slider(
                                    value: _currentSliderValue,
                                    min: 0,
                                    max: 10,
                                    divisions:
                                        10, // Adjust divisions for finer granularity
                                    label:
                                        _currentSliderValue.round().toString(),
                                    onChanged: (double value) {
                                      setState(() {
                                        _currentSliderValue = value;
                                        widget.updateTotalValue(
                                            _currentSliderValue,
                                            '', // Pass other parameters as needed
                                            '',
                                            '' // Pass other parameters as needed
                                            );
                                      });
                                    },
                                  ),
                                )),
                            const Text(
                              '10',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily:
                                      'Helvetica' // Adjust fontSize as needed
                                  ),
                            ), // End label
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

class FeedBackTextButton extends StatefulWidget {
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
  int selectedValue;
  final Function(double, String, String) updateTotalValue;

  FeedBackTextButton({
    Key? key,
    required this.onPressed,
    this.isLoading = true,
    this.heightofButton = 70,
    this.widthofButton = 240,
    this.fontSize = 28,
    this.textColor = Colors.grey,
    this.borderRadius = 5.0,
    this.fontWeight = FontWeight.w300,
    this.verticalPadding = 15.0,
    this.horizontalPadding = 25.0,
    this.buttonBackgroundColor = AppColors.backgroundColor,
    this.gradient = const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        // Dark Blue
        Color(0xFF473F88),
        Color(0xFF623E87), // Blue/Purple
      ],
    ),
    required this.updateTotalValue,
    this.selectedValue = 0,
  }) : super(key: key);

  @override
  _FeedBackTextButtonState createState() => _FeedBackTextButtonState();
}

class _FeedBackTextButtonState extends State<FeedBackTextButton> {
  double _currentSliderValue = 0;

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
            gradient: widget.gradient,
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: ElevatedButton(
              onPressed: widget.onPressed,
              style: ElevatedButton.styleFrom(
                elevation: 0,
                padding: EdgeInsets.all(2),
                backgroundColor: Color(0xFF091952),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
              ),
              child: widget.isLoading
                  ? Shimmer.fromColors(
                      baseColor: Color(0xFF623E87),
                      highlightColor: Color(0xFF473F88),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 96,
                            child: TextField(
                              maxLines: null,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Helvetica' // Set the text color
                                  ),
                              decoration: const InputDecoration(
                                hintText: 'Comment...',
                                hintStyle: TextStyle(
                                    color: Color(0xFF2F58A6),
                                    fontFamily:
                                        'Helvetica' // Set the hint color
                                    ),
                                border:
                                    InputBorder.none, // Remove the underline
                              ),
                              onChanged: (text) {
                                widget.updateTotalValue(
                                    _currentSliderValue, 'Param1', 'Param2');
                              },
                            ),
                          )
                        ],
                      ),
                    )),
        ),
      ),
    );
  }
}

class TicketQrButton extends StatelessWidget {
  final LiveOrderEntity order;
  final VoidCallback onPressed;
  final bool isLoading;

  const TicketQrButton({
    Key? key,
    required this.order,
    required this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Create a list of item widgets to display
    final itemWidgets = order.items.map((item) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(3.0), // Adjust padding as needed
              decoration: BoxDecoration(
                color: Colors.transparent, // Background color of the box
                borderRadius: BorderRadius.circular(8.0), // Rounded corners
                border: Border.all(
                  color: Colors.white, // Border color
                  width: 1.0, // Border width
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                child: Center(
                  child: Text(
                    "${item.quantity.toString()}x",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Helvetica'),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 9.0),
            Text(
              item.itemId.itemName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w300,
                fontFamily: 'Helvetica',
              ),
            ),
          ],
        ),
      );
    }).toList();

    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 350,
        maxWidth: 350,
      ),
      child: IntrinsicHeight(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 100, 87, 180), // Dark Blue
                Color.fromARGB(255, 134, 82, 202), // Blue/Purple
              ],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              elevation: 0,
              padding: const EdgeInsets.all(2),
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
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
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(
                      top: 30.0, // Padding on the top side
                      bottom: 20.0,
                      //Padding on the bottom side
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30.0,
                            vertical: 0,
                          ),
                          child: Container(
                            // padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              color: Color(0xFFD800FF),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Color(0xFFD800FF),
                                width: 2.0,
                              ),
                            ),
                            child: SizedBox(
                              height: 48,
                              width: 96,
                              child: Center(
                                child: Text(
                                  '${order.tokenNumber}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Helvetica',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: itemWidgets,
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: const Icon(
                                    Icons.circle,
                                    size: 24,
                                    color: Color(0xFFF4AA05),
                                  ),
                                ),
                                SizedBox(width: 5),
                                const Text(
                                  "In Process",
                                  style: TextStyle(
                                    fontFamily: "Helvetica",
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 150,
                                height: 150,
                                child: Image.asset(
                                  'qr-code.png', // Replace with your QR code image
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.06),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class TicketQrPickupButton extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String imagePath;
  final bool isVisible;
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

  const TicketQrPickupButton({
    Key? key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.onPressed,
    required this.imagePath,
    this.isVisible = false,
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
                elevation: 0,
                padding: EdgeInsets.all(2),
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
                  : Stack(
                      children: [
                        // Translucent content
                        Opacity(
                          opacity: 0.5,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: widthofButton * 0.102,
                                vertical: heightofButton * 0.0645),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment
                                  .start, // Aligns all children to the start
                              children: [
                                // SizedBox(height: heightofButton * 0.0645),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 2), // Adjust padding as needed
                                  decoration: BoxDecoration(
                                    color: Color(
                                        0xFFD800FF), // Background color of the box
                                    borderRadius: BorderRadius.circular(
                                        8.0), // Rounded corners, adjust radius as needed
                                    border: Border.all(
                                      color: Color(0xFFD800FF), // Border color
                                      width: 2.0, // Border width
                                    ),
                                  ),
                                  child: Text(
                                    text1,
                                    style: const TextStyle(
                                        color: Colors.white, // Text color
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Helvetica'),
                                  ),
                                ),
                                SizedBox(height: heightofButton * 0.0322),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: widthofButton * 0.1666,
                                      height: heightofButton * 0.098,
                                      padding: EdgeInsets.all(
                                          0), // Adjust padding as needed
                                      decoration: BoxDecoration(
                                        color: Colors
                                            .transparent, // Background color of the box
                                        borderRadius: BorderRadius.circular(
                                            8.0), // Rounded corners
                                        border: Border.all(
                                          color: Colors.white, // Border color
                                          width: 2.0, // Border width
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          text2,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.w300,
                                              fontFamily: 'Helvetica'),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                        width:
                                            8), // Space between text2 and text3
                                    Flexible(
                                      child: Text(
                                        text3,
                                        softWrap: true,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w100,
                                            fontFamily: 'Helvetica'),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                Center(
                                  child: Container(
                                    width: 150,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.white, // Background color
                                      border: Border.all(
                                        color: Colors.white, // Border color
                                        width: 2, // Border width
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Image.asset(
                                        imagePath,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                Center(
                                  child: Expanded(
                                    child: Text(
                                      'Picked up at ${text4}',
                                      softWrap: true,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w100,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Button placed on top of the translucent content
                        Positioned(
                          top: heightofButton * 0.5,
                          left: widthofButton * 0.189,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(193, 70),
                              padding: EdgeInsets.symmetric(
                                vertical:
                                    screenHeight * 0.02, // Responsive padding
                              ),
                              backgroundColor: Color.fromARGB(
                                  255, 59, 198, 233), // Fully opaque
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(
                                  color: Color.fromARGB(255, 243, 244, 245),
                                  width: 2,
                                ),
                              ),
                            ),
                            child: const Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      'Picked Up!',
                                      style: TextStyle(
                                        fontFamily: "Helvetica",
                                        color: Colors.white,
                                        fontSize: 55,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Button placed on top of the translucent content
                        Positioned(
                          top: 215,
                          left: 72,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              fixedSize: Size(193, 70),
                              padding: EdgeInsets.symmetric(
                                vertical:
                                    screenHeight * 0.02, // Responsive padding
                              ),
                              backgroundColor: Color.fromARGB(
                                  255, 59, 198, 233), // Fully opaque
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(
                                  color: Color.fromARGB(255, 243, 244, 245),
                                  width: 2,
                                ),
                              ),
                            ),
                            child: const Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      'Picked Up!',
                                      style: TextStyle(
                                        fontFamily: "Helvetica",
                                        color: Colors.white,
                                        fontSize: 55,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
        ),
      ),
    );
  }
}
