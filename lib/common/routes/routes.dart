import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:whatsapp_messenger/common/models/user_model.dart';
import 'package:whatsapp_messenger/feature/auth/pages/SignUpScreen.dart';
import 'package:whatsapp_messenger/feature/auth/pages/login_page.dart';
import 'package:whatsapp_messenger/feature/auth/pages/user_info_page.dart';
import 'package:whatsapp_messenger/feature/auth/pages/verification_page.dart';
import 'package:whatsapp_messenger/feature/chat/pages/chat_page.dart';
import 'package:whatsapp_messenger/feature/chat/pages/profile_page.dart';
import 'package:whatsapp_messenger/feature/contact/pages/contact_page.dart';
import 'package:whatsapp_messenger/feature/home/pages/chat_home_page.dart';
import 'package:whatsapp_messenger/feature/home/pages/home_page.dart';
import 'package:whatsapp_messenger/feature/welcome/pages/welcome_page.dart';

class Routes {
  static const String welcome = 'welcome';
  static const String signup = 'signup';
  static const String login = 'login';
  static const String verification = 'verification';
  static const String userInfo = 'user-info';
  static const String chatpage = 'chatpage';
  static const String contact = 'contact';
  static const String chat = 'chat';
  static const String profile = 'profile';
  // final String phone;
  // final String password;
  // Routes({required this.password, required this.phone});

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return MaterialPageRoute(
          builder: (context) => const WelcomePage(),
        );
      case signup:
        return MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        );
      case login:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(
            phone: "",
            password: "",
          ),
        );
      case verification:
        final Map args = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (context) => VerificationPage(
            smsCodeId: args['smsCodeId'],
            phoneNumber: args['phoneNumber'],
          ),
        );
      case userInfo:
        final String? profileImageUrl = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (context) => UserInfoPage(
            profileImageUrl: profileImageUrl,
          ),
        );
      case chatpage:
        return MaterialPageRoute(
          builder: (context) => const ChatHomePage(),
        );
      case contact:
        return MaterialPageRoute(
          builder: (context) => const ContactPage(),
        );
      case chat:
        final UserModel user = settings.arguments as UserModel;
        return MaterialPageRoute(
          builder: (context) => ChatPage(user: user),
        );
      case profile:
        final UserModel user = settings.arguments as UserModel;
        return PageTransition(
          child: ProfilePage(user: user),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 800),
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text('No Page Route Provided'),
              ),
            );
          },
        );
    }
  }
}
