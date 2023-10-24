

import 'package:find_work/constants/images.dart';
import 'package:find_work/constants/strings.dart';
import 'package:find_work/core/service_locator.dart';
import 'package:find_work/pages/sign_in.dart';
import 'package:find_work/service/registration_network_service.dart';
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
  final lastnameController = TextEditingController();
  final firstnameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  bool _visible = true;

  Future<void> createUser() async {
    final Map<String,Object?> data ={
      "email" : emailController.text.trim().toString(),
      "password" : passwordController.text.trim().toString(),
      "first_name" : firstnameController.text.trim().toString(),
      "last_name" : lastnameController.text.trim().toString(),
      "phone_number" : phoneNumberController.text.trim().toString(),
    };
   final response = await RegistrationNetworkService.signUpPost(api: RegistrationNetworkService.apiUserSignUp, data: data);
    if(response) {
      if(passwordController.text.trim().toString() == confirmController.text.trim().toString()) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInPage()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please correct password!")));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Something error!")));
    }
  }
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
                CustomTextField(controller: firstnameController, title: Strings.firstName),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(controller: lastnameController, title: Strings.firstName),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(controller: emailController, title: Strings.email),
                SizedBox(
                  height: 20.h,
                ),
                TextField(
                  obscureText: _visible,
                  controller: passwordController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 17.sp, bottom: 17.sp, left: 12.sp, right: 20.sp),
                    suffix: GestureDetector(onTap: () => setState(() => _visible = !_visible), child: Icon(_visible ? Icons.visibility_off : Icons.visibility)),
                    hintText: Strings.password,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 3),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextField(
                  obscureText: _visible,
                  controller: confirmController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 17.sp, bottom: 17.sp, left: 12.sp, right: 20.sp),
                    suffix: GestureDetector(onTap: () => setState(() => _visible = !_visible), child: Icon(_visible ? Icons.visibility_off : Icons.visibility)),
                    hintText: Strings.confirmPassword,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 3),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(controller: phoneNumberController, title: Strings.phoneNumber),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                  onTap: () => createUser(),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: CustomContainer(
                      width: 320.w, text: Strings.signUp, height: 57.h),
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
                            color: mode == ThemeMode.light ? Colors.black : Colors.white,
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

  

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    lastnameController.dispose();
    firstnameController.dispose();
    phoneNumberController.dispose();    
    
    super.dispose();
  }
}


