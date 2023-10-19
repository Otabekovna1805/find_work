import 'package:find_work/constants/images.dart';
import 'package:find_work/constants/strings.dart';
import 'package:find_work/core/service_locator.dart';
import 'package:find_work/pages/sign_in.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../views/container.dart';
import '../views/textfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              children: [
                Container(child: Lottie.asset(Images.signUp)),
                CustomTextField(controller: emailController, title: Strings.userName),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(controller: passwordController, title: Strings.email),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(controller: emailController, title: Strings.password),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                    controller: passwordController, title: Strings.confirmPassword),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SignInPage()));
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: CustomContainer(
                      width: 320.w, text: Strings.signIn, height: 57.h),
                ),
                SizedBox(
                  height: 20.h,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                       TextSpan(
                          text: Strings.haveYouAccount,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                          ),
                       ),
                      TextSpan(
                        text: Strings.signUp,
                        style: const TextStyle(color: Colors.lightBlueAccent),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const SignInPage()));
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


