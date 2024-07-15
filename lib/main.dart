import 'package:barfly_user/appConstants.dart';
import 'package:barfly_user/routeGenerator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await GetStorage.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/home-screen',
        theme: ThemeData(
          primaryColor: APP_COLORS.backgroundColor,
          scaffoldBackgroundColor: APP_COLORS.backgroundColor,
        ),
        onGenerateRoute: RouteGenerator.generateRoute);
  }
}
