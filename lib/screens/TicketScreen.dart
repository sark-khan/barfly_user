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
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0814),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.12),
                Container(
                  width: 270,
                  height: 53,
                  padding:
                      EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: "Your ",
                            style: TextStyle(
                                fontSize: 50,
                                letterSpacing: -3,
                                fontWeight: FontWeight.w800,
                                fontFamily: "Helvetica"),
                          ),
                          TextSpan(
                            text: "Tickets",
                            style: TextStyle(
                                fontSize: 50,
                                letterSpacing: -3,
                                fontWeight: FontWeight.w800,
                                fontFamily: "Helvetica"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
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
                                  text1: "XTRA",
                                  text2: order.orders.isNotEmpty
                                      ? order.orders.first.updatedAt
                                          .toString()
                                          .split(" ")[0]
                                          .replaceAll("-", ".")
                                      : 'No Date',
                                  text3: '${order.orderCount} active ticket',
                                  onPressed: () => {
                                    Navigator.pushNamed(context, "/qr-screen",
                                        arguments: {
                                          "entityId": order.entityDetails.id
                                        })
                                  },
                                  widthofButton: 328,
                                  heightofButton: 88,
                                  borderRadius: 20,
                                  isLoading: false,
                                ),
                              ),
                              const SizedBox(
                                  height: 20), // Adjust the height as needed
                            ],
                          );
                        }).toList(),
                        Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, "/ticket-year-screen");
                            },
                            child: Container(
                              width: 160,
                              height: 57,
                              decoration: BoxDecoration(
                                color:
                                    const Color(0xFF5a5664), // Background color
                                borderRadius: BorderRadius.circular(
                                    20), // Rounded corners
                                border: Border.all(
                                    color: Colors.white,
                                    width: 1), // Border style
                              ),
                              child: const Center(
                                child: Text(
                                  'Past Tickets',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: "Helvetica",
                                    color: Colors.white,
                                    fontSize: 23,
                                    height: 2.55,
                                    fontWeight: FontWeight.w500,
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
