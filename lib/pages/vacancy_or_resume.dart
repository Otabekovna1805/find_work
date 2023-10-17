import 'package:find_work/constants/strings.dart';
import 'package:find_work/pages/resume_page.dart';
import 'package:find_work/pages/vacancy_page.dart';
import 'package:find_work/views/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class VacancyOrResume extends StatelessWidget {
  const VacancyOrResume({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 30),
          child: Column(
            children: [
              LottieBuilder.asset("assets/lotties/resume_vacancy.json", height: 300.sp,),

              SizedBox(height: 180.sp,),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  const ResumePage()));
                },
                borderRadius: BorderRadius.circular(15),
                child: CustomContainer(width: 360.sp, text: Strings.addResume, height: 50.sp)
              ),

              SizedBox(height: 20.sp,),

              /// #button for log in
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const VacancyPage()));
                },
                borderRadius: BorderRadius.circular(15),
                child: CustomContainer(width: 360.sp, text: Strings.addVacancy, height: 50.sp)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
