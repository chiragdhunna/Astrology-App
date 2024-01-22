import 'package:flutter/material.dart';

class MatchMakingScreen extends StatelessWidget {
  const MatchMakingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Match Making",
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              color: Color(0xFF000000),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const MatchMakingForm(
                  title: 'Boy',
                ),
                const MatchMakingForm(
                  title: 'Girl',
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    side: const BorderSide(width: 1, color: Color(0xFFFE9E2D)),
                    elevation: 0,
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
                        'Match Kundli',
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
        ),
      ),
    );
  }
}

class MatchMakingForm extends StatefulWidget {
  final String title;
  const MatchMakingForm({
    super.key,
    required this.title,
  });

  @override
  State<MatchMakingForm> createState() => _MatchMakingFormState();
}

class _MatchMakingFormState extends State<MatchMakingForm> {
  final _kundliFormKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _placeOfBirthController = TextEditingController();
  final List<String> gender = ['Male', 'Female', 'Other'];
  final OutlineInputBorder fieldDecor = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: const BorderSide(color: Colors.grey),
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _kundliFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Enter ${widget.title} Details",
            style: const TextStyle(
              fontSize: 18.0,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              color: Color(0xFFEE542A),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 45,
            child: TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                border: fieldDecor,
                focusedBorder: fieldDecor,
                enabledBorder: fieldDecor,
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
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 45,
            child: TextFormField(
              controller: _dobController,
              decoration: InputDecoration(
                suffixIcon: Image.asset('form/calendar.png'),
                border: fieldDecor,
                focusedBorder: fieldDecor,
                enabledBorder: fieldDecor,
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
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 45,
            child: DropdownButtonFormField(
              icon: const Icon(Icons.keyboard_arrow_down_rounded),
              decoration: InputDecoration(
                disabledBorder: fieldDecor,
                border: fieldDecor,
                focusedBorder: fieldDecor,
                enabledBorder: fieldDecor,
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
                setState(() {
                  _genderController.text = newValue!;
                });
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 45,
            child: TextFormField(
              controller: _timeController,
              decoration: InputDecoration(
                border: fieldDecor,
                focusedBorder: fieldDecor,
                enabledBorder: fieldDecor,
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
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 45,
            child: TextFormField(
              controller: _placeOfBirthController,
              decoration: InputDecoration(
                border: fieldDecor,
                focusedBorder: fieldDecor,
                enabledBorder: fieldDecor,
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
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
