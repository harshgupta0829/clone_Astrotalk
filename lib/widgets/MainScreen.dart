import 'package:flutter/material.dart';
import 'package:new_astroltalk_ui/utils/CustomAppBar.dart';
import 'package:new_astroltalk_ui/utils/CustomBottomNavBar.dart';
import 'package:new_astroltalk_ui/utils/CustomDrawer.dart';
import 'package:new_astroltalk_ui/widgets/ChatCallPage.dart';
import 'package:new_astroltalk_ui/widgets/HomePage.dart';
import 'package:new_astroltalk_ui/widgets/Remedies/RemediesPage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const ChatCallPage(type: 'chat'), // Default to chat for demonstration
    const Center(
      child: Text('Live Page Content', style: TextStyle(fontSize: 24)),
    ),
    const ChatCallPage(type: 'call'), // Default to call for demonstration
    const RemediesPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0), // Adjust height as needed
        child: CustomAppBar(
          onMenuPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      drawer: CustomDrawer(),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
