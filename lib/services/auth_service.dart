import 'package:flutter_app_sample/services/api_service.dart';
import 'package:flutter_app_sample/utils/shared_prefs.dart';

class AuthService {
  final _api = ApiService();

  Future<bool> login(String username, String password) async {
    final res = await _api.post('/auth/authenticate', {
      'email': username,
      'password': password,
    });

    final accessToken = res['access_token'];
    final refreshToken = res['refresh_token'];

    if (accessToken != null && refreshToken != null) {
      await SharedPrefs.saveToken(accessToken, refreshToken);
      return true;
    }
    return false;
  }

  Future<bool> register(String email, String repeatEmail, String password, String confirmPassword,
      String username, String firstName, String middleName, String lastName) async {
    final res = await _api.post('/auth/register', {
      'email': email,
      'repeatEmail': repeatEmail,
      'password': password,
      'confirmPassword': confirmPassword,
      'username': username,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'appType': 'CASTIFY_STUDIO'
    });

    if (res is Map<String, dynamic>) {
      return true;
    }
    return false;
  }

  Future<bool> verifyAccount(String token) async {
    final res = await _api.post(
        '/auth/verify-email',
        {},
        headers: {
          'Authorization': 'Bearer $token',
        }
    );

    final newAccess = res['access_token'];
    final newRefresh = res['refresh_token'];
    if (newAccess != null) {
      await SharedPrefs.saveToken(newAccess, newRefresh);
      return true;
    }

    return false;
  }
  
  Future<bool> refreshToken() async {
    final refreshToken = await SharedPrefs.getRefreshToken();
    if (refreshToken == null) return false;
    
    try {
      final res = await _api.post(
        '/auth/refresh-token',
        {},
        headers: {
          'Authorization': 'Bearer $refreshToken',
        },
      );

      final newAccess = res['access_token'];
      final newRefresh = res['refresh_token'];
      if (newAccess != null) {
        await SharedPrefs.saveToken(newAccess, newRefresh);
        return true;
      }
    } catch (_) {}

    return false;
  }

  // Send reset password request
  Future<bool> sendResetRequest(String email) async {
    final res = await _api.post('/auth/reset/send-request', {
      'email': email,
    });

    if (res != null && res['status'] == 'success') {
      return true;
    } else {
      throw Exception('Failed to send reset request');
    }
  }

  // Reset password
  Future<bool> resetPassword(String newPassword) async {
    final res = await _api.post('/auth/reset/change', {
      'newPassword': newPassword,
    });

    if (res != null && res['status'] == 'success') {
      return true;
    } else {
      throw Exception('Failed to reset password');
    }
  }
}