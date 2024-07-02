import '../api_services/func.dart';
import '../widgets/useful.dart';
import 'details_screen.dart';
import 'main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTP extends StatefulWidget {
  final int number;
  final String email;

  const OTP({super.key, required this.number, required this.email});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final TextEditingController pinEditingController = TextEditingController();

  callVerifyApi() {
    final service = ApiServices();

    service
        .apiCallVerify(widget.email, pinEditingController.text)
        .then((value) {
      Snacker(value.msg!, _messangerKey, context);

      if (value.status == 200) {
        Future.delayed(const Duration(seconds: 3), () {
          if (widget.number == 1) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const Details(),
              ),
            );
          } else if (widget.number == 2) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const MainScreen(),
              ),
            );
          }
        });
      }
    });
  }

  final _messangerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: _messangerKey,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.keyboard_arrow_left_sharp,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Edit Number',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
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
                const Center(
                  child: Text(
                    'You have received OTP on',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 40.0),
                  width: 300.0,
                  child: PinCodeTextField(
                    appContext: context,
                    length: 6,
                    onChanged: (value) {},
                    controller: pinEditingController,
                    pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        inactiveColor: Colors.grey,
                        activeColor: Colors.grey,
                        selectedColor: Colors.grey),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    obscureText: false,
                    obscuringCharacter: '*',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    print(pinEditingController.text);
                    callVerifyApi();
                  },
                  child: Container(
                    width: 380,
                    height: 45,
                    decoration: ShapeDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment(0.00, -1.00),
                        end: Alignment(0, 1),
                        colors: [Color(0xFFEE542A), Color(0xFFFE9E2D)],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Center(
                        child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    )),
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
