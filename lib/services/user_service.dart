import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_app_sample/features/auth/data/models/user_model.dart';
import 'package:flutter_app_sample/services/api_service.dart';
import 'package:logger/logger.dart';

class UserService {
  final _api = ApiService();
  final logger = Logger();

  Future<UserModel?> getSelfUserInfo() async {
    try {
      final res = await _api.get('/user');
      return UserModel.fromJson(res);
    } catch (e, stack) {
      logger.e('Error loading user info', error: e, stackTrace: stack);
      return null;
    }
  }

  Future<void> changeAvatar(File avatarFile) async {
    try {
      final formData = FormData.fromMap({
        'avatar': await MultipartFile.fromFile(avatarFile.path, filename: 'avatar.jpg'),
      });

      final res = await _api.putMultipart('/user/avatar', formData);
      logger.i('Upload successful: $res');
    } catch (e) {
      logger.e('Error upload avatar: ', error: e);
      return;
    }
  }
}
