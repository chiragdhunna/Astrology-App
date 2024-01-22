import 'package:api/screens/payment_screen.dart';
import 'package:flutter/material.dart';

class KundliFormScreen extends StatelessWidget {
  const KundliFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Free Kundli",
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              color: Color(0xFF000000),
            ),
          ),
        ),
        body: const KundliForm(),
      ),
    );
  }
}

class KundliForm extends StatefulWidget {
  const KundliForm({super.key});

  @override
  State<KundliForm> createState() => _KundliFormState();
}

class _KundliFormState extends State<KundliForm> {
  final _kundliFormKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _placeOfBirthController = TextEditingController();
  final List<String> gender = ['Male', 'Female', 'Other'];

  final OutlineInputBorder borders = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide:
        const BorderSide(color: Colors.grey), // Set border color to transparent
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _kundliFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 45,
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: borders,
                  focusedBorder: borders,
                  enabledBorder: borders,
                  label: const Text(
                    "Name",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 45,
              child: TextFormField(
                controller: _dobController,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.calendar_month_rounded),
                  border: borders,
                  focusedBorder: borders,
                  enabledBorder: borders,
                  label: const Text(
                    "Date of Birth",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    _dobController.text =
                        pickedDate.toLocal().toString().split(' ')[0];
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your date of birth';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 45,
              child: DropdownButtonFormField(
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                decoration: InputDecoration(
                  disabledBorder: borders,
                  border: borders,
                  focusedBorder: borders,
                  enabledBorder: borders,
                  label: const Text(
                    "Gender",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                items: gender.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (newValue) {
                  // Update the value when the user selects an option
                  setState(() {
                    _genderController.text = newValue!;
                  });
                },
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 45,
              child: TextFormField(
                controller: _timeController,
                decoration: InputDecoration(
                  border: borders,
                  focusedBorder: borders,
                  enabledBorder: borders,
                  label: const Text(
                    "Time",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the time';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 45,
              child: TextFormField(
                controller: _placeOfBirthController,
                decoration: InputDecoration(
                  border: borders,
                  focusedBorder: borders,
                  enabledBorder: borders,
                  label: const Text(
                    "Place of Birth",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your place of birth';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_kundliFormKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentScreen(),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                side: const BorderSide(width: 1, color: Color(0xFFFE9E2D)),
                elevation: 0, // Set elevation to 0 to remove the shadow
              ),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment(0.00, -1.00),
                    end: Alignment(0, 1),
                    colors: [Color(0xFFEE542A), Color(0xFFFE9E2D)],
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Container(
                  width: double.infinity,
                  height: 45,
                  alignment: Alignment.center,
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
