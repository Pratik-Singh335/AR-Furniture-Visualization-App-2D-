class UserModel {
  final int? id;
  final String username;
  final String email;
  final String phoneNumber;
  final String accountType;

  UserModel({
    this.id,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.accountType,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'phone': phoneNumber,
      'account': accountType,
    };
  }

  // -- Empty Model
  static UserModel empty() {
    return UserModel(
      id: 0,
      username: '',
      email: '',
      phoneNumber: '',
      accountType: '',
    );
  }

  // -- Convert Snapshot from Firebase to UserModel
  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'] ?? '',
      username: data['username'] ?? '',
      email: data['email'] ?? '',
      phoneNumber: data['phone'] ?? '',
      accountType: data['account'] ?? '',
    );
  }
}
