// ignore_for_file: camel_case_types

import 'package:ecommerce_app_firebase/controller/provider/cart_provider.dart';
import 'package:ecommerce_app_firebase/models/getx/theme_getx_model.dart';
import 'package:ecommerce_app_firebase/views/screens/cart_screen.dart';
import 'package:ecommerce_app_firebase/views/screens/detail_page.dart';
import 'package:ecommerce_app_firebase/views/screens/favourite_list_screen.dart';
import 'package:ecommerce_app_firebase/views/screens/home_page.dart';
import 'package:ecommerce_app_firebase/views/screens/intro_screen.dart';
import 'package:ecommerce_app_firebase/views/screens/log_in_screen.dart';
import 'package:ecommerce_app_firebase/views/screens/log_sign_page.dart';
import 'package:ecommerce_app_firebase/views/screens/sign_in_screen.dart';
import 'package:ecommerce_app_firebase/views/screens/splash_screen.dart';
import 'package:ecommerce_app_firebase/views/screens/view_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const myApp());
}

class myApp extends StatefulWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartController()),
      ],
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeModel.lightTheme,
          darkTheme: ThemeModel.darkTheme,
          initialRoute: 'splashScreen',
          routes: {
            'splashScreen': (context) => const SplashScreen(),
            'introScreen': (context) => const IntroScreen(),
            'logSignPage': (context) => const LogSignPage(),
            'signInScreen': (context) => const SignInScreen(),
            'logInScreen': (context) => const LogInScreen(),
            'homePage': (context) => const HomePage(),
            'viewScreen': (context) => const ViewScreen(),
            'DetailPage': (context) => const DetailPage(),
            'favouriteScreen': (context) => const FavouriteScreen(),
            'CartScreen': (context) => const CartScreen(),
          },
        );
      },
    );
  }
}
