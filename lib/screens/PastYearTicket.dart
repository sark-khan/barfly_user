import 'package:barfly_user/appConstants.dart';
import 'package:barfly_user/commonFunctions.dart';
import 'package:barfly_user/components/Buttons.dart';
import 'package:barfly_user/components/Search.dart';
import 'package:barfly_user/models/getPreviousOrderResponse.dart';
// import 'package:barfly_user/models/previous_order_model.dart'; // Import your model
import 'package:barfly_user/return_obj.dart'; // Import your return object class
import 'package:barfly_user/services/ApiService.dart'; // Import your API service
import 'package:flutter/material.dart';

class PastYearTicketScreen extends StatelessWidget {
  const PastYearTicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
        ),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.08),
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
                SizedBox(
                  width: screenWidth * 0.6,
                ),
                SearchComponent(
                  onPressed: () {
                    // Define the action when the icon button is pressed
                  },
                  routeName: '/home-screen',
                ),
              ],
            ),
            SizedBox(height: 40),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:
                        getResponsiveFontSize(screenWidth, screenHeight, 30),
                  ),
                  children: [
                    const TextSpan(
                      text: "Past  ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                      text: "Tickets\n",
                      style: TextStyle(fontWeight: FontWeight.w100),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: FutureBuilder<ReturnObj<List<PreviosuOrdersList>>>(
                future: Apiservice()
                    .getPreviousOrderList(), // Fetch the years from your API
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || !snapshot.data!.status) {
                    return Center(
                        child: Text(
                            snapshot.data?.message ?? 'No data available.'));
                  }

                  final previousOrdersList = snapshot.data!.data!;

                  return SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Center(
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: previousOrdersList.map((orderList) {
                          return Flexible(
                            child: TicketButton(
                              text: orderList.id.toString(), // Display the year
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, "/past-ticket-screen");
                                // Navigate to another screen or perform an action for the year
                              },
                              widthofButton: screenWidth * 0.834,
                              heightofButton: 0.123 * screenHeight,
                              borderRadius: 20,
                              isLoading: false,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
