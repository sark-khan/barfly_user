import 'package:barfly_user/components/OrderDetails.dart';
import 'package:barfly_user/screens/EntryScreen.dart';
import 'package:barfly_user/screens/HomeScreen.dart';
import 'package:barfly_user/screens/InsiderScreen.dart';
import 'package:barfly_user/screens/MenuItems.dart';
import 'package:barfly_user/screens/OrderOverview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>?;
    print("${args}      1111111111111111111111111111111111111");
    switch (settings.name) {
      case '/entry-screen':
        return FadeRoute(
          page: EntryScreen(),
        );

      case '/home-screen':
        return FadeRoute(
          page: HomeScreen(),
        );
      case '/insider-screen':
        return FadeRoute(
          page: InsiderScreen(),
        );
      case "/menu-items-screen":
        if (args == null) {
          return FadeRoute(
            page: MenuItemsScreen(),
          );
        }
        final orderDetails = args!['orderDetails'] as Map<String, OrderDetails>;
        final totalPrice = args['totalPrice'] as double;
        final currency = args['currency'] as String;
        return FadeRoute(
          page: MenuItemsScreen(
            orderDetails: orderDetails,
            totalPrice: totalPrice,
            currency: currency,
          ),
        );

      case "/order-overview-screen":
        print("${args}>>>>>>>>>>>>");
        final orderDetails = args!['orderDetails'] as Map<String, OrderDetails>;
        final totalPrice = args['totalPrice'] as double;
        final currency = args['currency'] as String;
        return FadeRoute(
          page: OrderOverViewScreen(
            orderDetails: orderDetails,
            totalPrice: totalPrice,
            currency: currency,
          ),
        );
    }
    return _errorRoute();
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

class FadeRoute extends PageRouteBuilder {
  final Widget page;

  FadeRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
