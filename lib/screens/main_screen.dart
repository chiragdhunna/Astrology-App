import 'package:api/screens/chat_screen_new.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'call_screen.dart';
import 'chat_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPage = 0;
  List<Widget> pages = [
    const HomeScreen(),
    const CallScreen(),
    const Placeholder(),
    const ChatScreen(),
    const Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: currentPage,
          children: pages,
        ),
        bottomNavigationBar: Container(
          width: 430,
          height: 63,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x14000000),
                blurRadius: 14,
                offset: Offset(0, -2),
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentPage = 0;
                  });
                },
                child: currentPage == 0
                    ? SvgPicture.asset(
                        'assets/home.svg',
                        fit: BoxFit.contain,
                        height: 20,
                        width: 20,
                      )
                    : SvgPicture.asset(
                        'assets/home-empty.svg',
                        fit: BoxFit.contain,
                        height: 20,
                        width: 20,
                      ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentPage = 1;
                  });
                },
                child: currentPage == 1
                    ? Image.asset(
                        'assets/call-dark.png',
                        fit: BoxFit.contain,
                        height: 20,
                        width: 20,
                      )
                    : Image.asset(
                        'assets/call.png',
                        fit: BoxFit.contain,
                        height: 20,
                        width: 20,
                      ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentPage = 2;
                  });
                },
                child: currentPage == 2
                    ? SvgPicture.asset(
                        'assets/union-dark.svg',
                        fit: BoxFit.contain,
                        height: 20,
                        width: 20,
                      )
                    : SvgPicture.asset(
                        'assets/union.svg',
                        fit: BoxFit.contain,
                        height: 20,
                        width: 20,
                      ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentPage = 3;

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            ChatScreenNew(isUser: true, isAstrologer: false),
                      ),
                    );
                  });
                },
                child: currentPage == 3
                    ? Image.asset(
                        'assets/chat-dark.png',
                        fit: BoxFit.contain,
                        height: 20,
                        width: 20,
                      )
                    : Image.asset(
                        'assets/chat.png',
                        fit: BoxFit.contain,
                        height: 20,
                        width: 20,
                      ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentPage = 4;
                  });
                },
                child: currentPage == 4
                    ? SvgPicture.asset(
                        'assets/account.svg',
                        fit: BoxFit.contain,
                        height: 20,
                        width: 20,
                      )
                    : SvgPicture.asset(
                        'assets/account.svg',
                        fit: BoxFit.contain,
                        height: 20,
                        width: 20,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
