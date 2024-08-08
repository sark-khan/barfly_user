import 'package:barfly_user/appConstants.dart';
import 'package:barfly_user/commonFunctions.dart';
import 'package:barfly_user/components/Buttons.dart';
import 'package:barfly_user/models/EntityLiveOrders.dart';
import 'package:barfly_user/return_obj.dart';
import 'package:barfly_user/services/ApiService.dart';
import 'package:flutter/material.dart';

class MenuQrScreen extends StatefulWidget {
  final String entityId; // Pass entityId from the previous screen
  const MenuQrScreen({Key? key, required this.entityId}) : super(key: key);

  @override
  _MenuQrScreenState createState() => _MenuQrScreenState();
}

class _MenuQrScreenState extends State<MenuQrScreen> {
  late Future<ReturnObj<List<LiveOrderEntity>>> futureLiveOrders;

  @override
  void initState() {
    super.initState();
    futureLiveOrders = Apiservice().getLiveOrdersEntity(widget.entityId);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.1, // Responsive horizontal padding
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.12), // Responsive top space
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 34,
                    height: 32,
                    margin: const EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                      color: AppColors.searchButtonBackgroundColor,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(
                      child: IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
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
              ],
            ),
            SizedBox(height: 30),
            Center(
              child: Container(
                margin: EdgeInsets.only(left: 0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: "Your entity ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Helvetica',
                                fontSize: getResponsiveFontSize(
                                    screenWidth, screenHeight, 30)),
                          ),
                          TextSpan(
                            text: "Tickets \n",
                            style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontFamily: 'Helvetica',
                                fontSize: getResponsiveFontSize(
                                    screenWidth, screenHeight, 30)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Positioned(
                      bottom: 0, // Adjust position as needed
                      child: Text(
                        "2024.08.06",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: getResponsiveFontSize(
                              screenWidth, screenHeight, 25),
                          fontWeight: FontWeight.w200,
                          fontFamily: 'Helvetica',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
                height: screenHeight * 0.02), // Space between title and content
            Expanded(
              child: FutureBuilder<ReturnObj<List<LiveOrderEntity>>>(
                future: futureLiveOrders,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData ||
                      !snapshot.data!.status ||
                      snapshot.data!.data == null ||
                      snapshot.data!.data!.isEmpty) {
                    return const Center(
                        child: Text('No live orders available'));
                  } else {
                    final liveOrders = snapshot.data!.data!;
                    return SingleChildScrollView(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Wrap(
                              spacing: 20,
                              runSpacing: 20,
                              children: liveOrders.map((order) {
                                return TicketQrButton(
                                  order:
                                      order, // Pass order directly to the button
                                  onPressed: () {
                                    // Handle button press
                                  },
                                  isLoading: false,
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
