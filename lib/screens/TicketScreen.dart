import 'package:barfly_user/commonFunctions.dart';
import 'package:barfly_user/components/BottomNavigator.dart';
import 'package:barfly_user/components/Buttons.dart';
import 'package:barfly_user/models/getLiveOrders.dart';
import 'package:barfly_user/return_obj.dart';
import 'package:barfly_user/services/ApiService.dart';
import 'package:flutter/material.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: FutureBuilder<ReturnObj<List<LiveOrder>>>(
        future: Apiservice().getLiveOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || !snapshot.data!.status) {
            return Center(
                child: Text(
                    snapshot.data?.message ?? 'No live orders available.'));
          }

          final liveOrders = snapshot.data!.data;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.12),
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: getResponsiveFontSize(
                            screenWidth, screenHeight, 35),
                      ),
                      children: [
                        TextSpan(
                          text: "Your ",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                              fontFamily: "Helvetica"),
                        ),
                        TextSpan(
                          text: "Tickets",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                              fontFamily: "Helvetica"),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...liveOrders!.map((order) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: TicketDateButton(
                                  text1: "${order.entityDetails.entityName} ",
                                  text2: order.orders.isNotEmpty
                                      ? order.orders.first.updatedAt
                                          .toString()
                                          .split(" ")[0]
                                          .replaceAll("-", ".")
                                      : 'No Date',
                                  text3: '${order.orderCount} active tickets',
                                  onPressed: () => {},
                                  widthofButton: screenWidth * 0.834,
                                  heightofButton: 0.123 * screenHeight,
                                  borderRadius: 20,
                                  isLoading: false,
                                ),
                              ),
                              SizedBox(
                                  height: 20), // Adjust the height as needed
                            ],
                          );
                        }).toList(),
                        Center(
                          child: IntrinsicHeight(
                            child: SizedBox(
                              width:
                                  screenWidth * 0.5, // Adjust width as needed
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, "/ticket-year-screen");
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5), // Responsive padding
                                    backgroundColor: const Color(0xFF5a5664),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: const BorderSide(
                                          color: Colors.white, width: 0.8),
                                    ),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Center(
                                        child: Text(
                                          'Past Tickets',
                                          style: TextStyle(
                                            fontFamily: "Helvetica",
                                            color: Colors.white,
                                            fontSize: 23,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.only(bottom: 30),
                  child: BottomNavigator(
                    onPressed: () => {},
                    text: "dsds",
                    imagePath: "sdsdsd",
                    widthofButton: 200,
                    heightofButton: 56,
                    borderRadius: 30,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
