import 'package:barfly_user/Storage.dart';
import 'package:barfly_user/appConstants.dart';
import 'package:barfly_user/commonFunctions.dart';
import 'package:barfly_user/components/OrderDetails.dart';
import 'package:barfly_user/return_obj.dart';
import 'package:barfly_user/services/ApiService.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/utils.dart';

class OrderOverViewScreen extends StatefulWidget {
  // final Map<String, OrderDetails> orderDetails;
  final orderDetails = Storage.getOrderDetails() as Map<String, OrderDetails>;
  final String menuId;
  final double totalPrice;
  final String currency;
  final String menuCategoryName;
  OrderOverViewScreen(
      {required this.totalPrice,
      required this.currency,
      required this.menuCategoryName,
      required this.menuId,
      Key? key})
      : super(key: key);
  @override
  State createState() => _OrderOverViewScreenState();
}

class _OrderOverViewScreenState extends State<OrderOverViewScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return PopScope(
        canPop: true,
        child: Scaffold(
            body: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getResponsiveSizedBoxWidth(screenWidth, 48)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.04812,
                    ),
                    GestureDetector(
                      onTap: () {
                        print(
                            "menuId ${widget.menuId} sdsds ${widget.totalPrice} dksjdlskdks ${widget.currency}");
                        Navigator.pop(context);
                        // Navigator.pushNamed(context, "/menu-items-screen",
                        //     arguments: {
                        //       // "orderDetails": widget.orderDetails,
                        //       "totalPrice": widget.totalPrice,
                        //       "menuId": widget.menuId,
                        //       "currency": widget.currency,
                        //       "menuCategoryName": widget.menuCategoryName,
                        //     });
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
                            onPressed: () {
                              print(
                                  "menuId ${widget.menuId} sdsds ${widget.totalPrice} dksjdlskdks ${widget.currency}");
                              Navigator.pop(context);
                              // Navigator.pushNamed(context, "/menu-items-screen",
                              //     arguments: {
                              //       // "orderDetails": widget.orderDetails,
                              //       "menuId": widget.menuId,
                              //       "menuCategoryName": widget.menuCategoryName,
                              //       "totalPrice": widget.totalPrice,
                              //       "currency": widget.currency
                              //     });
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
                    SizedBox(
                      height: getResponsiveSizedBoxHeight(screenHeight, 38.31),
                    ),
                    const Center(
                      child: Text(
                        AppText.OrderOverView,
                        style: TextStyle(
                            fontFamily: "Helvetica",
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    SizedBox(
                      height: getResponsiveSizedBoxHeight(screenHeight, 51),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ConstrainedBox(
                                  constraints:
                                      const BoxConstraints(minHeight: 243),
                                  child: orderItemsList(screenWidth)),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                height: 3,
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth),
                                color: Colors.white,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Text(
                                  'Total: ${widget.currency} ${widget.totalPrice.toStringAsFixed(2)}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24.0, vertical: 20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 2),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 8),
                                      child: TextField(
                                        maxLines: null,
                                        minLines: 1,
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Enter comments here',
                                            hintStyle:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    ),
                                  )),
                            ]),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 44.0, top: 22.0),
                        width: 264,
                        child: ElevatedButton(
                          onPressed: () async {
                            ReturnObj response = await Apiservice()
                                .createOrder(widget.orderDetails);
                            if (response.status) {
                              Fluttertoast.showToast(
                                  msg: "Ordered Successfully");
                              return;
                            }
                            Fluttertoast.showToast(msg: response.message);
                            return;
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: AppColors
                                .buttonColor, // Change this to your desired color
                          ),
                          child: const Text(
                            'Order',
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
                ))));
  }

  Widget orderItemsList(
    screenWidth,
  ) {
    List<Widget> listItems = [];
    widget.orderDetails.forEach((key, orderDetail) {
      listItems.add(
        Padding(
          padding: EdgeInsets.only(
              left: getResponsiveSizedBoxWidth(screenWidth, 41), bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Center(
                  child: Text(
                    "${orderDetail.quantity.toString()}x",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: getResponsiveSizedBoxWidth(screenWidth, 20),
              ),
              Expanded(
                child: Text(
                  '${orderDetail.itemName} (${orderDetail.weightOrVolume})',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                  ),
                  maxLines: null,
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
      );
    });
    return Column(children: listItems);
  }
}
