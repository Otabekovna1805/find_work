class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? phoneNumber;

  User({
    this.id = 1,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  factory User.fromJson(Map<String, Object?> json) => User(
    id: json["id"] as int?,
    lastName: json["last_name"] as String?,
    firstName: json["first_name"] as String?,
    email: json["email"] as String?,
    password: json["password"] as String?,
    phoneNumber: json["phone_number"] as String?,
  );

  Map<String, Object?> toJson() => {
    "id" : id,
    "last_name" : lastName,
    "first_name" : firstName,
    "email" : email,
    "password" : password,
    "phone_number" : phoneNumber,
  };

  @override
  String toString() {
    return 'User{id: $id, lastName: $lastName, email: $email, password: $password, phone_number: $phoneNumber, first_name: $firstName, }';
  }
}