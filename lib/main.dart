import 'package:api/screens/astrologer_dashboard.dart';
import 'package:api/screens/chat_request.dart';
import 'package:api/screens/chat_request_initiate.dart';
import 'package:api/screens/chat_screen_new.dart';
import 'package:api/screens/login_screen.dart';
import 'package:api/screens/main_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/astroDash': (context) => AstroDashboard(),
        '/chatRequest': (context) => ChatRequestScreen(),
        '/chatRequestIni': (context) => ChatRequestInitiate(),
      },
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFFFFF),
          elevation: 0,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
        ),
        dropdownMenuTheme: DropdownMenuThemeData(
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: const Color(0xFF181818).withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF008CD3),
                width: 1.0,
              ),
            ),
          ),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: const Color.fromARGB(255, 255, 132, 0),
          statusBarIconBrightness: Brightness.light,
        ),
        child: const LoginScreen(),
      ),
    );
  }
}
