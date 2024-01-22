import 'package:flutter/material.dart';

class AstroDashboard extends StatefulWidget {
  @override
  State<AstroDashboard> createState() => _AstroDashboardState();
}

class _AstroDashboardState extends State<AstroDashboard> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFFEE542A), Color(0xFFFE9E2D)],
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Handle menu button action
          },
        ),
        title: Text('Astro Magic'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications button action
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            _buildFreeConsultationCard(),
            const SizedBox(height: 20),
            _buildGradientButton(
              'Chat',
              const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Color(0xFFFE9E2D), Color(0xFFFFDE59)],
              ),
              Icons.message, // Replace with your leading icon
              Icons.notifications, // Replace with your trailing icon
              3, // The badge number for the trailing icon
            ),
            const SizedBox(height: 10),
            _buildGradientButton(
              'Call',
              const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Color(0xFFFE9E2D), Color(0xFFEE542A)],
              ),
              Icons.call, // Replace with your leading icon
              Icons.notifications, // Replace with your trailing icon
              1, // The badge number for the trailing icon
            ),
            const SizedBox(height: 10),
            _buildGradientButton(
              'Go Live Now',
              const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Color(0xFFFE9E2D), Color(0xFFFFDE59)],
              ),
              'assets/live_icon.png', // Replace with your leading icon
              Icons.chevron_right, // Replace with your trailing icon
              0, // The badge number for the trailing icon
            ),
            const SizedBox(height: 20),
            _buildStatusIndicator(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildFreeConsultationCard() {
    return Container(
      decoration: const BoxDecoration(
        // Apply a border radius to all corners
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      clipBehavior: Clip.antiAlias, // This line is important!
      child: Image.asset('assets/free_call_banner.png'),
    );
  }

  Widget _buildGradientButton(String text, LinearGradient gradient,
      dynamic leadingIcon, IconData trailingIcon, int trailingIconBadge) {
    Widget leadingWidget;

    if (leadingIcon is IconData) {
      leadingWidget = Icon(
        leadingIcon,
        color: Colors.black,
      ); // Use Icon if leadingIcon is IconData
    } else if (leadingIcon is String) {
      leadingWidget = Image.asset(
        leadingIcon,
        height: 28,
      ); // Use Image.asset if leadingIcon is String (for PNG)
    } else {
      leadingWidget =
          Container(); // Default empty container if leadingIcon is neither IconData nor String
    }

    return Container(
      width: double.infinity,
      height: 48, // Specify the height for the button
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: gradient,
      ),
      child: ElevatedButton(
        onPressed: () {
          // print("Elevated button clicked");
          Navigator.of(context).pushNamed('/chatRequest');
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          onSurface: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          padding: EdgeInsets.zero, // Set padding to zero for custom alignment
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 16), // Adjust padding as needed
                child: leadingWidget, // Use the conditionally chosen widget
              ),
            ),
            Text(text), // Text in the middle
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 16), // Adjust padding as needed
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Icon(
                      trailingIcon,
                      color: Colors.black,
                    ), // Trailing icon
                    if (trailingIconBadge > 0) // Badge for the trailing icon
                      Positioned(
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 12,
                            minHeight: 12,
                          ),
                          child: Text(
                            '$trailingIconBadge',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusIndicator() {
    // Define the spacing between the columns
    double columnSpacing = 16.0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          // Header Row
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Type',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: columnSpacing),
              const Expanded(
                child: Text(
                  'Status',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: columnSpacing),
              const Expanded(
                flex:
                    3, // Increase the flex value for the "Next Available Time" column
                child: Text(
                  'Next Available Time',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const Divider(
            height: 20,
            thickness: 1,
          ), // Optional divider for visual separation
          // First Data Row
          Row(
            children: [
              const Expanded(
                child: Text('Chat', textAlign: TextAlign.center),
              ),
              SizedBox(width: columnSpacing),
              Expanded(
                child: SliderButtonWidget(
                  isOn: true, // Change this value to true or false
                  onChanged: (value) {
                    // Handle the state change here
                    // value is true for ON and false for OFF
                  },
                ),
              ),
              SizedBox(width: columnSpacing),
              Expanded(
                flex:
                    3, // Increase the flex value for the "Next Available Time" column
                child: _buildTimeBox('19 Dec, 23 | 7:00 PM'),
              ),
            ],
          ),
          // Second Data Row
          Row(
            children: [
              const Expanded(
                child: Text('Call', textAlign: TextAlign.center),
              ),
              SizedBox(width: columnSpacing),
              Expanded(
                child: SliderButtonWidget(
                  isOn: false, // Change this value to true or false
                  onChanged: (value) {
                    // Handle the state change here
                    // value is true for ON and false for OFF
                  },
                ),
              ),
              SizedBox(width: columnSpacing),
              Expanded(
                flex:
                    3, // Increase the flex value for the "Next Available Time" column
                child: _buildTimeBox('N/A'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimeBox(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(text, textAlign: TextAlign.center),
    );
  }

  Widget _buildStatusColumn(String type, bool isOn, String time) {
    return Column(
      children: <Widget>[
        Text(type),
        Switch(
          value: isOn,
          onChanged: (bool value) {},
          activeColor: Colors.green,
        ),
        Text(time),
      ],
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

class SliderButtonWidget extends StatefulWidget {
  final bool isOn;
  final Function(bool) onChanged;

  SliderButtonWidget({required this.isOn, required this.onChanged});

  @override
  _SliderButtonWidgetState createState() => _SliderButtonWidgetState();
}

class _SliderButtonWidgetState extends State<SliderButtonWidget> {
  late bool isOn;

  @override
  void initState() {
    super.initState();
    isOn = widget.isOn;
  }

  @override
  Widget build(BuildContext context) {
    // Define the smaller dimensions for the button
    double buttonWidth = 40;
    double buttonHeight = 20;

    return GestureDetector(
      onTap: () {
        setState(() {
          isOn = !isOn;
        });
        widget.onChanged(isOn);
      },
      child: SizedBox(
        width: buttonWidth,
        height: buttonHeight,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: isOn ? Colors.green : Colors.red[300],
          ),
          alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              if (!isOn)
                const Padding(
                  padding: EdgeInsets.only(left: 4.0),
                  child: Text(
                    'OFF',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              if (isOn)
                const Padding(
                  padding: EdgeInsets.only(right: 4.0),
                  child: Text(
                    'ON',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
