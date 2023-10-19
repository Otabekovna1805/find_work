import 'package:find_work/constants/strings.dart';
import 'package:find_work/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../views/container.dart';
import '../views/textfield.dart';

class VacancyPage extends StatefulWidget {
  const VacancyPage({super.key});

  @override
  State<VacancyPage> createState() => _VacancyPageState();
}

class _VacancyPageState extends State<VacancyPage> {
  final TextEditingController chargeFullNameController = TextEditingController();
  final TextEditingController technologicalController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  final TextEditingController timeToApplyController = TextEditingController();
  final TextEditingController workTimeController = TextEditingController();
  final TextEditingController additionController = TextEditingController();
  final TextEditingController purposeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Image.asset("assets/image/add_vacancy.png", height: 280,),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    CustomTextField(title: Strings.companyName, controller: companyController),
                    const SizedBox(height: 10,),
                    CustomTextField(title: Strings.skills, controller: technologicalController),
                    const SizedBox(height: 10,),
                    CustomTextField(title: Strings.forContact, controller: contactController),
                    const SizedBox(height: 10,),
                    CustomTextField(title: Strings.chargeFullName, controller: chargeFullNameController),
                    const SizedBox(height: 10,),
                    CustomTextField(title: Strings.timeToApply, controller: timeToApplyController),
                    const SizedBox(height: 10,),
                    CustomTextField(title: Strings.area, controller: areaController),
                    const SizedBox(height: 10,),
                    CustomTextField(title: Strings.howSalary, controller: salaryController),
                    const SizedBox(height: 10,),
                    CustomTextField(title: Strings.addition, controller: additionController),
                    const SizedBox(height: 10,),
                    CustomTextField(title: Strings.purpose, controller: purposeController),

                    const SizedBox(height: 20,),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const HomePage()));
                      },
                      borderRadius: BorderRadius.circular(15),
                      child: CustomContainer(width: 340.w, text: Strings.publishVacancy, height: 55.h)
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
