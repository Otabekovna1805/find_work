class ResumeModel {
  final String id;
  final String fullName;
  final String age;
  final String technological;
  final String contact;
  final String phoneNumber;
  final String area;
  final String salary;
  final String timeToApply;
  final String addition;
  final String purpose;

  ResumeModel({
    required this.id,
    required this.fullName,
    required this.age,
    required this.technological,
    required this.contact,
    required this.phoneNumber,
    required this.area,
    required this.salary,
    required this.timeToApply,
    required this.addition,
    required this.purpose,
  });

  factory ResumeModel.fromJson(Map<String, Object?> json) => ResumeModel(
        id: json["id"] as String,
        fullName: json["fullName"] as String,
        age: json["age"] as String,
        technological: json["technological"] as String,
        contact: json["contact"] as String,
        phoneNumber: json["phoneNumber"] as String,
        area: json["area"] as String,
        salary: json["salary"] as String,
        timeToApply: json["timeToApply"] as String,
        addition: json["addition"] as String,
        purpose: json["purpose"] as String,
      );

  Map<String, Object?> toJson() => {
    "id" : id,
    "fullName" : fullName,
    "age" : age,
    "technological" : technological,
    "contact" : contact,
    "phoneNumber" : phoneNumber,
    "area" : area,
    "salary" : salary,
    "timeToApply" : timeToApply,
    "addition" : addition,
    "purpose" : purpose,
  };

}
