// File user_repository
// @project flutter-base-bloc-localization-dio
// @author dainq on 15-07-2021
import 'dart:convert';

import 'package:example/src/account/model/User.dart';
import 'package:network/network.dart';

abstract class AccountRepository {
  Future userInfo();
}

class AccountRepositoryImpl implements AccountRepository {
  final Dio _dio;

  AccountRepositoryImpl(this._dio);

  @override
  Future<Map<String,dynamic>> userInfo() async {
    final result = await _dio.get(
      "/api/customers/profile",
    );
    // return User.fromJson(jsonDecode(jsonEncode(result.data['data'])));
    return result.data as Map<String, dynamic>;
  }
}
