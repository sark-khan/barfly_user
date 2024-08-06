import 'package:barfly_user/components/OrderDetails.dart';
import 'package:barfly_user/screens/AccountDetailsScreen.dart';
import 'package:barfly_user/screens/DeleteScreen.dart';
import 'package:barfly_user/screens/EntryScreen.dart';
import 'package:barfly_user/screens/MenuScreen.dart';
import 'package:barfly_user/screens/home_screen.dart';
import 'package:barfly_user/screens/InsiderScreen.dart';
import 'package:barfly_user/screens/LoginScreen.dart';
import 'package:barfly_user/screens/LoungeDetailsScreen.dart';
import 'package:barfly_user/screens/LoungeList.dart';
import 'package:barfly_user/screens/MenuItems.dart';
import 'package:barfly_user/screens/OrderOverview.dart';
import 'package:barfly_user/screens/PastTicketNameScreen.dart';
import 'package:barfly_user/screens/PastTicketScreen.dart';
import 'package:barfly_user/screens/PastYearTicket.dart';
import 'package:barfly_user/screens/PersonalDataScreen.dart';
import 'package:barfly_user/screens/PersonalScreen.dart';
import 'package:barfly_user/screens/PickUpScreen.dart';
import 'package:barfly_user/screens/PickUpOrTakeAway.dart';
import 'package:barfly_user/screens/TicketScreen.dart';
import 'package:barfly_user/screens/TokenScreen.dart';
import 'package:barfly_user/screens/home_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case '/entry-screen':
        return FadeRoute(
          page: EntryScreen(),
        );
      case '/login-screen':
        return FadeRoute(
          page: LoginScreen(),
        );

      case '/home-screen':
        return FadeRoute(
          page: HomeScreen(),
        );
      case '/insider-screen':
        return FadeRoute(
          page: InsiderScreen(
            entityId: args!["entityId"],
            entityName: args["entityName"],
          ),
        );
      case "/menu-category-screen":
        return FadeRoute(
            page: Menuscreen(
          counterId: args!["counterId"],
          entityId: args["entityId"],
          entityName: args["entityName"],
          counterName: args["counterName"],
        ));
      case "/menu-items-screen":
        print("reached ehrer on menuItems router");
        final menuId = args!["menuId"] as String;
        final menuCategoryName = args["menuCategoryName"] as String;
        final String currency = "CHF";
        if (args.length < 3) {
          return FadeRoute(
            page: MenuItemsScreen(
              menuId: menuId,
              menuCategoryName: menuCategoryName,
              currency: "CHF",
            ),
          );
        }

        return FadeRoute(
          page: MenuItemsScreen(
            menuId: menuId,
            currency: currency,
            menuCategoryName: menuCategoryName,
          ),
        );

      case "/order-overview-screen":
        final totalPrice = args!['totalPrice'] as double;
        final currency = args['currency'] as String;
        final menuCategoryName = args['menuCategoryName'] as String;
        return FadeRoute(
          page: OrderOverViewScreen(
            menuId: args['menuId'],
            totalPrice: totalPrice,
            currency: currency,
            menuCategoryName: menuCategoryName,
          ),
        );
      case "/lounge-list-screen":
        return FadeRoute(page: LoungeList());
      case "/lounge-details-screen":
        return FadeRoute(
            page: LoungeDetailsScreen(
          loungeName: args!["loungeName"],
          persons: args["persons"],
          time: args["time"],
        ));

      case "/account-details-screen":
        return FadeRoute(page: AccountDetailsScreen());
      case '/pickup-screen':
        return FadeRoute(
          page: const PickUpScreen(),
        );
      case '/ticket-screen':
        return FadeRoute(
          page: const TicketScreen(),
        );
      case '/ticket-year-screen':
        return FadeRoute(
          page: const PastYearTicketScreen(),
        );
      case '/past-ticket-screen':
        return FadeRoute(
          page: const PastTicketScreen(),
        );
      case '/past-ticket-screen-name':
        return FadeRoute(
          page: const PastTicketNameScreen(),
        );
      case '/personal-data-screen':
        return FadeRoute(
          page: const PersonalDataScreen(),
        );
      case '/token-screen':
        return FadeRoute(
          page: const TokenScreen(),
        );
      case '/data-protection-screen':
        return FadeRoute(
          page: const PersonalScreen(),
        );
      case '/delete-screen':
        return FadeRoute(
          page: const DeleteScreen(),
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
