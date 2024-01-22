import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Payment Method",
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 140,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return const SizedBox(
                        height: 130,
                        width: 45,
                        child: Center(
                          child: Icon(Icons.add),
                        ),
                      );
                    } else {
                      return Container(
                        height: 130,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(238, 84, 42, 1),
                              Color.fromRGBO(254, 158, 45, 1),
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(17.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 20,
                                        color: Colors.transparent,
                                      ),
                                      SizedBox(
                                        child: Image.asset(
                                          'assets/circle_1.png',
                                          height: 20,
                                          width: 20,
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        left: 10,
                                        child: SizedBox(
                                          child: Image.asset(
                                            'assets/circle_2.png',
                                            height: 20,
                                            width: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    "06/28",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontFamily: 'RobotoMono',
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF000000),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset('assets/card_dots.png'),
                                  Image.asset('assets/card_dots.png'),
                                  Image.asset('assets/card_dots.png'),
                                  const Text(
                                    "1234",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Customer name",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                  Text(
                                    "Debit Card",
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    width: 23,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Other Payments Methods",
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF5E6A81),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    width: 45.0,
                    height: 39.0,
                    decoration: const BoxDecoration(
                      color: Color(0xFFEE542A),
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                    child: Image.asset(
                      'assets/credit-card.png',
                      height: 24,
                      width: 24,
                    ),
                  ),
                  const SizedBox(
                    width: 19,
                  ),
                  const Text(
                    "Credit/Debit Card",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF5E6A81),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    width: 45.0,
                    height: 39.0,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFE9E2D),
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                    child: Image.asset(
                      'assets/payments/net_bank.png',
                      height: 24,
                      width: 24,
                    ),
                  ),
                  const SizedBox(
                    width: 19,
                  ),
                  const Text(
                    "Net Banking",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF5E6A81),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    width: 45.0,
                    height: 39.0,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFDE59),
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                    child: Image.asset(
                      'assets/payments/gpay.png',
                      height: 24,
                      width: 24,
                    ),
                  ),
                  const SizedBox(
                    width: 19,
                  ),
                  const Text(
                    "Google Pay",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF5E6A81),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    width: 45.0,
                    height: 39.0,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFDE59),
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                    child: Image.asset(
                      'assets/payments/paytm.png',
                      height: 24,
                      width: 24,
                    ),
                  ),
                  const SizedBox(
                    width: 19,
                  ),
                  const Text(
                    "Paytm",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF5E6A81),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    width: 45.0,
                    height: 39.0,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFDE59),
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                    child: Image.asset(
                      'assets/payments/upi.png',
                      height: 24,
                      width: 24,
                    ),
                  ),
                  const SizedBox(
                    width: 19,
                  ),
                  const Text(
                    "UPI ID",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF5E6A81),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
