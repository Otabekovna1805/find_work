import 'dart:io';

class ResumeModel {
  final int id;
  final String title;
  final String area;
  final String level;
  final String job_type;
  final String experience;
  final String skills;
  final File? image;
  final String description;
  final String salary;

  ResumeModel({
    this. id = 1,
    required this. title,
    required this. area,
    required this. level,
    required this. job_type,
    required this. experience,
    required this. skills,
    this.image,
    required this. description,
    required this. salary,
  });

  factory ResumeModel.fromJson(Map<String, Object?> json) => ResumeModel(
         id: json["id"] as int,
         title: json["fullName"] as String,
         area: json["age"] as String,
         level: json["technological"] as String,
         job_type: json["contact"] as String,
         experience: json["phoneNumber"] as String,
         skills: json["area"] as String,
         image: json["salary"] as File?,
         description: json["timeToApply"] as String,
         salary: json["addition"] as String,
      );

  Map<String, Object?> toJson() => {
    "id" : id,
    "title" :  id,
    "area" :  title,
    "level" :  area,
    "job_type" :  level,
    "experience" :  job_type,
    "skills" :  experience,
    "image" :  skills,
    "description" : image,
    "salary" :  description,
  };

}
