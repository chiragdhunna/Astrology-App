import 'package:flutter/material.dart';

class CallHistory extends StatefulWidget {
  const CallHistory({super.key});

  @override
  _CallHistoryState createState() => _CallHistoryState();
}

class _CallHistoryState extends State<CallHistory> {
  final List<Map<String, dynamic>> orders = List.generate(
      7,
      (index) => {
            'orderID': '${index + 1}',
            'name': 'Ram',
            'gender': 'Male',
            'dob': '12/11/96',
            'pob': 'Gurgaon',
            'orderTime': '11:12 AM',
            'duration': '5 Mins',
            'rate': '10₹/Min',
            'status': 'Completed',
            'totalAmount': '50₹',
          });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Call History'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.white,
            elevation: 4.0,
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            gradient: const LinearGradient(
                              colors: [Color(0xFFEE542A), Color(0xFFFE9E2D)],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/esoteric.png', // Replace with your asset image path
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 16.0,
                            right:
                                48.0), // Adjust padding to ensure no overflow
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Order ID: ${orders[index]['orderID']}'),
                            Text('Name: ${orders[index]['name']}'),
                            Text('Gender: ${orders[index]['gender']}'),
                            Text('DOB: ${orders[index]['dob']}'),
                            Text('POB: ${orders[index]['pob']}'),
                            Text('Order Time: ${orders[index]['orderTime']}'),
                            Text('Duration: ${orders[index]['duration']}'),
                            Text('Rate: ${orders[index]['rate']}'),
                            Text('Status: ${orders[index]['status']}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                      height: 20), // Space between text and the total amount
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Total Amount: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.black, // Color for "Total Amount"
                          ),
                        ),
                        Text(
                          '50₹',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.green, // Color for the amount
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
