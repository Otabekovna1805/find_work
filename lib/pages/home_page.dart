import 'dart:async';
import 'dart:io';

import 'package:find_work/cubit/theme_cubit.dart';
import 'package:find_work/data/local_data_source.dart';
import 'package:find_work/pages/edit_profile_page.dart';
import 'package:find_work/pages/me_page.dart';
import 'package:find_work/pages/resumes_page.dart';
import 'package:find_work/pages/saved.dart';
import 'package:find_work/pages/vacancies_page.dart';
import 'package:find_work/pages/vacancy_or_resume.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../core/service_locator.dart';
import '../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final ImagePicker picker = ImagePicker();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  File? file;
  File? image;

  Future<String?> saveFileAppDocumentFromGallery(File image,
      [String filename = "profile"]) async {
    Completer<File> completer = Completer();
    try {
      final dir = await getApplicationDocumentsDirectory();
      final format = image.path.substring(image.path.lastIndexOf("."));
      final imagePath = "${dir.path}/$filename$format";
      File file = File(imagePath);
      final bytes = await image.readAsBytes();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
      return imagePath;
    } catch (e) {
      throw Exception('Error!');
    }
  }

  void pickImage(ImageSource source) async {
    // Navigator.pop(context);
    try {
      final result = await picker.pickImage(source: source);
      image = File(result!.path);
      await imageRepository.saveImage(image);
      setState(() {});
    } on PlatformException {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Invalid image format")));
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("This device doesn't support camera")));
    }
  }

  void getImage() async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text("Take a photo"),
                onTap: () => pickImage(ImageSource.camera),
              ),
              ListTile(
                title: const Text("Photo gallery"),
                onTap: () => pickImage(ImageSource.gallery),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        bottomNavigationBar:  const TabBar(
          tabs: <Widget>[
            Tab(
              text: "Me",
            ),
            Tab(
              text: "Resume",
            ),
            Tab(
              text: "Vacancy",
            ),
          ],
        ),
        key: _key,
        appBar: AppBar(
          leading: IconButton(onPressed: () => _key.currentState!.openDrawer(), icon: const Icon(Icons.menu),),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: const Text("🪐"),
                accountEmail: Text("",
                  // auth.getUser().toString(),
                  style: TextStyle(fontSize: 18.sp),
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFFA084E8),
                ),
                currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(150.sp),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 80.sp,
                        width: 80.sp,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(150.sp),
                          child:
                          (imageRepository.readImage(StorageKey.image.name) ==
                              null
                              ? Transform.scale(
                            scale: 1.3.sp,
                            child: Image.asset(
                              "assets/image/profile.png",
                            ),
                          )
                              : Image.file(
                            File(imageRepository
                                .readImage(StorageKey.image.name) ??
                                ""),
                            fit: BoxFit.cover,
                          )),
                        ),
                      ),
                      Align(
                        alignment: Alignment(-0.7.sp, 1.sp),
                        child: Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                getImage();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 22.sp,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.2.sp)),
                                child: Icon(
                                  CupertinoIcons.camera_fill,
                                  size: 15.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              /// #edit_profile
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfilePage()));
                },
                title: const Text(
                  "Edit profile",
                  style: TextStyle(fontSize: 18),
                ),
                leading: Image.asset(
                  "assets/image/edit_profile.png",
                  height: 25,
                ),
              ),

              /// #add_announcement
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const VacancyOrResume()));
                },
                title: const Text(
                  "Add announcement",
                  style: TextStyle(fontSize: 18),
                ),
                leading: Image.asset(
                  "assets/image/add.png",
                  height: 25,
                ),
              ),

              /// #saved_annoucemnt
              ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SavedAnnouncementPage()));
                  },
                  title: const Text(
                    "Saved announcement",
                    style: TextStyle(fontSize: 18),
                  ),
                  leading: Image.asset(
                    "assets/image/saved.png",
                    height: 25,
                  )),

              /// #mode
              ListTile(
                onTap: () {
                  ThemeCubit().changeTheme();
                },
                title: const Text(
                  "Mode",
                  style: TextStyle(fontSize: 18),
                ),
                leading: ValueListenableBuilder<ThemeMode>(
                    valueListenable: mode,
                    builder: (_, mode, child) {
                      return mode != ThemeMode.light
                          ? Image.asset(
                        "assets/image/sun.png",
                        height: 25,
                      )
                          : Image.asset(
                        "assets/image/moon.png",
                        height: 25,
                      );
                    }),
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            MePage(),
            ResumesPage(),
            VacanciesPage(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const VacancyOrResume()));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}


