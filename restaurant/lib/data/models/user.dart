class User {
  final String username;
  final String password;
  final String fname;
  final String? role;
  final String? privileges;

  const User({required this.username, required this.password, required this.fname, this.role, this.privileges});
}
