import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:whatsapp_messenger/common/routes/routes.dart';
import 'package:whatsapp_messenger/common/theme/dark_theme.dart';
import 'package:whatsapp_messenger/common/theme/light_theme.dart';
import 'package:whatsapp_messenger/feature/auth/controller/auth_controller.dart';
import 'package:whatsapp_messenger/feature/home/pages/chat_home_page.dart';
// import 'package:whatsapp_messenger/feature/home/pages/call_home_page.dart';
// import 'package:whatsapp_messenger/feature/home/pages/chat_home_page.dart';
import 'package:whatsapp_messenger/feature/home/pages/home_page.dart';
// import 'package:whatsapp_messenger/feature/home/pages/status_home_page.dart';
import 'package:whatsapp_messenger/feature/welcome/pages/welcome_page.dart';
import 'package:whatsapp_messenger/firebase_options.dart';

import 'feature/auth/pages/SignUpScreen.dart';
import 'feature/home/pages/call_home_page.dart';
import 'feature/home/pages/status_home_page.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        builder: (context, child) => ResponsiveWrapper.builder(child,
            maxWidth: 1200,
            minWidth: 360,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(360, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            ],
            background: Container(color: const Color(0xFFF5F5F5))),
        debugShowCheckedModeBanner: false,
        title: 'WhatsApp Me',
        theme: lightTheme(),
        darkTheme: darkTheme(),
        home: ref.watch(userInfoAuthProvider).when(
              data: (user) {
                FlutterNativeSplash.remove();
                if (user == null) return const WelcomePage();
                return const HomePage();
              },
              error: (error, trace) {
                return const Scaffold(
                  body: Center(
                    child: Text('Something wrong happened'),
                  ),
                );
              },
              loading: () => const SizedBox(),
            ),
        onGenerateRoute: Routes.onGenerateRoute,
        routes: {
          ChatHomePage.id: (context) => const ChatHomePage(),
          // ignore: equal_keys_in_map
          StatusHomePage.id: (context) => const StatusHomePage(),
          // ignore: equal_keys_in_map
          CallHomePage.id: (context) => const CallHomePage(),
        });
  }
}
