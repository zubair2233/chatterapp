import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whatsapp_messenger/common/extension/custom_theme_extension.dart';
import 'package:whatsapp_messenger/common/routes/routes.dart';

import '../../../common/widgets/custom_elevated_button.dart';
import '../widgets/language_button.dart';
import '../widgets/privacy_and_terms.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3), () {
      // navigateToLoginPage(context) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.signup,
        (route) => false,
      );
      // }
    });
    super.initState();
  }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   Timer(Duration(seconds: 3), () {
  //     Navigator.pushReplacementNamed(context, LoginInWithPhone.id);
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 800,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/splashIcon.png"),
              const SizedBox(
                height: 30,
              ),
              Image.asset("assets/images/Chatter.png"),
            ],
          ),
        ),
      ),
    );

    //  Scaffold(
    //   body: Column(
    //     children: [
    //       Expanded(
    //         child: Align(
    //           alignment: Alignment.bottomCenter,
    //           child: Padding(
    //             padding: const EdgeInsets.symmetric(
    //               horizontal: 50,
    //               vertical: 10,
    //             ),
    //             child: Image.asset(
    //               'assets/images/circle.png',
    //               color: context.theme.circleImageColor,
    //             ),
    //           ),
    //         ),
    //       ),
    //       const SizedBox(height: 40),
    //       Expanded(
    //           child: Column(
    //         children: [
    //           const Text(
    //             'Welcome to WhatsApp',
    //             style: TextStyle(
    //               fontSize: 22,
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //           const PrivacyAndTerms(),
    //           CustomElevatedButton(
    //             onPressed: () => navigateToLoginPage(context),
    //             text: 'AGREE AND CONTINUE',
    //           ),
    //           const SizedBox(height: 50),
    //           const LanguageButton(),
    //         ],
    //       ))
    //     ],
    //   ),
    // );
  }
}
