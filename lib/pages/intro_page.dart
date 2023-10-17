import 'package:find_work/constants/images.dart';
import 'package:find_work/constants/strings.dart';
import 'package:find_work/pages/home_page.dart';
import 'package:find_work/pages/sign_in.dart';
import 'package:find_work/views/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Image.asset(
              Images.logoWhite,
              height: 400.sp,
              width: 500.sp,
            ),
            SizedBox(
              height: 80.sp,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
              },
              borderRadius: BorderRadius.circular(20),
              child: CustomContainer(
                  width: 300.sp, text: Strings.joinUs, height: 67.sp, color: Colors.black,),
            ),
            SizedBox(
              height: 20.sp,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignInPage()));
              },
              borderRadius: BorderRadius.circular(20),
              child: CustomContainer(
                  width: 300.sp, text: Strings.signIn, height: 67.sp),
            ),
          ],
        ),
      ),
    );
  }
}
