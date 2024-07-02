import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/astrologer_dashboard.dart';
import 'screens/chat_request.dart';
import 'screens/chat_request_initiate.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/astroDash': (context) => const AstroDashboard(),
        '/chatRequest': (context) => const ChatRequestScreen(),
        '/chatRequestIni': (context) => const ChatRequestInitiate(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF6200EE),
          secondary: Color(0xFF03DAC6),
          surface: Colors.white,
          background: Colors.white,
          error: Color(0xFFB00020),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color(0xFF181818).withOpacity(0.5),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF008CD3),
              width: 1.0,
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
        child: const MainScreen(),
      ),
    );
  }
}
