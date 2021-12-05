import 'package:flutter/material.dart';
import 'package:store_app/screens/HomeScreens/HomeScreen.dart';
import 'package:store_app/screens/HomeScreens/SearchFoodScreen.dart';
import 'package:store_app/screens/LoginAndRegisterScreens/ForgitPasswordScreen.dart';
import 'package:store_app/screens/LoginAndRegisterScreens/LoginScreen.dart';
import 'package:store_app/screens/LoginAndRegisterScreens/RegisterScreen.dart';
import 'package:store_app/screens/LoginAndRegisterScreens/ResetPassword.dart';
import 'package:store_app/screens/LoginAndRegisterScreens/VerfictionScreen.dart';
import 'package:store_app/screens/OutBoardingScreen.dart';
import 'package:store_app/screens/launch_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 896),
      builder: () => MaterialApp(
        // localizationsDelegates: [
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        // ],
        // supportedLocales: [Locale("en"), Locale("ar")],
        // locale: const Locale("en"),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.amber,
            primarySwatch: Colors.amber,
            fontFamily: "Product Sans"),
        initialRoute: '/launch_screen',
        routes: {
          '/launch_screen': (context) => const LaunchScreen(),
          '/out_boarding_screen': (context) => const OutBoardingScreen(),
          '/login_screen': (context) => const LoginScreen(),
          '/register_screen': (context) => const RegisterScreen(),
          '/home_screen': (context) => const HomeScreen(),
          "/search_screen": (context) => const SearchFoodScreen(),
          "/verify_screen": (context) => const VerfictionScreen(),
          "/forget_password_screen": (context) => const ForgetPassword(),
          "/reset_screen": (context) => const ResetPassword(),
        },
      ),
    );
  }
}
