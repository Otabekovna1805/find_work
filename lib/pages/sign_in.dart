import 'package:find_work/constants/images.dart';
import 'package:find_work/constants/strings.dart';
 import 'package:find_work/pages/sign_up.dart';
import 'package:find_work/pages/verification_page.dart';
 import 'package:find_work/service/registration_network_service.dart';
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
  bool _visible = true;

  Future<void> createUser() async {
    final Map<String,Object?> data ={
      "email" : emailController.text.trim().toString(),
      "password" : passwordController.text.trim().toString(),
    };
    final response = await RegistrationNetworkService.signInPost(api: RegistrationNetworkService.apiUserSignIn, data: data);
    if(response) {
      sendVerification(emailController.text.trim().toString());
      Navigator.push(context, MaterialPageRoute(builder: (context) => const VerificationPage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Something error!")));
    }
  }

  Future<void> sendVerification(String email) async {
    await RegistrationNetworkService.sendVerification(api: RegistrationNetworkService.apiSendVerification, email: email);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [
              SizedBox(child: Lottie.asset(Images.lottieSignIn)),
              CustomTextField(
                  controller: emailController, title: Strings.email),
              SizedBox(
                height: 20.h,
              ),
              TextField(
                obscureText: _visible,
                controller: passwordController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      top: 17.sp, bottom: 17.sp, left: 12.sp, right: 20.sp),
                  suffix: GestureDetector(
                      onTap: () => setState(() => _visible = !_visible),
                      child: Icon(
                          _visible ? Icons.visibility_off : Icons.visibility)),
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
              InkWell(
                onTap: () => createUser(),
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
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: Strings.signUp,
                      style: const TextStyle(color: Colors.lightBlueAccent),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage()),
                          );
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

  // void buttonLogin() async {
  //   List<Map<String, Object?>> response = auth.getData;
  //   List<User> users = response.map((e) => User.fromJson(e)).toList();
  //   List<User> haveUser = users.where((user) {
  //     return user.email == emailController.text.trim() &&
  //         user.password == passwordController.text.trim();
  //   }).toList();
  //
  //   if (haveUser.isEmpty) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(const SnackBar(content: Text("User Not Found")));
  //   } else {
  //     await auth.saveUser(haveUser[0]);
  //     if (context.mounted) {
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => const VerificationPage(),
  //         ),
  //       );
  //     }
  //   }
  // }
}
