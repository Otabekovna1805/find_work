class VacancyModel {
  final String id;
  final String company;
  final String technological;
  final String contact;
  final String chargeFullName;
  final String timeToApply;
  final String workTime;
  final String area;
  final String salary;
  final String addition;
  final String purpose;

  VacancyModel({
    required this.id,
    required this.company,
    required this.chargeFullName,
    required this.technological,
    required this.contact,
    required this.workTime,
    required this.area,
    required this.salary,
    required this.timeToApply,
    required this.addition,
    required this.purpose,
  });

  factory VacancyModel.fromJson(Map<String, Object?> json) => VacancyModel(
    id: json["id"] as String,
    company: json["company"] as String,
    technological: json["technological"] as String,
    contact: json["contact"] as String,
    chargeFullName: json["chargeFullName"] as String,
    timeToApply: json["timeToApply"] as String,
    workTime: json["workTime"] as String,
    area: json["area"] as String,
    salary: json["salary"] as String,
    addition: json["addition"] as String,
    purpose: json["purpose"] as String,
  );

  Map<String, Object?> toJson() => {
    "id" : id,
    "company" : company,
    "technological" : technological,
    "contact" : contact,
    "chargeFullName" : chargeFullName,
    "timeToApply" : timeToApply,
    "workTime" : workTime,
    "area" : area,
    "salary" : salary,
    "addition" : addition,
    "purpose" : purpose,
  };

}
