import 'package:flutter/material.dart';

import '../widgets/app_scaffold.dart';
import '../widgets/reusable_card.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<String> filters = const [
    'Vedic',
    'Numerology',
    'Tarot Reader',
    'Palmistry',
    'Lal Kitab',
    'Vastu',
  ];

  final List<String> avatars = [
    'assets/avatar.png',
    'assets/avatar-yellow.png',
    'assets/avatar.png',
    'assets/avatar-yellow.png',
    'assets/avatar.png',
    'assets/avatar-yellow.png',
  ];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const BoxDecoration unselectedDecor = BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0xFFEE542A),
          Color.fromRGBO(254, 158, 45, 0),
        ],
        stops: [0.0, 1.0484],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      borderRadius: BorderRadius.all(Radius.circular(25)),
    );

    const BoxDecoration selectedDecor = BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0xFFEE542A),
          Color(0xFFFE9E2D),
        ],
        stops: [0.0, 1.0484],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      borderRadius: BorderRadius.all(Radius.circular(25)),
    );
    return SafeArea(
      child: MyScaffold(
        body: Column(
          children: [
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Container(
                    height: 37,
                    width: 124,
                    decoration: selectedFilter == filter
                        ? selectedDecor
                        : unselectedDecor,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Center(
                        child: Text(
                          filter,
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  width: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              // Will support till 350 px.

              child: GridView.builder(
                itemCount: 12,
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return CustomCard(
                    name: 'Name',
                    exp: 'Exp: 5 yrs',
                    category: 'Vedic',
                    cost: '₹ 5',
                    buttonText: 'Chat',
                    avatar: avatars[filters.indexOf(selectedFilter)],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
