import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _user;

  User? get user => _user;

  Future<void> login(String email, String password) async {
    _user = await _authService.loginWithEmail(email, password);
    notifyListeners();
  }

  Future<void> register(String email, String password) async {
    _user = await _authService.registerWithEmail(email, password);
    notifyListeners();
  }

  Future<void> logout() async {
    await _authService.signOut();
    _user = null;
    notifyListeners();
  }

  void setUser(User? user) {
    _user = user;
    notifyListeners();
  }
}
