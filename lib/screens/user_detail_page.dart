/* import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UserDetailPage extends StatefulWidget {
  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Your Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildTextField(label: 'Full Name'),
            _buildTextField(label: 'Email'),
            _buildDropdown(
                label: 'Gender', items: ['Male', 'Female', 'Others']),
            _buildTextField(label: 'Phone Number'),
            _buildTextField(label: 'Aadhaar Number'),
            _buildDropdown(
                label: 'Astrology Type',
                items: ['Vedic', 'Numerology', 'Tarot Reader']),
            _buildDropdown(label: 'Expertise', items: ['Astrology', 'Vastu']),
            UploadQualificationCertificate(),
            const SizedBox(height: 20),
            _buildSubmitButton(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildTextField({required String label}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 48, // Set the height to match UploadQualificationCertificate
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: label,
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 16), // Adjust horizontal padding
            border: InputBorder.none, // No border
            isDense: true, // Important to line up with the height
          ),
          keyboardType: label == 'Phone Number'
              ? TextInputType.phone
              : TextInputType.text,
        ),
      ),
    );
  }

  Widget _buildDropdown({required String label, required List<String> items}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 48, // Set the height to match UploadQualificationCertificate
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(30),
        ),
        child: DropdownButtonFormField(
          decoration: InputDecoration(
            labelText: label,
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 16), // Adjust horizontal padding
            border: InputBorder.none, // No border
            isDense: true, // Important to line up with the height
          ),
          items: items.map((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {},
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFEE542A), Color(0xFFFE9E2D)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text(
        'Submit',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.phone),
          label: 'Contact',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera_alt),
          label: 'Camera',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.red[800],
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class UploadQualificationCertificate extends StatefulWidget {
  @override
  _UploadQualificationCertificateState createState() =>
      _UploadQualificationCertificateState();
}

class _UploadQualificationCertificateState
    extends State<UploadQualificationCertificate> {
  String selectedFileName = 'Upload Qualification Certificate';

  Future<void> openFilePicker() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        String? fileName = result.files.single.name;
        setState(() {
          selectedFileName = fileName ?? 'Upload Qualification Certificate';
        });
        // You can also access the file itself using result.files.single.bytes
      }
    } catch (e) {
      print("Error picking file: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        openFilePicker(); // Open file picker when the container is clicked
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedFileName,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            Icon(
              Icons.arrow_upward,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
 */

/* import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserDetailPage extends StatefulWidget {
  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  int _selectedIndex = 0;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _aadhaarNumberController =
      TextEditingController();

  String _selectedGender = 'Male';
  String _selectedAstrologyType = 'Vedic';
  String _selectedExpertise = 'Astrology';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Your Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildTextField(
                label: 'Full Name', controller: _fullNameController),
            _buildTextField(label: 'Email', controller: _emailController),
            _buildDropdown(
                label: 'Gender',
                items: ['Male', 'Female', 'Others'],
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value!;
                  });
                }),
            _buildTextField(
                label: 'Phone Number', controller: _phoneNumberController),
            _buildTextField(
                label: 'Aadhaar Number', controller: _aadhaarNumberController),
            _buildDropdown(
                label: 'Astrology Type',
                items: ['Vedic', 'Numerology', 'Tarot Reader'],
                onChanged: (value) {
                  setState(() {
                    _selectedAstrologyType = value!;
                  });
                }),
            _buildDropdown(
                label: 'Expertise',
                items: ['Astrology', 'Vastu'],
                onChanged: (value) {
                  setState(() {
                    _selectedExpertise = value!;
                  });
                }),
            const SizedBox(height: 20),
            _buildSubmitButton(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildTextField(
      {required String label, TextEditingController? controller}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            border: InputBorder.none,
            isDense: true,
          ),
          keyboardType: label == 'Phone Number'
              ? TextInputType.phone
              : TextInputType.text,
        ),
      ),
    );
  }

  Widget _buildDropdown(
      {required String label,
      required List<String> items,
      required void Function(String?) onChanged}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(30),
        ),
        child: DropdownButtonFormField(
          value: label == 'Gender'
              ? _selectedGender
              : label == 'Astrology Type'
                  ? _selectedAstrologyType
                  : _selectedExpertise,
          decoration: InputDecoration(
            labelText: label,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            border: InputBorder.none,
            isDense: true,
          ),
          items: items.map((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Future<void> updateUserDetails() async {
    final apiUrl = Uri.parse(
        'https://astromagic-dtigcqgjva-em.a.run.app/api/user/updateProfile');

    final userData = {
      'fullName': _fullNameController.text,
      'email': _emailController.text,
      'gender': _selectedGender,
      'phoneNumber': _phoneNumberController.text,
      'aadhaarNumber': _aadhaarNumberController.text,
      'astrologyType': _selectedAstrologyType,
      'expertise': _selectedExpertise,
    };

    final response = await http.post(apiUrl, body: userData);

    if (response.statusCode == 200) {
      print('User data updated successfully');
      // You can navigate to a different screen or show a success message here
    } else {
      print('Failed to update user data');
      // Handle the error, show an error message, or retry the request
    }
  }

  Widget _buildSubmitButton() {
    return GestureDetector(
      onTap: () {
        updateUserDetails();
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFEE542A), Color(0xFFFE9E2D)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text(
          'Submit',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.phone),
          label: 'Contact',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera_alt),
          label: 'Camera',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.red[800],
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}


 

 */

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserDetailPage extends StatefulWidget {
  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  int _selectedIndex = 0;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _aadhaarNumberController =
      TextEditingController();

  String _selectedGender = 'Male';
  String _selectedAstrologyType = 'Vedic';
  String _selectedExpertise = 'Astrology';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Your Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildTextField(
                label: 'Full Name', controller: _fullNameController),
            _buildTextField(label: 'Email', controller: _emailController),
            _buildDropdown(
                label: 'Gender',
                items: ['Male', 'Female', 'Others'],
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value!;
                  });
                }),
            _buildTextField(
                label: 'Phone Number', controller: _phoneNumberController),
            _buildTextField(
                label: 'Aadhaar Number', controller: _aadhaarNumberController),
            _buildDropdown(
                label: 'Astrology Type',
                items: ['Vedic', 'Numerology', 'Tarot Reader'],
                onChanged: (value) {
                  setState(() {
                    _selectedAstrologyType = value!;
                  });
                }),
            _buildDropdown(
                label: 'Expertise',
                items: ['Astrology', 'Vastu'],
                onChanged: (value) {
                  setState(() {
                    _selectedExpertise = value!;
                  });
                }),
            const SizedBox(height: 20),
            _buildSubmitButton(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildTextField(
      {required String label, TextEditingController? controller}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            border: InputBorder.none,
            isDense: true,
          ),
          keyboardType: label == 'Phone Number'
              ? TextInputType.phone
              : TextInputType.text,
        ),
      ),
    );
  }

  Widget _buildDropdown(
      {required String label,
      required List<String> items,
      required void Function(String?) onChanged}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(30),
        ),
        child: DropdownButtonFormField(
          value: label == 'Gender'
              ? _selectedGender
              : label == 'Astrology Type'
                  ? _selectedAstrologyType
                  : _selectedExpertise,
          decoration: InputDecoration(
            labelText: label,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            border: InputBorder.none,
            isDense: true,
          ),
          items: items.map((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Future<void> updateUserDetails() async {
    final apiUrl = Uri.parse(
        'https://astromagic-dtigcqgjva-em.a.run.app/api/user/updateProfile');

    final userData = {
      'fullName': _fullNameController.text,
      'email': _emailController.text,
      'gender': _selectedGender,
      'phoneNumber': _phoneNumberController.text,
      'aadhaarNumber': _aadhaarNumberController.text,
      'astrologyType': _selectedAstrologyType,
      'expertise': _selectedExpertise,
    };

    final response = await http.post(apiUrl, body: userData);

    if (response.statusCode == 200) {
      print('User data updated successfully');
      _showSnackbar('Data updated successfully', true);
    } else {
      print('Failed to update user data');
      _showSnackbar('Failed to update data ${response}', false);
      print(response);
    }
  }

  void _showSnackbar(String message, bool isSuccess) {
    final scaffoldMessengerState = ScaffoldMessenger.of(context);
    if (scaffoldMessengerState != null) {
      scaffoldMessengerState.showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: isSuccess ? Colors.green : Colors.red,
        ),
      );
    }
  }

  Widget _buildSubmitButton() {
    return GestureDetector(
      onTap: () {
        updateUserDetails();
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFEE542A), Color(0xFFFE9E2D)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text(
          'Submit',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.phone),
          label: 'Contact',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera_alt),
          label: 'Camera',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.red[800],
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
