import 'dart:io';

import 'package:find_work/model/user_model.dart';

class ResumeModel {
  final int? id;
  final String title;
  final String area;
  final String birthDate;
  final Gender gender;
  final User user;

  ResumeModel({
    this.id = 1,
    required this.title,
    required this.area,
    required this.user,
    required this.gender,
    required this.birthDate
  });

  factory ResumeModel.fromJson(Map<String, Object?> json) =>
      ResumeModel(
        id: json["id"] as int?,
        title: json["title"] as String,
        area: json["region"] as String,
        user: User.fromJson(json["user"] as Map<String, Object?>),
        gender: json["gender"] as Gender,
        birthDate: json["birth_date"] as String
      );

  Map<String, Object?> toJson() =>
      {
        "id": id,
        "title": title,
        "region": area,
        "user": user,
        "birth_date": birthDate,
      };
}

// class Experience {
//   final String company;
//   final int startYear;
//   final int endYear;
//   final WorkType workType;
//   final Location location;
//   final String description;
//   final int employee;
//
//   Experience({
//
// });
// }

enum Location {
  remote,
  onSite,
  hybrid
}

enum WorkType {
  partTime,
  fullTime,
  hybrid
}

enum Gender {
  male,
  female
}


