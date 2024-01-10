import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testpts/controllers/toggleMsg/toggle_msg.dart';
import 'package:testpts/views/homePage/providers/home_page_provider.dart';
import 'package:testpts/views/itemView/providers/item_page_provider.dart';
import 'package:testpts/views/registrationPage/subViews/loginPage/login_page_view.dart';
import 'package:testpts/views/registrationPage/subViews/loginPage/providers/login_page_provider.dart';
import 'package:testpts/views/registrationPage/subViews/signupPage/providers/signup_page_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ItemPageProvider()),
        ChangeNotifierProvider(create: (_) => LoginPageProvider()),
        ChangeNotifierProvider(create: (_) => SignupPageProvider()),
        ChangeNotifierProvider(create: (_) => HomePageProvider()),
      ],
      child: MaterialApp(
        scaffoldMessengerKey: AlertServices.alertServices.scaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        home: const LoginPageView(),
      ),
    );
  }
}
