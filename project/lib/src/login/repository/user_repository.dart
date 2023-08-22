// File user_repository
// @project flutter-base-bloc-localization-dio
// @author dainq on 15-07-2021
import 'package:network/network.dart';

abstract class UserRepository {
  Future login(String username, String password);

  Future refreshToken(String? refreshToken);
}

class UserRepositoryImpl implements UserRepository {
  final Dio _dio;

  UserRepositoryImpl(this._dio);

  @override
  Future<Map<String, dynamic>> login(String username, String password) async {
    final result = await _dio.post("/api/v1/auth/signin",
        data: {"username": username, "password": password});
    return result.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> refreshToken(String? refreshToken) async {
    final result = await _dio.post("/api/auth/refresh-token",
        options: Options(headers: {
          "authorization": "Bearer $refreshToken",
        }));
    return result.data as Map<String, dynamic>;
  }
}
