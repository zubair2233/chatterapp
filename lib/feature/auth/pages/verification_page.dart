import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_messenger/common/extension/custom_theme_extension.dart';
import 'package:whatsapp_messenger/common/widgets/custom_icon_button.dart';
import 'package:whatsapp_messenger/feature/auth/controller/auth_controller.dart';
import 'package:whatsapp_messenger/feature/auth/widgets/custom_text_field.dart';

class VerificationPage extends ConsumerWidget {
  GlobalKey formkey = GlobalKey<FormState>();

  VerificationPage({
    super.key,
    required this.smsCodeId,
    required this.phoneNumber,
  });

  final String smsCodeId;
  final String phoneNumber;
  String val = "";

  void verifySmsCode(
    BuildContext context,
    WidgetRef ref,
    String smsCode,
  ) {
    ref.read(authControllerProvider).verifySmsCode(
          context: context,
          smsCodeId: smsCodeId,
          smsCode: smsCode,
          mounted: true,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    //     elevation: 0,
    //     centerTitle: true,
    //     title: Text(
    //       'Verify your number',
    //       style: TextStyle(
    //         color: context.theme.authAppbarTextColor,
    //       ),
    //     ),
    //     actions: [
    //       CustomIconButton(
    //         onPressed: () {},
    //         icon: Icons.more_vert,
    //         iconColor: Colors.green,
    //       ),
    //     ],
    //   ),
    //   body: SingleChildScrollView(
    //     padding: const EdgeInsets.symmetric(horizontal: 20),
    //     child: Column(
    //       children: [
    //         Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 10),
    //           child: RichText(
    //             textAlign: TextAlign.center,
    //             text: TextSpan(
    //               style: TextStyle(color: context.theme.greyColor),
    //               children: [
    //                 const TextSpan(
    //                   text:
    //                       "You've tried to register phoneNumber. before requesting an SMS or Call with your code.",
    //                 ),
    //                 TextSpan(
    //                   text: "Wrong number?",
    //                   style: TextStyle(
    //                     color: context.theme.blueColor,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //         const SizedBox(height: 20),
    //         Container(
    //           padding: const EdgeInsets.symmetric(horizontal: 80),
    //           child: CustomTextField(
    //             hintText: "- - -  - - -",
    //             fontSize: 30,
    //             autoFocus: true,
    //             keyboardType: TextInputType.number,
    //             onChanged: (value) {
    //               if (value.length == 6) {
    //                 return verifySmsCode(context, ref, value);
    //               }
    //             },
    //           ),
    //         ),
    //         const SizedBox(height: 20),
    //         Text(
    //           'Enter 6-digit code',
    //           style: TextStyle(color: context.theme.greyColor),
    //         ),
    //         const SizedBox(height: 30),
    //         Row(
    //           children: [
    //             Icon(Icons.message, color: context.theme.greyColor),
    //             const SizedBox(width: 20),
    //             Text(
    //               'Resend SMS',
    //               style: TextStyle(
    //                 color: context.theme.greyColor,
    //               ),
    //             ),
    //           ],
    //         ),
    //         const SizedBox(height: 10),
    //         Divider(
    //           color: context.theme.greyColor!.withOpacity(.2),
    //         ),
    //         const SizedBox(height: 10),
    //         Row(
    //           children: [
    //             Icon(Icons.phone, color: context.theme.greyColor),
    //             const SizedBox(width: 20),
    //             Text(
    //               'Call Me',
    //               style: TextStyle(
    //                 color: context.theme.greyColor,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: 800,
            width: double.infinity,
            color: Color.fromARGB(255, 247, 246, 246),
            child: Column(children: [
              const SizedBox(
                height: 90,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 70,
                  child: Column(
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            "Verify Code",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                "Check your sms inbox,we have sent you the",
                                style: TextStyle(color: Color(0xff566B88)),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "code at $phoneNumber",
                                style:
                                    const TextStyle(color: Color(0xff566B88)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 120,
              ),
              Form(
                key: formkey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: OtpTextField(
                        //   validator: (v) {
                        //   if (v == null || v.isEmpty) {
                        //     return "Enter Some Text";
                        //   }
                        //   return null;
                        // },
                        fieldWidth: 46,

                        // margin: EdgeInsets.only(left: 15),
                        numberOfFields: 6,
                        borderColor: Color(0xFF000000),
                        //set to true to show as box or false to show as dash
                        showFieldAsBox: true,
                        autoFocus: true,
                        fillColor: Color.fromARGB(255, 255, 253, 253),
                        //runs when a code is typed in

                        // onCodeChanged: (value) {
                        //   // ignore: unused_local_variable
                        //   // val = value;
                        //   if (value.length == 6) {
                        //     return verifySmsCode(context, ref, value);
                        //   }
                        //   print(val);
                        // },
                        //runs when every textfield is filled
                        onSubmit: (String verificationCode) {
                          return verifySmsCode(context, ref, verificationCode);
                        },
                        // onSubmit: (String verificationCode) {
                        //   showDialog(
                        //       context: context,
                        //       builder: (context) {
                        //         return AlertDialog(
                        //           title: Text("Verification Code"),
                        //           content:
                        //               Text('Code entered is $verificationCode'),
                        //         );
                        //       });
                        // }, // end onSubmit
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        height: 53,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Color(0xff8ACDCB),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              // (val) {
                              //   if (val.length == 6) {
                              //     return verifySmsCode(context, ref, val);
                              //   }
                              // };
                            },
                            child: const Text(
                              'Verify ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 108,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 42),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset("assets/images/halfCircle.png"),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
