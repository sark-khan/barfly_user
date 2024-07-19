import 'package:barfly_user/components/OrderDetails.dart';
import 'package:barfly_user/screens/AccountDetailsScreen.dart';
import 'package:barfly_user/screens/DeleteScreen.dart';
import 'package:barfly_user/screens/EntryScreen.dart';
import 'package:barfly_user/screens/HomeScreen.dart';
import 'package:barfly_user/screens/InsiderScreen.dart';
import 'package:barfly_user/screens/LoungeDetailsScreen.dart';
import 'package:barfly_user/screens/LoungeList.dart';
import 'package:barfly_user/screens/MenuItems.dart';
import 'package:barfly_user/screens/OrderOverview.dart';
import 'package:barfly_user/screens/PersonalDataScreen.dart';
import 'package:barfly_user/screens/PersonalScreen.dart';
import 'package:barfly_user/screens/PickUpOrTakeAway.dart';
import 'package:barfly_user/screens/TokenScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteGenerator {
  static final routes = [
    GetPage(
        name: '/entry-screen',
        page: () => EntryScreen(),
        customTransition: FadeRouteTransition()),
    GetPage(
        name: '/home-screen',
        page: () => HomeScreen(),
        customTransition: FadeRouteTransition()),
    GetPage(
        name: '/insider-screen',
        page: () => InsiderScreen(),
        customTransition: FadeRouteTransition()),
    GetPage(
        name: '/menu-items-screen',
        page: () => MenuItemsScreen(
              orderDetails: Get.arguments['orderDetails'],
              totalPrice: Get.arguments['totalPrice'],
              currency: Get.arguments['currency'],
            ),
        transition: Transition.fadeIn,
        customTransition: FadeRouteTransition()),
    GetPage(
        name: '/order-overview-screen',
        page: () => OrderOverViewScreen(
              orderDetails: Get.arguments['orderDetails'],
              totalPrice: Get.arguments['totalPrice'],
              currency: Get.arguments['currency'],
            ),
        transition: Transition.fadeIn,
        customTransition: FadeRouteTransition()),
    GetPage(
        name: '/lounge-list-screen',
        page: () => LoungeList(),
        customTransition: FadeRouteTransition()),
    GetPage(
        name: '/lounge-details-screen',
        page: () => LoungeDetailsScreen(
              loungeName: Get.arguments["loungeName"],
              persons: Get.arguments["persons"],
              time: Get.arguments["time"],
            ),
        transition: Transition.fadeIn,
        customTransition: FadeRouteTransition()),
    GetPage(
        name: '/account-details-screen',
        page: () => AccountDetailsScreen(),
        customTransition: FadeRouteTransition()),
    GetPage(
        name: '/personal-data-screen',
        page: () => PersonalDataScreen(),
        customTransition: FadeRouteTransition()),
    GetPage(
        name: '/token-screen',
        page: () => TokenScreen(),
        customTransition: FadeRouteTransition()),
    GetPage(
        name: '/personal-screen',
        page: () => PersonalScreen(),
        customTransition: FadeRouteTransition()),
    GetPage(
        name: '/delete-screen',
        page: () => DeleteScreen(),
        customTransition: FadeRouteTransition()),
    GetPage(
        name: '/pickup-screen',
        page: () => PickUp(),
        customTransition: FadeRouteTransition()),
  ];

  static final unknownRoute = GetPage(
    name: '/error',
    page: () => Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: Text('ERROR'),
      ),
    ),
  );
}

class FadeRouteTransition extends CustomTransition {
  @override
  Widget buildTransition(
    BuildContext context,
    Curve? curve,
    Alignment? alignment,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
