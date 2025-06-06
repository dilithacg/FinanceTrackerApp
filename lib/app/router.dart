import 'package:go_router/go_router.dart';
import '../bottom_nav_bar_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';


final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const BottomNavBarScreen(),
    ),
  ],
);
