import 'package:find_work/constants/strings.dart';
import 'package:find_work/pages/home_page.dart';
import 'package:find_work/views/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../views/textfield.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({super.key});

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  final fullNameController = TextEditingController();

  final ageController = TextEditingController();

  final technologicalController = TextEditingController();

  final contactController = TextEditingController();

  final phoneNumberController = TextEditingController();

  final areaController = TextEditingController();

  final salaryController = TextEditingController();

  final timeToApplyController = TextEditingController();

  final additionController = TextEditingController();

  final purposeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 40.w, top: 20.sp),
                child: Image.asset("assets/image/add_resume.png", height: 280.sp,),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.sp),
                child: Column(
                  children: [
                    CustomTextField(title: Strings.fullName, controller: fullNameController),
                    SizedBox(height: 10.sp),
                    CustomTextField(title: Strings.yearsOld, controller: ageController),
                    SizedBox(height: 10.sp),
                    CustomTextField(title: Strings.useTechnology, controller: technologicalController),
                    SizedBox(height: 10.sp),
                    CustomTextField(title: Strings.forContact, controller: contactController),
                    SizedBox(height: 10.sp),
                    CustomTextField(title: Strings.phoneNumber, controller: phoneNumberController),
                    SizedBox(height: 10.sp),
                    CustomTextField(title: Strings.area, controller: areaController),
                    SizedBox(height: 10.sp),
                    CustomTextField(title: Strings.salary, controller: salaryController),
                    SizedBox(height: 10.sp),
                    CustomTextField(title: Strings.timeToApply, controller: timeToApplyController),
                    SizedBox(height: 10.sp),
                    CustomTextField(title: Strings.addition, controller: additionController),
                    SizedBox(height: 10.sp),
                    CustomTextField(title: Strings.purpose, controller: purposeController),

                    SizedBox(height: 20.sp,),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const HomePage()));
                      },
                      borderRadius: BorderRadius.circular(15),
                      child: CustomContainer(width: 340.w, text: Strings.publishResume, height: 55.sp, color: Colors.black,)
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
