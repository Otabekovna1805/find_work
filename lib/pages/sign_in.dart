import 'package:find_work/constants/images.dart';
import 'package:find_work/constants/strings.dart';
import 'package:find_work/pages/sign_up.dart';
import 'package:find_work/pages/vacancy_or_resume.dart';
import 'package:find_work/views/container.dart';
import 'package:find_work/views/textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [
              Lottie.asset(Images.lottieSignIn),
              CustomTextField(controller: emailController, title: Strings.email),
              SizedBox(
                height: 20.h,
              ),
              CustomTextField(
                  controller: passwordController, title: Strings.password),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const VacancyOrResume()));
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
                    const TextSpan(
                        text: Strings.dontHaveAnAccount,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text: Strings.signUp,
                      style: const TextStyle(color: Colors.lightBlueAccent),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const SignUpPage()));
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
