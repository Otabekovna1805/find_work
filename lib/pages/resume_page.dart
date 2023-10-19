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
  final  titleController = TextEditingController();
  final  areaController = TextEditingController();
  final  levelController = TextEditingController();
  final  jobTypeController = TextEditingController();
  final  experienceController = TextEditingController();
  final  skillsController = TextEditingController();
  final  descriptionController = TextEditingController();
  final  salaryController = TextEditingController();

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
                    CustomTextField(title: Strings.title, controller: titleController),
                    SizedBox(height: 10.sp),
                    CustomTextField(title: Strings.desc, controller: descriptionController),
                    SizedBox(height: 10.sp),
                    CustomTextField(title: Strings.area, controller: areaController),
                    SizedBox(height: 10.sp),
                    CustomTextField(title: Strings.forContact, controller: levelController),
                    SizedBox(height: 10.sp),
                    CustomTextField(title: Strings.jobType, controller: jobTypeController),
                    SizedBox(height: 10.sp),
                    CustomTextField(title: Strings.area, controller: experienceController),
                    SizedBox(height: 10.sp),
                    CustomTextField(title: Strings.skills, controller: skillsController),
                    SizedBox(height: 10.sp),
                    CustomTextField(title: Strings.salary, controller: salaryController),

                    SizedBox(height: 20.sp,),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const HomePage()));
                      },
                      borderRadius: BorderRadius.circular(15),
                      child: CustomContainer(width: 340.w, text: Strings.publishResume, height: 55.sp,)
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
