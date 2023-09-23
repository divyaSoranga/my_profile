class User {
  final String name;
  final String email;
  final String avatarUrl;
  final List<String> skills;
  final List<String> workExperience;

  User({
    this.name = '',
    this.email = '',
    this.avatarUrl = '',
    this.skills = const [],
    this.workExperience = const [],
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json['name'] ?? '',
        email: json['email'] ?? '',
        avatarUrl: json['avatarUrl'] ?? '',

        // created_at: (json['created_at'] as Timestamp).toDate(),
      );
}
