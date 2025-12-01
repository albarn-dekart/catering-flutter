import 'package:shared_preferences/shared_preferences.dart';

class TokenStorageService {
  static const _tokenKey = 'jwt_token';
  static const _userIriKey = 'user_iri';
  static const _emailKey = 'email';
  static const _rolesKey = 'user_roles';
  static const _tokenExpiryKey = 'token_expiry';

  // Cache SharedPreferences instance to avoid repeated getInstance() calls
  SharedPreferences? _prefs;

  Future<SharedPreferences> get _sharedPreferences async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  Future<void> saveToken(String token) async {
    final prefs = await _sharedPreferences;
    await prefs.setString(_tokenKey, token);
  }

  Future<String?> getToken() async {
    final prefs = await _sharedPreferences;
    return prefs.getString(_tokenKey);
  }

  Future<void> deleteToken() async {
    final prefs = await _sharedPreferences;
    await prefs.remove(_tokenKey);
  }

  Future<void> saveEmail(String email) async {
    final prefs = await _sharedPreferences;
    await prefs.setString(_emailKey, email);
  }

  Future<String?> getEmail() async {
    final prefs = await _sharedPreferences;
    return prefs.getString(_emailKey);
  }

  Future<void> deleteEmail() async {
    final prefs = await _sharedPreferences;
    await prefs.remove(_emailKey);
  }

  Future<void> saveRoles(List<String> roles) async {
    final prefs = await _sharedPreferences;
    await prefs.setStringList(_rolesKey, roles);
  }

  Future<List<String>?> getRoles() async {
    final prefs = await _sharedPreferences;
    return prefs.getStringList(_rolesKey);
  }

  Future<void> deleteRoles() async {
    final prefs = await _sharedPreferences;
    await prefs.remove(_rolesKey);
  }

  Future<void> saveTokenExpiry(DateTime expiry) async {
    final prefs = await _sharedPreferences;
    await prefs.setInt(_tokenExpiryKey, expiry.millisecondsSinceEpoch);
  }

  Future<DateTime?> getTokenExpiry() async {
    final prefs = await _sharedPreferences;
    final expiryMillis = prefs.getInt(_tokenExpiryKey);
    if (expiryMillis == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(expiryMillis);
  }

  Future<void> deleteTokenExpiry() async {
    final prefs = await _sharedPreferences;
    await prefs.remove(_tokenExpiryKey);
  }

  Future<void> saveUserIri(String userId) async {
    final prefs = await _sharedPreferences;
    await prefs.setString(_userIriKey, userId);
  }

  Future<String?> getUserIri() async {
    final prefs = await _sharedPreferences;
    return prefs.getString(_userIriKey);
  }

  Future<void> deleteUserIri() async {
    final prefs = await _sharedPreferences;
    await prefs.remove(_userIriKey);
  }

  Future<void> clearAll() async {
    final prefs = await _sharedPreferences;
    await prefs.remove(_tokenKey);
    await prefs.remove(_rolesKey);
    await prefs.remove(_tokenExpiryKey);
    await prefs.remove(_userIriKey);
  }
}
