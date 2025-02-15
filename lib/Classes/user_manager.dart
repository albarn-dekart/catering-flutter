import 'package:jwt_decoder/jwt_decoder.dart';

class UserManager {
  static final UserManager _instance = UserManager._internal();

  factory UserManager() {
    return _instance;
  }

  UserManager._internal();

  String? username;
  List<String> roles = [];
  bool detailsFilled = false;

  bool hasRole(String role) {
    return roles.contains(role);
  }

  void updateUserFromToken(String? token) {
    if (token != null) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      username = decodedToken['username'];
      roles = List<String>.from(decodedToken['roles']);
      detailsFilled = decodedToken['detailsFilled'];
    }
  }

  void clearUser() {
    username = null;
    roles = [];
    detailsFilled = false;
  }
}
