import 'package:finance_tracker_app/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:finance_tracker_app/screens/home/dashboard_screen.dart';
import 'package:finance_tracker_app/screens/home/profile_screen.dart';
import 'package:finance_tracker_app/screens/home/transaction_history_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _selectedIndex = 1; // Default to Dashboard

  static final List<Widget> _widgetOptions = <Widget>[
    TransactionHistoryScreen(),
    DashboardScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: AppColors.primaryDark,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 10,
            selectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            items: [
              BottomNavigationBarItem(
                icon: _buildIcon(Icons.history, false),
                activeIcon: _buildIcon(Icons.history, true),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(Icons.dashboard_outlined, false),
                activeIcon: _buildIcon(Icons.dashboard, true),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(Icons.person_outline, false),
                activeIcon: _buildIcon(Icons.person, true),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon, bool isActive) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: isActive
          ? BoxDecoration(
        color: Colors.green.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      )
          : null,
      child: Icon(
        icon,
        size: 26,
        color: isActive ? AppColors.primaryLight : null,
      ),
    );
  }
}
