import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

import '../../const/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String email;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  void _loadUser() {
    final user = _auth.currentUser;
    if (user != null) {
      setState(() {
        email = user.email ?? 'No email';
        isLoading = false;
      });
    }
  }

  Future<void> _logout() async {
    await _auth.signOut();
    context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primaryLight,
                AppColors.primaryDark,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: const NetworkImage(
                    'https://cdn.pixabay.com/photo/2019/08/11/18/59/icon-4399701_1280.png',
                  ),
                  backgroundColor: isDark ? Colors.grey[800] : Colors.grey[300],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                email,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onBackground.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 15),

              // Social Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.facebook, size: 30, color: Colors.blue.shade400),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 15),
                  IconButton(
                    icon: Icon(Icons.camera_alt, size: 30, color: Colors.pink.shade400),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 15),
                  IconButton(
                    icon: Icon(Icons.link, size: 30, color: Colors.blueAccent.shade400),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 15),
                  IconButton(
                    icon: Icon(Icons.email, size: 30, color: Colors.red.shade400),
                    onPressed: () {},
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // About Us Section
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: isDark ? Colors.black54 : Colors.blue.shade50,
                      blurRadius: 10,
                      spreadRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: isDark
                        ? [Colors.grey[900]!, Colors.grey[850]!]
                        : [Colors.blue.shade50, Colors.white],
                  ),
                  border: Border.all(
                    color: isDark ? Colors.grey[700]! : Colors.blue.shade100,
                    width: 1.5,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      'About Finance Tracker',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.lightBlue[200] : Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      height: 2,
                      width: 40,
                      color: isDark ? Colors.lightBlue[300] : Colors.blue.shade200,
                      margin: const EdgeInsets.only(bottom: 12),
                    ),
                    Text(
                      'Finance Tracker is a simple yet powerful app to manage your daily income and expenses. With intuitive features, you can easily add transactions, set monthly budgets, and view detailed reports to understand your spending patterns.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        height: 1.4,
                        color: isDark ? Colors.grey[300] : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Our goal is to help you stay organized and in control of your finances, all through an elegant and easy-to-use interface.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontStyle: FontStyle.italic,
                        height: 1.4,
                        color: isDark ? Colors.grey[400] : Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // Logout Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _logout,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF1111),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.exit_to_app,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
