import 'package:flutter/material.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  final List<String> filters = const [
    'Vedic',
    'Numerology',
    'Tarot Reader',
    'Palmistry',
    'Lal Kitab',
    'Vastu',
  ];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    // const BoxDecoration unselectedDecor = BoxDecoration(
    //   gradient: LinearGradient(
    //     colors: [
    //       Color(0xFFEE542A),
    //       Color.fromRGBO(254, 158, 45, 0),
    //     ],
    //     stops: [0.0, 1.0484],
    //     begin: Alignment.centerLeft,
    //     end: Alignment.centerRight,
    //   ),
    //   borderRadius: BorderRadius.all(Radius.circular(25)),
    // );

    // const BoxDecoration selectedDecor = BoxDecoration(
    //   gradient: LinearGradient(
    //     colors: [
    //       Color(0xFFEE542A),
    //       Color(0xFFFE9E2D),
    //     ],
    //     stops: [0.0, 1.0484],
    //     begin: Alignment.centerLeft,
    //     end: Alignment.centerRight,
    //   ),
    //   borderRadius: BorderRadius.all(Radius.circular(25)),
    // );

    return SafeArea(
      child: Center(
        child: Text(
          "Under Developmemnt",
          style: TextStyle(
            fontSize: 26,
          ),
        ),
      ),

      // MyScaffold(
      //   body: Column(
      //     children: [
      //       SizedBox(
      //         height: 50,
      //         child: ListView.builder(
      //           scrollDirection: Axis.horizontal,
      //           itemCount: filters.length,
      //           itemBuilder: (context, index) {
      //             final filter = filters[index];
      //             return Padding(
      //               padding: const EdgeInsets.symmetric(
      //                 horizontal: 8.0,
      //               ),
      //               child: Container(
      //                 height: 37,
      //                 width: 124,
      //                 decoration: selectedFilter == filter
      //                     ? selectedDecor
      //                     : unselectedDecor,
      //                 child: InkWell(
      //                   onTap: () {
      //                     setState(() {
      //                       selectedFilter = filter;
      //                     });
      //                   },
      //                   child: Center(
      //                     child: Text(
      //                       filter,
      //                       style: const TextStyle(
      //                         fontSize: 16,
      //                         fontFamily: "Poppins",
      //                         fontWeight: FontWeight.w500,
      //                         color: Color(0xFF000000),
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             );
      //           },
      //         ),
      //       ),
      //       const SizedBox(
      //         height: 18,
      //       ),
      //       SizedBox(
      //         child: GridView.count(
      //           shrinkWrap: true,
      //           physics: const NeverScrollableScrollPhysics(),
      //           crossAxisCount: 2,
      //           mainAxisSpacing: 30.0,
      //           children: List.generate(
      //             6,
      //             (index) {
      //               return InkWell(
      //                 onTap: () => Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                     builder: (context) =>
      //                         const AstrologerScreen(name: 'Name'),
      //                   ),
      //                 ),
      //                 child: const CustomCard(
      //                   name: 'Name',
      //                   exp: 'Exp: 5 yrs',
      //                   category: 'Vedic',
      //                   cost: '₹ 5',
      //                   buttonText: 'Call',
      //                 ),
      //               );
      //             },
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
