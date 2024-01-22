import 'package:flutter/material.dart';

class WeeklyHorrorscopeScreen extends StatefulWidget {
  const WeeklyHorrorscopeScreen({super.key});

  @override
  State<WeeklyHorrorscopeScreen> createState() =>
      _WeeklyHorrorscopeScreenState();
}

class _WeeklyHorrorscopeScreenState extends State<WeeklyHorrorscopeScreen> {
  final List<String> zodiacs = const [
    'Aries',
    'Tauras',
    'Gemini',
    'Cancer',
    'Leo',
  ];

  final List<String> zodiacsicons = const [
    'assets/horrorscope_screen/top_row/aries.png',
    'assets/horrorscope_screen/top_row/taurus.png',
    'assets/horrorscope_screen/top_row/gemini.png',
    'assets/horrorscope_screen/top_row/cancer.png',
    'assets/horrorscope_screen/top_row/leo.png',
  ];

  final List<BoxDecoration> containerDecors = [
    BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: const Color(0xFFEE542A), // Border color
        width: 1,
      ),
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(238, 84, 42, 0.17),
          Color.fromRGBO(238, 84, 42, 0),
        ],
      ),
    ),
    BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: const Color(0xFF5CFF59), // Border color
        width: 1,
      ),
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(92, 255, 89, 0.17),
          Color.fromRGBO(92, 255, 89, 0.0357),
        ],
      ),
    ),
    BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: const Color(0xFFFE9E2D), // Border color
        width: 1,
      ),
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(254, 158, 45, 0.17),
          Color.fromRGBO(254, 158, 45, 0.034),
        ],
      ),
    ),
    BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: const Color(0xFF2DFEFE), // Border color
        width: 1,
      ),
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(45, 254, 254, 0.17),
          Color.fromRGBO(45, 254, 254, 0.0255),
        ],
      ),
    ),
    BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: const Color(0xFFAFFE2D), // Border color
        width: 1,
      ),
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(175, 254, 45, 0.17),
          Color.fromRGBO(175, 254, 45, 0.03),
        ],
      ),
    ),
  ];
  final List<String> containerIcons = [
    'assets/horrorscope_screen/body_cards/heart.png',
    'assets/horrorscope_screen/body_cards/career.png',
    'assets/horrorscope_screen/body_cards/health.png',
    'assets/horrorscope_screen/body_cards/travel.png',
    'assets/horrorscope_screen/body_cards/money.png',
  ];

  final List<String> containerTitles = [
    'Love',
    'Career',
    'Health',
    'Travel',
    'Money',
  ];

  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = zodiacs[0];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Weekly Horoscope",
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              color: Color(0xFF000000),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 25,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: zodiacs.length,
                    itemBuilder: (context, index) {
                      return TopCard(
                        icon: zodiacsicons[index],
                        title: zodiacs[index],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height - 150,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 30,
                    ),
                    itemCount: containerTitles.length,
                    itemBuilder: (context, index) {
                      return MyCard(
                        icon: containerIcons[index],
                        title: containerTitles[index],
                        decor: containerDecors[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopCard extends StatelessWidget {
  final String icon;
  final String title;
  const TopCard({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFFFDE59), Color(0xFFFE9E2D)],
            ),
          ),
          child: Image.asset(icon),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            color: Color(0xFF000000),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class MyCard extends StatelessWidget {
  final String icon;
  final String title;
  final BoxDecoration decor;

  const MyCard({
    super.key,
    required this.icon,
    required this.title,
    required this.decor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decor,
      width: 380.0,
      height: 150.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            leading: Image.asset(icon),
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 16.0,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                color: Color(0xFF000000),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SizedBox(
              height: 84,
              width: 334,
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF000000),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
