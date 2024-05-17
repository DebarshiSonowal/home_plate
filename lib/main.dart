import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:home_plate/Constants/constants.dart';
import 'package:home_plate/Storage/CustomStorage.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'Navigation/Navigate.dart';
import 'Repository/repository.dart';
import 'Repository/theme.dart';
import 'Router/router.dart';

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dotenv.load(fileName: ".env");
  await Storage.instance.initializeStorage();
  Future.delayed(const Duration(seconds: 4),()=>FlutterNativeSplash.remove());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Repository>(
          create: (context) => Repository(),
        ),
        ChangeNotifierProvider<CustomTheme>(
          create: (context) => CustomTheme(),
        ),
      ],
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return Consumer<CustomTheme>(builder: (context, data, _) {
            return MaterialApp(
              title: 'Home Plate',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: Constants.thirdColor,
                  primary: Constants.secondaryColor,
                  secondary: Constants.primaryColor,
                  brightness:
                      data.isDarkMode ? Brightness.dark : Brightness.light,
                ),
                useMaterial3: true,
              ),
              navigatorKey: Navigation.instance.navigatorKey,
              onGenerateRoute: generateRoute,
              // home: const MyHomePage(title: 'Flutter Demo Home Page'),
            );
          });
        },
      ),
    );
  }
}
String convertPhoneNumber(String phoneNumber) {
  return phoneNumber.replaceFirst(RegExp(r'^\+1\s*'), '');
}
