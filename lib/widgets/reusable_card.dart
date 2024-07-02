import 'package:flutter/material.dart';

import '../screens/astrologer_screen.dart';

class CustomCard extends StatelessWidget {
  final String name;
  final String category;
  final String exp;
  final String cost;
  final String buttonText;
  final String avatar;

  const CustomCard({
    Key? key,
    required this.name,
    required this.exp,
    required this.category,
    required this.cost,
    required this.buttonText,
    required this.avatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: 300,
          color: Colors.transparent,
        ),
        Column(
          children: <Widget>[
            Container(
              height: 175,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(width: 2.0, color: Colors.black),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.star,
                          color: Color(0xffEE542A),
                          size: 10,
                        ),
                        Text(
                          "5",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF5E6A81),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 30.0,
                    child: Image.asset(avatar),
                  ),
                  const SizedBox(height: 3.0),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    category,
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF5E6A81),
                    ),
                  ),
                  Text(
                    exp,
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF5E6A81),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        cost,
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFEE542A),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "₹ 25",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF5E6A81),
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 175 - 15.0, // (background container size) - (circle height / 2)
          child: InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AstrologerScreen(name: 'Name'),
              ),
            ),
            child: Container(
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFFEE542A), Color(0xFFFE9E2D)],
                ),
              ),
              child: Center(child: Text(buttonText)),
            ),
          ),
        ),
      ],
    );
  }
}
// const SizedBox(
//   width: 20,
// ),
// Stack(
//   clipBehavior: Clip.hardEdge,
//   alignment: Alignment.center,
//   children: <Widget>[
//     Container(
//       height: 300,
//       color: Colors.green,
//     ),
//     Column(
//       children: <Widget>[
//         Container(
//           height: 165,
//           width: double.infinity,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10.0),
//             border: Border.all(width: 2.0, color: Colors.black),
//             color: Colors.white,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Icon(
//                     Icons.star,
//                     color: Color(0xffEE542A),
//                     size: 10,
//                   ),
//                   Text(
//                     "5",
//                     style: TextStyle(
//                       fontSize: 12.0,
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xFF5E6A81),
//                     ),
//                   ),
//                 ],
//               ),
//               CircleAvatar(
//                 radius: 30.0,
//                 child: Image.asset('assets/commons/avatar.png'),
//               ),
//               const SizedBox(height: 3.0),
//               Text(
//                 name,
//                 style: const TextStyle(
//                   fontSize: 14.0,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                 ),
//               ),
//               Text(
//                 category,
//                 style: const TextStyle(
//                   fontSize: 12.0,
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w400,
//                   color: Color(0xFF5E6A81),
//                 ),
//               ),
//               Text(
//                 exp,
//                 style: const TextStyle(
//                   fontSize: 12.0,
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w400,
//                   color: Color(0xFF5E6A81),
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     cost,
//                     style: const TextStyle(
//                       fontSize: 12.0,
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w600,
//                       color: Color(0xFFEE542A),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 5,
//                   ),
//                   const Text(
//                     "₹ 25",
//                     style: TextStyle(
//                       fontSize: 12.0,
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xFF5E6A81),
//                       decoration: TextDecoration.lineThrough,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//     Positioned(
//       top: 165 -
//           15.0, // (background container size) - (circle height / 2)
//       child: InkWell(
//         onTap: () => Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const AstrologerScreen(name: 'Name'),
//           ),
//         ),
//         child: Container(
//           width: 100,
//           height: 30,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             gradient: const LinearGradient(
//               begin: Alignment.centerLeft,
//               end: Alignment.centerRight,
//               colors: [Color(0xFFEE542A), Color(0xFFFE9E2D)],
//             ),
//           ),
//           child: Center(child: Text(buttonText)),
//         ),
//       ),
//     ),
//   ],
// ),
