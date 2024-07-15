import 'package:barfly_user/appConstants.dart';
import 'package:barfly_user/commonFunctions.dart';
import 'package:barfly_user/components/Buttons.dart';
import 'package:barfly_user/components/OrderDetails.dart';
import 'package:flutter/material.dart';

class MenuItemsScreen extends StatefulWidget {
  double totalPrice;
  String currency;
  Map<String, OrderDetails> orderDetails;

  MenuItemsScreen({
    this.totalPrice = 0,
    this.currency = "",
    Map<String, OrderDetails>? orderDetails,
  }) : this.orderDetails = orderDetails ?? <String, OrderDetails>{};

  @override
  State createState() => _MenuItemsScreenState();
}

class _MenuItemsScreenState extends State<MenuItemsScreen> {
  void _updateTotalQuantity(
      double change, String itemName, String itemId, String weightOrVolume) {
    setState(() {
      if (widget.orderDetails.containsKey(itemId)) {
        OrderDetails existingValue = widget.orderDetails[itemId]!;
        if (change < 0) {
          existingValue.quantity -= 1;
        } else {
          existingValue.quantity += 1;
        }
        if (existingValue.quantity == 0) {
          widget.orderDetails.remove(itemId);
        } else {
          widget.orderDetails[itemId] = existingValue;
        }
      } else {
        OrderDetails orderData = OrderDetails(
            itemName: itemName,
            itemId: itemId,
            quantity: 1,
            weightOrVolume: weightOrVolume);
        widget.orderDetails[itemId] = orderData;
      }

      widget.totalPrice += change;
      print("${widget.totalPrice}");
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
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.122),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.04812,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/insider-screen");
                },
                child: Container(
                  width: 34,
                  height: 32,
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
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getResponsiveSizedBoxHeight(screenHeight, 59),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: getResponsiveSizedBoxWidth(screenWidth, 32)),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "Alcoholic Drinks",
                    style: TextStyle(
                      fontFamily: "Helvetica",
                      fontWeight: FontWeight.w100,
                      color: Colors.white,
                      fontSize:
                          getResponsiveFontSize(screenWidth, screenHeight, 30),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getResponsiveSizedBoxHeight(screenHeight, 18),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          children: [
                            MenuItemsButton(
                              itemId: "1232441112",
                              borderRadius: 20,
                              itemName: "Gin Tonic",
                              onPressed: () => {},
                              imagePath: "ginTonic.png",
                              currency: "CHF",
                              minWidth: 264,
                              minHeight: 376,
                              price: 18.00,
                              selectedQuantity: widget.orderDetails
                                      .containsKey("1232441112")
                                  ? widget.orderDetails["1232441112"]!.quantity
                                  : 0,
                              weightOrVolume: "250ml",
                              updateTotalQuantity: _updateTotalQuantity,
                            ),
                            MenuItemsButton(
                              itemId: "1232443333",
                              borderRadius: 20,
                              itemName: "Vodka",
                              onPressed: () => {},
                              imagePath: "Vodka.png",
                              currency: "CHF",
                              minWidth: 264,
                              minHeight: 376,
                              price: 18.00,
                              weightOrVolume: "250ml",
                              selectedQuantity: widget.orderDetails
                                      .containsKey("1232443333")
                                  ? widget.orderDetails["1232443333"]!.quantity
                                  : 0,
                              updateTotalQuantity: _updateTotalQuantity,
                            ),
                            MenuItemsButton(
                              itemId: "12324433333333",
                              borderRadius: 20,
                              itemName: "Gin Tonic",
                              onPressed: () => {},
                              imagePath: "ginTonic.png",
                              currency: "CHF",
                              minWidth: 264,
                              minHeight: 376,
                              price: 18.00,
                              weightOrVolume: "250ml",
                              selectedQuantity: widget.orderDetails
                                      .containsKey("12324433333333")
                                  ? widget
                                      .orderDetails["12324433333333"]!.quantity
                                  : 0,
                              updateTotalQuantity: _updateTotalQuantity,
                            ),
                            // MenuItemsButton(
                            //   itemId: "123244",
                            //   borderRadius: 20,
                            //   itemName:
                            //       "Gin Tonic dskldksa;kdsa ;sdk;sakd;lsakd ;  hjfsaljndlksajldksa kdlsjakldjsakljdkslad jkldksajdklsajkldsa lksjadksajdkl;sajkd",
                            //   onPressed: () => {},
                            //   imagePath: "ginTonic.png",
                            //   currency: "CHF",
                            //   minWidth: 264,
                            //   minHeight: 376,
                            //   price: 18.00,
                            //   weightOrVolume: "250ml",
                            //   selectedQuantity:
                            //       widget.orderDetails.containsKey("123244")
                            //           ? widget.orderDetails["123244"]!.quantity
                            //           : 0,
                            //   updateTotalQuantity: _updateTotalQuantity,
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              widget.totalPrice == 0
                  ? SizedBox()
                  : Center(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 44.0, top: 22.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, "/order-overview-screen",
                                arguments: {
                                  "orderDetails": widget.orderDetails,
                                  "totalPrice": widget.totalPrice,
                                  "currency": widget.currency
                                });
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: APP_COLORS.buttonColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Check-Out',
                                    style: TextStyle(
                                      fontFamily: "Helvetica",
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    '(CHF ${widget.totalPrice.toStringAsFixed(2)})',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: "Helvetica",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
