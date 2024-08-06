import 'package:barfly_user/Storage.dart';
import 'package:barfly_user/appConstants.dart';
import 'package:barfly_user/commonFunctions.dart';
import 'package:barfly_user/components/Buttons.dart';
import 'package:barfly_user/components/OrderDetails.dart';
import 'package:barfly_user/controller/menu_items_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuItemsScreen extends StatefulWidget {
  final String menuId;
  // double totalPrice;
  final String currency;
  // final Map<String, OrderDetails> orderDetails;
  final String menuCategoryName;
  Map<String, OrderDetails> orderDetails =
      Storage.getOrderDetails() as Map<String, OrderDetails>;
  var totalPrice = Storage.getTotalPrice() as double;
  MenuItemsScreen({
    required this.menuId,
    // this.totalPrice = 0,
    this.currency = "CHF",
    Map<String, OrderDetails>? orderDetails,
    required this.menuCategoryName,
  });

  @override
  State createState() => _MenuItemsScreenState();
}

class _MenuItemsScreenState extends State<MenuItemsScreen> {
  late MenuItemsController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(MenuItemsController(widget.menuId));
    controller.fetchMenuItems();
  }

  void _updateTotalQuantity(
    double change,
    String itemName,
    String itemId,
    String weightOrVolume,
  ) {
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
          weightOrVolume: weightOrVolume,
        );
        widget.orderDetails[itemId] = orderData;
      }

      widget.totalPrice += change;
      print("${widget.totalPrice}");

      // Store the updated order details and total price
      Storage.setOrderDetails(widget.orderDetails);
      Storage.setTotalOrderPrice(widget.totalPrice);
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
              SizedBox(height: screenHeight * 0.04812),
              GestureDetector(
                onTap: () {
                  Get.delete<MenuItemsController>();
                  Navigator.pop(context);
                },
                child: Container(
                  width: 34,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppColors.searchButtonBackgroundColor,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Center(
                    child: IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        Get.delete<MenuItemsController>();
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.chevron_left,
                        color: AppColors.searchIconColor,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: getResponsiveSizedBoxHeight(screenHeight, 59)),
              Container(
                margin: EdgeInsets.only(
                    left: getResponsiveSizedBoxWidth(screenWidth, 32)),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    widget.menuCategoryName,
                    style: TextStyle(
                      fontFamily: "Helvetica",
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontSize:
                          getResponsiveFontSize(screenWidth, screenHeight, 30),
                    ),
                  ),
                ),
              ),
              SizedBox(height: getResponsiveSizedBoxHeight(screenHeight, 18)),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  } else if (controller.menuItems.isEmpty) {
                    return Center(child: Text('No data available'));
                  } else {
                    return SingleChildScrollView(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Wrap(
                              spacing: 20,
                              runSpacing: 20,
                              children: controller.menuItems.map((menuItem) {
                                return MenuItemsButton(
                                  itemId: menuItem.id,
                                  borderRadius: 20,
                                  itemName: menuItem.itemName,
                                  onPressed: () => {},
                                  imagePath:
                                      "${menuItem.image.replaceAll(" ", "")}.jpg",
                                  currency: menuItem.currency,
                                  minWidth: 264,
                                  minHeight: 376,
                                  price: menuItem.price.toDouble(),
                                  selectedQuantity: widget.orderDetails
                                          .containsKey(menuItem.id)
                                      ? widget
                                          .orderDetails[menuItem.id]!.quantity
                                      : 0,
                                  weightOrVolume: menuItem.quantity,
                                  updateTotalQuantity: _updateTotalQuantity,
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                }),
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
                                  // "orderDetails": widget.orderDetails,
                                  "menuId": widget.menuId,
                                  "totalPrice": widget.totalPrice,
                                  "currency": widget.currency,
                                  "menuCategoryName": widget.menuCategoryName
                                });
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: AppColors.buttonColor,
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
