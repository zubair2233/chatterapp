// import 'package:chatter_app/screens/VerificationScreen.dart';
// import 'package:chatter_app/screens/loginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:whatsapp_messenger/feature/auth/pages/login_page.dart';

import '../../../common/routes/routes.dart';

class SignUpScreen extends StatefulWidget {
  static const id = '/SignUpScreen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formkey = GlobalKey<FormState>();

  TextEditingController NameControllar = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  TextEditingController password1controller = TextEditingController();
  TextEditingController password2controller = TextEditingController();

  @override
  void initState() {
    _passwordVisible = false;
  }

  // String? phoneNumber, verificationId;
  // String? otp, authStatus = "";
  // Future<void> verifyPhoneNumber(BuildContext context) async {
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //     phoneNumber: phoneNumber,
  //     timeout: const Duration(seconds: 15),
  //     verificationCompleted: (AuthCredential authCredential) {
  //       setState(() {
  //         authStatus = "Your account is successfully verified";
  //       });
  //     },
  //     verificationFailed: (FirebaseAuthException authException) {
  //       setState(() {
  //         authStatus = "Authentication failed";
  //       });
  //     },
  //     codeSent: (String verId, [int? forceCodeResent]) {
  //       verificationId = verId;
  //       setState(() {
  //         authStatus = "OTP has been successfully send";
  //       });
  //       // otpDialogBox(context).then((value) {});
  //     },
  //     codeAutoRetrievalTimeout: (String verId) {
  //       verificationId = verId;
  //       setState(() {
  //         authStatus = "TIMEOUT";
  //       });
  //     },
  //   );
  // }

  // signwithphone
  // Future<void> signIn(String otp) async {
  // await FirebaseAuth.instance
  //     .signInWithCredential(PhoneAuthProvider.getCredential(
  //   verificationId: verificationId,
  //   smsCode: otp,
  // ));
// }

  bool? _passwordVisible;
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: 800,
            width: double.infinity,
            color: const Color.fromARGB(255, 247, 246, 246),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 62),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset("assets/images/halfCircle.png"),
                      ],
                    ),
                  ),
                ),
                Column(children: [
                  const SizedBox(
                    height: 120,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 63,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  "Register  ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
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
                    height: 20,
                  ),
                  Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                                controller: NameControllar,
                                validator: (v) {
                                  if (v == null || v.isEmpty || v.length <= 5) {
                                    return "Enter Some Text";
                                  }
                                  return null;
                                },
                                // obscureText: !_passwordVisible!,
                                // obscuringCharacter: "*",
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff5E5E5E)),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xffFF7A1D)),
                                      borderRadius: BorderRadius.circular(15)),
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15.0),
                                    ),
                                  ),
                                  // labelText: 'Password',
                                  prefixIcon:
                                      Image.asset("assets/images/use.png"),
                                  hintText: 'User Name',
                                  // suffixIcon: IconButton(
                                  //   icon: Icon(
                                  //     _passwordVisible!
                                  //         ? Icons.visibility
                                  //         : Icons.visibility_off,
                                  //     color: Colors.black26,
                                  //   ),
                                  //   onPressed: () {
                                  //     setState(() {
                                  //       _passwordVisible = !_passwordVisible!;
                                  //     });
                                  //   },
                                  // ),
                                  hintStyle: const TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff797979),
                                      fontWeight: FontWeight.w400),
                                  contentPadding: const EdgeInsets.only(
                                      left: 35, top: 24, bottom: 15),
                                  // labelStyle: const TextStyle(
                                  //     color: Color(0xffAAAAAA),
                                  //     fontSize: 19,
                                  //     fontWeight: FontWeight.w500),
                                ))),
                        const SizedBox(
                          height: 17,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: IntlPhoneField(
                            controller: phonecontroller,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  left: 35, top: 24, bottom: 15),
                              labelText: 'Phone number',
                              suffixIcon: Icon(
                                Icons.phone_android,
                                color: Colors.black26,
                              ),
                              labelStyle: TextStyle(
                                  color: Color(0xff797979),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffFF7A1D)),
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
                              print('Country changed to: ' + country.name);
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                                controller: password1controller,
                                obscureText: !_passwordVisible!,
                                validator: (v) {
                                  if (v == null ||
                                      v.isEmpty ||
                                      // ignore: unrelated_type_equality_checks
                                      v != password2controller.text) {
                                    return "Enter Some Text";
                                  }
                                  return null;
                                },
                                obscuringCharacter: "*",
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff5E5E5E)),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xffFF7A1D)),
                                      borderRadius: BorderRadius.circular(15)),
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15.0),
                                    ),
                                  ),
                                  // labelText: 'Password',
                                  prefixIcon:
                                      Image.asset("assets/images/pwd.png"),
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
                                      fontSize: 15,
                                      color: Color(0xff797979),
                                      fontWeight: FontWeight.w400),
                                  contentPadding: const EdgeInsets.only(
                                      left: 35, top: 24, bottom: 15),
                                  labelStyle: const TextStyle(
                                      color: Color(0xff797979),
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500),
                                ))),
                        const SizedBox(
                          height: 17,
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                                controller: password2controller,
                                obscureText: !_passwordVisible!,
                                validator: (v) {
                                  if (v == null ||
                                      v.isEmpty ||
                                      // ignore: unrelated_type_equality_checks
                                      v != password1controller.text) {
                                    return "Enter Some Text";
                                  }
                                  return null;
                                },
                                obscuringCharacter: "*",
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff5E5E5E)),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xffFF7A1D)),
                                      borderRadius: BorderRadius.circular(15)),
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15.0),
                                    ),
                                  ),
                                  // labelText: 'Password',
                                  prefixIcon:
                                      Image.asset("assets/images/pwd.png"),
                                  hintText: 'Confirm Password',
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
                                      fontSize: 15,
                                      color: Color(0xff797979),
                                      fontWeight: FontWeight.w400),
                                  contentPadding: const EdgeInsets.only(
                                      left: 35, top: 24, bottom: 15),
                                  labelStyle: const TextStyle(
                                      color: Color(0xff797979),
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500),
                                ))),
                        const SizedBox(
                          height: 17,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            height: 53,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                color: Color(0xff8ACDCB),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0))),
                            child: Center(
                              child: TextButton(
                                onPressed: (() {
                                  if (formkey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                        'Success',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      )),
                                    );
                                    setState(() {
                                      // Navigator.pushNamedAndRemoveUntil(
                                      //   context,
                                      //   Routes.login,
                                      //   (route) => false,
                                      // );
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => LoginPage(
                                                phone: phonecontroller.text,
                                                password:
                                                    password1controller.text),
                                          ));
                                    });
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                        'Please Enter Correct Details',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    );
                                  }
                                }),
                                child: const Text(
                                  'Sign Up ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "...................",
                        style: TextStyle(
                            letterSpacing: 2,
                            fontSize: 20,
                            color: Color(0xffAEB2B8)),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      // ignore: prefer_const_constructors
                      Padding(
                        padding: EdgeInsets.only(top: 9),
                        child: Text(
                          "OR",
                          style: TextStyle(color: Color(0xff566B88)),
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        "...................",
                        style: TextStyle(
                            letterSpacing: 2,
                            fontSize: 20,
                            color: Color(0xffAEB2B8)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "Already have an account? -",
                        style: TextStyle(
                          color: Color(0xff323232),
                          fontSize: 18,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                Routes.login,
                                (route) => false,
                              );
                            });
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Color(0xff323232),
                              fontSize: 18,
                            ),
                          ))
                    ],
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
