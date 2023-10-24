// import 'package:flutter/foundation.dart';
// import 'package:hive_flutter/hive_flutter.dart';
//
// import '../model/user_model.dart';
//
// class HiveUser {
//   static String todoDB = "usersDb";
//   static String todos = "users";
//   static String currentUser = "currentUser";
//   static String user = "user";
//
//   static Box<List<Map<String, Object?>>> box = Hive.box(todoDB);
//   static Box<Map<String, Object?>> currentUserBox = Hive.box(currentUser);
//
//   static Future<void> init() async{
//     await Hive.initFlutter();
//     if(!Hive.isBoxOpen(todoDB)) {
//       await Hive.openBox<List<Map<String, Object?>>>(todoDB);
//     }
//     if(!Hive.isBoxOpen(currentUser)) {
//       await Hive.openBox<Map<String, Object?>>(currentUser);
//     }
//   }
//
//   Future<void> storeData(User user) async {
//     List<Map<String, Object?>> response = getData;
//     response.add(user.toJson());
//     await box.put(todos, response);
//   }
//
//   Future<void> deleteData(int id) async {
//     List<Map<String, Object?>> response = getData;
//     response.removeWhere((element) => (element["id"] as int) == id);
//     await box.put(todos, response);
//   }
//
//   ValueListenable<Box<List<Map<String, Object?>>>> get getListenable => box.listenable();
//
//   List<Map<String, Object?>> get getData => box.get(todos) ?? <Map<String, Object?>>[];
//
//
//   Future<void> saveUser(User loginUser) async {
//     await currentUserBox.put(user, loginUser.toJson());
//   }
//
//   Map<String, Object?>? getUser() {
//     return currentUserBox.get(user);
//   }
//
//   void clearUser() async {
//     await currentUserBox.delete(user);
//   }
//
// }