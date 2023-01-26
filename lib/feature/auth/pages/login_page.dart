import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:whatsapp_messenger/common/extension/custom_theme_extension.dart';
import 'package:whatsapp_messenger/common/helper/show_alert_dialog.dart';
import 'package:whatsapp_messenger/common/widgets/custom_elevated_button.dart';
import 'package:whatsapp_messenger/feature/auth/controller/auth_controller.dart';
import 'package:whatsapp_messenger/feature/auth/widgets/custom_text_field.dart';

import '../../../common/utils/coloors.dart';
import '../../../common/widgets/custom_icon_button.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key, required this.phone, required this.password});

  final String phone;
  final String password;
  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late TextEditingController countryNameController;
  late TextEditingController countryCodeController;
  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;

  final formKey = GlobalKey<FormState>();
  // TextEditingController inputControllar = TextEditingController();
  // TextEditingController controller = TextEditingController();

  bool? _passwordVisible;
  sendCodeToPhone() {
    // final phoneNumber = phoneNumberController.text;
    final phoneNumber = "$cuntry" + phoneNumberController.text;

    final countryName = countryNameController.text;
    final countryCode = countryCodeController.text;
    final password = passwordController.text;

    if (phoneNumber.isEmpty) {
      return showAlertDialog(
        context: context,
        message: "Please enter your phone number",
      );
    } else if (phoneNumber.length < 9) {
      return showAlertDialog(
        context: context,
        message:
            'The phone number you entered is too short for the country: $countryName\n\nInclude your area code if you haven\'t',
      );
    } else if (phoneNumber.length > 30) {
      return showAlertDialog(
        context: context,
        message:
            "The phone number you entered is too long for the country: $countryName",
      );
    }

    // ref.read(authControllerProvider).sendSmsCode(
    //       context: context,
    //       phoneNumber: "+$countryCode $phoneNumber",
    //     );
    ref.read(authControllerProvider).sendSmsCode(
          context: context,
          phoneNumber: "+$phoneNumber",
        );
  }

  showCountryPickerBottomSheet() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      favorite: ['ET'],
      countryListTheme: CountryListThemeData(
        bottomSheetHeight: 600,
        backgroundColor: Theme.of(context).backgroundColor,
        flagSize: 22,
        borderRadius: BorderRadius.circular(20),
        textStyle: TextStyle(color: context.theme.greyColor),
        inputDecoration: InputDecoration(
          labelStyle: TextStyle(color: context.theme.greyColor),
          prefixIcon: const Icon(
            Icons.language,
            color: Coloors.greenDark,
          ),
          hintText: 'Search country by code or name',
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: context.theme.greyColor!.withOpacity(.2),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Coloors.greenDark,
            ),
          ),
        ),
      ),
      onSelect: (country) {
        countryCodeController.text = country.countryCode;
        countryCodeController.text = country.phoneCode;
      },
    );
  }

  @override
  void initState() {
    passwordController = TextEditingController();
    countryNameController = TextEditingController();

    countryCodeController = TextEditingController();
    phoneNumberController = TextEditingController();
    _passwordVisible = false;
    super.initState();
  }

  @override
  void dispose() {
    countryNameController.dispose();
    countryCodeController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  String cuntry = " ";
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    //     elevation: 0,
    //     title: Text(
    //       'Enter your phone number',
    //       style: TextStyle(
    //         color: context.theme.authAppbarTextColor,
    //       ),
    //     ),
    //     centerTitle: true,
    //     actions: [
    //       CustomIconButton(
    //         onPressed: () {},
    //         icon: Icons.more_vert,
    //       ),
    //     ],
    //   ),
    //   body: Column(
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    //         child: RichText(
    //           textAlign: TextAlign.center,
    //           text: TextSpan(
    //             text: 'WhatsApp will need to verify your number. ',
    //             style: TextStyle(
    //               color: context.theme.greyColor,
    //               height: 1.5,
    //             ),
    //             children: [
    //               TextSpan(
    //                 text: "What's my number?",
    //                 style: TextStyle(
    //                   color: context.theme.blueColor,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //       const SizedBox(height: 10),
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 50),
    //         child: CustomTextField(
    //           onTap: showCountryPickerBottomSheet,
    //           controller: countryNameController,
    //           readOnly: true,
    //           suffixIcon: const Icon(
    //             Icons.arrow_drop_down,
    //             color: Coloors.greenDark,
    //             size: 22,
    //           ),
    //         ),
    //       ),
    //       const SizedBox(height: 10),
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 50),
    //         child: Row(
    //           children: [
    //             SizedBox(
    //               width: 70,
    //               child: CustomTextField(
    //                 onTap: showCountryPickerBottomSheet,
    //                 controller: countryCodeController,
    //                 prefixText: '+',
    //                 readOnly: true,
    //               ),
    //             ),
    //             const SizedBox(width: 10),
    //             Expanded(
    //               child: CustomTextField(
    //                 controller: phoneNumberController,
    //                 hintText: 'phone number',
    //                 textAlign: TextAlign.left,
    //                 keyboardType: TextInputType.number,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       const SizedBox(height: 20),
    //       Text(
    //         'Carrier charges may apply',
    //         style: TextStyle(
    //           color: context.theme.greyColor,
    //         ),
    //       ),
    //     ],
    //   ),
    //   floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    //   floatingActionButton: CustomElevatedButton(
    //     onPressed: sendCodeToPhone,
    //     text: 'NEXT',
    //     buttonWidth: 90,
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
              SizedBox(
                height: 120,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 63,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Let's Login Now",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text("Welcome Back.You'been missed"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: IntlPhoneField(
                        validator: (v) {
                          if (v == null) {
                            return "Enter Some Text";
                          }
                          return null;
                        },
                        controller: phoneNumberController,
                        // controller: countryCodeController,

                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.only(left: 35, top: 24, bottom: 15),
                          labelText: 'Phone number',
                          suffixIcon: Icon(
                            Icons.phone_android,
                            color: Colors.black26,
                          ),
                          labelStyle: TextStyle(
                              color: Color(0xffAAAAAA),
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffFF7A1D)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              )),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                        ),
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                        onCountryChanged: (country) {
                          cuntry = country.dialCode;
                          print('Country changed to: ' + country.dialCode);
                          // print('Country changed to: ' + country.);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return "Enter Some Text";
                              }
                              return null;
                            },
                            controller: passwordController,
                            onChanged: ((value) {}),
                            obscureText: !_passwordVisible!,
                            obscuringCharacter: "*",
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff5E5E5E)),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffFF7A1D)),
                                  borderRadius: BorderRadius.circular(15)),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                              ),
                              // labelText: 'Password',
                              prefixIcon: Image.asset("assets/images/pwd.png"),
                              hintText: 'Enter Password',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible!
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black26,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible!;
                                  });
                                },
                              ),
                              hintStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                              contentPadding: const EdgeInsets.only(
                                  left: 35, top: 24, bottom: 15),
                              labelStyle: const TextStyle(
                                  color: Color(0xffAAAAAA),
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500),
                            ))),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                "forgot Password?",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff797979),
                                ),
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: sendCodeToPhone,
                      // () {
                      //   // if (inputControllar.text != null) {
                      //   //   final phone = '+92' + inputControllar.text;
                      //   //   AuthProvider().loginwithphone(context, phone);
                      //   // }
                      //   setState(() {
                      //     // Navigator.pushNamed(context, LoginInWithPhone.id);
                      //   });
                      // },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          height: 53,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Color(0xff8ACDCB),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          child: const Center(
                            child: Text(
                              'Login ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "Don't have an account?-",
                    style: TextStyle(
                      color: Color(0xff323232),
                      fontSize: 18,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          // Navigator.pushNamed(context, SignUpInWithPhone.id);
                        });
                      },
                      child: const Text(
                        "Signup",
                        style: TextStyle(
                          color: Color(0xff323232),
                          fontSize: 18,
                        ),
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 62),
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
