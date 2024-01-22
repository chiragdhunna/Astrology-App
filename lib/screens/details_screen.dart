import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'main_screen.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final TextEditingController pinEditingController = TextEditingController();
  String? selectedGender;
  String? selectedAstrologyType;
  String? selectedExpertise;
  String? selectedFilePath;

  final formFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide:
        const BorderSide(color: Colors.grey), // Set border color to transparent
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Enter Your Details",
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              color: Color(0xFF000000),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04),
            child: Column(
              children: [
                SizedBox(
                  height: 45,
                  child: TextField(
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      border: formFieldBorder,
                      focusedBorder: formFieldBorder,
                      enabledBorder: formFieldBorder,
                      label: Text(
                        'Name',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.25),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 45,
                  child: TextField(
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      border: formFieldBorder,
                      focusedBorder: formFieldBorder,
                      enabledBorder: formFieldBorder,
                      label: Text(
                        'E-mail',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.25),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 45,
                  child: DropdownButtonFormField<String>(
                    icon: const Icon(
                      Icons.keyboard_arrow_down_sharp,
                    ),
                    value: selectedGender,
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedGender = newValue;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 20),
                      border: formFieldBorder,
                      focusedBorder: formFieldBorder,
                      enabledBorder: formFieldBorder,
                      labelText: 'Gender',
                      labelStyle: TextStyle(
                        color: Colors.black.withOpacity(0.25),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    items: <String>['Male', 'Female', 'Others']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 45,
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      LengthLimitingTextInputFormatter(10),
                    ],
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      border: formFieldBorder,
                      focusedBorder: formFieldBorder,
                      enabledBorder: formFieldBorder,
                      label: Text(
                        'Phone Number',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.25),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 45,
                  child: TextField(
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      border: formFieldBorder,
                      focusedBorder: formFieldBorder,
                      enabledBorder: formFieldBorder,
                      label: Text(
                        'Aadhaar Number',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.25),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 45,
                  child: DropdownButtonFormField<String>(
                    value: selectedAstrologyType,
                    icon: const Icon(
                      Icons.keyboard_arrow_down_sharp,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedAstrologyType = newValue;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 20),
                      border: formFieldBorder,
                      focusedBorder: formFieldBorder,
                      enabledBorder: formFieldBorder,
                      labelText: 'Astrology Type',
                      labelStyle: TextStyle(
                        color: Colors.black.withOpacity(0.25),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    items: <String>[
                      'Vedic',
                      'Numerology',
                      'Tarot Reader',
                      'Palmistry',
                      'Lal Kitab',
                      'Vastu'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 45,
                  child: DropdownButtonFormField<String>(
                    icon: const Icon(
                      Icons.keyboard_arrow_down_sharp,
                    ),
                    value: selectedExpertise,
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedExpertise = newValue;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 20),
                      border: formFieldBorder,
                      focusedBorder: formFieldBorder,
                      enabledBorder: formFieldBorder,
                      labelText: 'Expertise',
                      labelStyle: TextStyle(
                        color: Colors.black.withOpacity(0.25),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    items: <String>[
                      'All',
                      'Love',
                      'Education',
                      'Career',
                      'Marriage',
                      'Health',
                      'Finance',
                      'Business',
                      'Kids'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 45,
                  child: TextField(
                    readOnly: true,
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      border: formFieldBorder,
                      focusedBorder: formFieldBorder,
                      enabledBorder: formFieldBorder,
                      suffixIcon: const Icon(
                        Icons.arrow_upward,
                      ),
                      labelText: 'Upload Qualification Certificate',
                      labelStyle: TextStyle(
                        color: Colors.black.withOpacity(0.25),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => MainScreen(),
                      ),
                    );
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
                      'Submit',
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
