class RoleManager {
  static final RoleManager _instance = RoleManager._internal();

  factory RoleManager() => _instance;

  RoleManager._internal();

  bool isAdmin = false;
  bool isUser = false;

  void setRoles(List<String> roles) {
    isAdmin = roles.contains('ROLE_ADMIN');
    isUser = roles.contains('ROLE_USER');
  }
}