import 'package:find_work/service/network_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/resume.dart';

class ResumesPage extends StatefulWidget {
  const ResumesPage({super.key});

  @override
  State<ResumesPage> createState() => _ResumesPageState();
}

class _ResumesPageState extends State<ResumesPage> {
  bool _isVisible = false;
  bool _isSaved = false;
  List<ResumeModel> items = [];
  void fetchResume() async {
    final data = await Network.methodGet(api: Network.apiResumeList);
    items = Network.parseResumeList(data!);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchResume();
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, i) {
            final item = items[i];
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
              margin: EdgeInsets.all(20.sp),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
                  child: Column(children: [
                    /// #text_resume
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text(
                            "Resume: ",
                            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700, fontFamily: "Saira"),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  _isVisible = !_isVisible;
                                  setState(() {});
                                });
                              },
                              icon: Transform.rotate(
                                  angle: _isVisible ? 4.7 : 7.9,
                                  child: const Icon(Icons.arrow_back_ios_new))),
                        ],
                      ),
                    ),

                    /// #fullName
                    Row(
                      children: [
                        Image.asset(
                          "assets/image/name.png",
                          height: 30.sp,
                        ),
                         Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.sp),
                            child: Text(
                              "Full Name: ${item.title}",
                              style:
                              TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w900, fontFamily: "Exo"),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),

                     SizedBox(
                      height: 10.sp,
                    ),

                    /// #age
                    Row(
                      children: [
                        Image.asset(
                          "assets/image/age.png",
                          height: 30.sp.sp,
                        ),
                         Padding(
                          padding: EdgeInsets.only(left: 10.sp),
                          child: Text(
                            "Age: 14 y.o",
                            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w900, fontFamily: "Exo"),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    /// #technological
                    Row(
                      children: [
                        Image.asset(
                          "assets/image/technological.png",
                          height: 30.sp.sp,
                        ),
                         Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.sp, top: 0),
                            child: Text(
                              "Technological: Dart, Flutter",
                              style:
                              TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w900, fontFamily: "Exo"),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),

                    if (_isVisible)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 10.sp,
                          ),

                          /// #contact
                          Row(
                            children: [
                              Image.asset(
                                "assets/image/contact.png",
                                height: 30.sp,
                              ),
                               Padding(
                                padding: EdgeInsets.only(left: 10.sp, top: 5.sp),
                                child: Text(
                                  "For contact: @space_1805",
                                  style: TextStyle(
                                      fontSize: 16.sp, fontWeight: FontWeight.w900, fontFamily: "Exo"),
                                ),
                              ),
                            ],
                          ),

                           SizedBox(
                            height: 13.sp,
                          ),

                          /// #phoneNumber
                          Row(
                            children: [
                              Image.asset(
                                "assets/image/phone_number.png",
                                height: 30.sp.sp,
                              ),
                               Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.sp),
                                  child: Text(
                                    "Phone Number: +998 90 959 93 19",
                                    style: TextStyle(
                                        fontSize: 16.sp, fontWeight: FontWeight.w900, fontFamily: "Exo"),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),

                           SizedBox(
                            height: 10.sp,
                          ),

                          /// #area
                          Row(
                            children: [
                              Image.asset(
                                "assets/image/area.png",
                                height: 30.sp.sp,
                              ),
                               Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.sp),
                                  child: Text(
                                    "Area: Tashkent",
                                    style: TextStyle(
                                        fontSize: 16.sp, fontWeight: FontWeight.w900, fontFamily: "Exo"),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),

                           SizedBox(
                            height: 10.sp,
                          ),

                          /// #salary
                          Row(
                            children: [
                              Image.asset(
                                "assets/image/salary.png",
                                height: 30.sp,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 10, top: 0),
                                child: Text(
                                  "Salary: 30.sp0\$",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w900, fontFamily: "Exo"),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          /// #timeToApply
                          Row(
                            children: [
                              Image.asset(
                                "assets/image/time_to_apply.png",
                                height: 30.sp,
                              ),
                               Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.sp),
                                  child: Text(
                                    "Time  to apple: 24/7",
                                    style: TextStyle(
                                        fontSize: 16.sp, fontWeight: FontWeight.w900, fontFamily: "Exo"),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          /// #addition
                          Row(
                            children: [
                              Image.asset(
                                "assets/image/addition.png",
                                height: 30.sp,
                              ),
                              const Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, top: 0),
                                  child: Text(
                                    "Addition: I'm learning English",
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.w900, fontFamily: "Exo"),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          /// #purpose
                          Row(
                            children: [
                              Image.asset(
                                "assets/image/purpose.png",
                                height: 30.sp,
                              ),
                               Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.sp),
                                  child: Text(
                                    "Purpose: Gaining experience in large projects",
                                    style: TextStyle(
                                        fontSize: 16.sp, fontWeight: FontWeight.w900, fontFamily: "Exo"),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),

                           SizedBox(
                            height: 20.sp,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isSaved = !_isSaved;
                                    setState(() {});
                                  });
                                },
                                icon: Icon(_isSaved ? Icons.bookmark_border : Icons.bookmark)
                              ),
                              Text(
                                "${DateTime.now().day < 10.sp ? 0.sp : null}${DateTime.now().day.toString()}.0${DateTime.now().month.toString()}.${DateTime.now().year.toString()}",
                                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w900, fontFamily: "Exo"),
                              ),
                            ],
                          )
                        ],
                      )
                  ]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
