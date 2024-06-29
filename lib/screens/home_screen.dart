import 'package:flutter/material.dart';

import '../widgets/app_scaffold.dart';
import 'astrologer_screen.dart';
import 'match_making_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List topList = [
      'Weekly\nHoroscope',
      'Free\nKundli',
      'Match\nMaking',
      'Detailed\nAnalysis'
    ];
    final List topIcons = [
      'assets/horoscope.png',
      'assets/esoteric.png',
      'assets/wedding.png',
      'assets/doc.png',
    ];
    final ShapeDecoration topContainerDecor = ShapeDecoration(
      gradient: const LinearGradient(
        begin: Alignment(0.00, -1.00),
        end: Alignment(0, 1),
        colors: [Color(0xFFEE542A), Color(0xFFFE9E2D)],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: MyScaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 140,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const AstrologerScreen(name: 'Name'),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: topContainerDecor,
                          child: Center(
                            child: Image.asset(
                              topIcons[0],
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          topList[0],
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF000000),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: topContainerDecor,
                        child: Center(
                          child: Image.asset(
                            topIcons[1],
                            width: 40,
                            height: 40,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        topList[1],
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF000000),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MatchMakingScreen(),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: topContainerDecor,
                          child: Center(
                            child: Image.asset(
                              topIcons[2],
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          topList[2],
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF000000),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: topContainerDecor,
                        child: Center(
                          child: Image.asset(
                            topIcons[3],
                            width: 40,
                            height: 40,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        topList[3],
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF000000),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 126,
              decoration: ShapeDecoration(
                color: const Color(0xFF460303),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'First Consultation Free',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text(
                        'Chat With Astrologer',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              'assets/call-dark.png',
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                'assets/chat-dark.png',
                              )),
                        ],
                      )
                    ],
                  ),
                  Image.asset(
                    'assets/lady.png',
                    width: 70,
                    height: 100,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // Image.asset('assets/slider_dots.jpg'),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      width: screenWidth * 0.44,
                      height: 164,
                      decoration: ShapeDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(0.00, -1.00),
                          end: Alignment(0, 1),
                          colors: [Color(0xFFEE542A), Color(0xFFFFDE59)],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('assets/wedding-rings.png'),
                            width: 50,
                            height: 50,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Delay In Marriage | \nSeparation | Divorce',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: screenWidth * 0.44,
                      height: 100,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFFDE59),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/kids.png',
                            width: 50,
                            height: 50,
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          const Text(
                            'Kids',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: screenWidth * 0.44,
                      height: 100,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFFDE59),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/briefcase.png',
                            width: 50,
                            height: 50,
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          const Text(
                            'Loss In Business',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: screenWidth * 0.44,
                      height: 164,
                      decoration: ShapeDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(0.00, -1.00),
                          end: Alignment(0, 1),
                          colors: [Color(0xFFEE542A), Color(0xFFFFDE59)],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/open-book.png',
                            width: 50,
                            height: 50,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Job | Career |\n Education',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
