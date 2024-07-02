import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final OutlineInputBorder searchBarBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(
        color: Colors.black,
      ), // Set border color to transparent
    );

    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/menuicon.png'),
          onPressed: () {
            scaffoldKey.currentState
                ?.openDrawer(); // Use scaffoldKey to open the drawer
          },
        ),
        title: const Text('Astro Magic'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              size: 25,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/wallet.png',
              height: 25,
              width: 25,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              title: const Text('Item 1'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            // Search Bar for every screen.

            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: SizedBox(
                height: 40,
                child: TextField(
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Icon(Icons.search),
                    ),
                    label: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Search Astrologer...',
                          style: TextStyle(fontSize: 13),
                        ),
                        VerticalDivider(
                          width: 10,
                          thickness: 1,
                          indent: 8,
                          endIndent: 8,
                          color: Colors.black,
                        ),
                        Text(
                          'Problem In..',
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: searchBarBorder,
                    focusedBorder: searchBarBorder,
                    enabledBorder: searchBarBorder,
                    suffixIcon: const Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Icon(Icons.tune_rounded),
                    ),
                  ),
                ),
              ),
            ),

            // Content below Search Bar on every screen.
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: 30.0,
              ),
              child: body,
            ),
          ],
        ),
      ),
    );
  }
}
