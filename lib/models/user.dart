class User {
  final String userId;
  final String name;
  final String age;
  final String phoneNumber;
  User({
    required this.userId,
    required this.name,
    this.age = '',
    this.phoneNumber = '',
  });

  static User fromJson(Map<String, dynamic> json, String docId) => User(
        userId: json['userId'],
        name: json['name'],
        age: json['age'] ?? '',
        phoneNumber: json['phoneNumber'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'name': name,
        'age': age,
        'phoneNumber': phoneNumber,
      };
}
