// File network_manager
// @project example
// @author dainq on 15-07-2021
import 'dart:io';

import 'package:common/common.dart';
import 'package:example/auth/AuthServiceImpl.dart';
import 'package:example/network/config.dart';
import 'package:example/src/login/repository/user_repository.dart';

final apiProvider = APIClient.init(
    config: BuildConfig(),
    headerAuthorized: HeaderAuthorized(
        accessToken: () {
          //Lấy ra token
          return AuthServiceImpl().getAccessToken();
        },
        type: "Bearer",
        refreshToken: (dio) async {
          // Khi token hết hạn chạy vào đây và lấy ra refresh token
          final refreshToken = AuthServiceImpl().getRefreshToken();
          // Call api refresh token để lấy token mới
          final result = await UserRepositoryImpl(clientRefresh)
              .refreshToken(refreshToken);
          //Đây là cách gọi lấy ra value dạng map, cũng có thể parser sang Model để gọi
          final accessTokenNew = result['data']["token"];
          final refreshTokenNew = result['data']["token"];
          final data = {
            "accessToken": accessTokenNew,
            "refreshToken": refreshTokenNew
          };
          // Set lại token và lưu
          await AuthServiceImpl().setData(data);
        }),
    msgErrorHandler: MsgErrorHandler(
        msgTimeOut: "time out",
        msgNetworkOther: "network fail",
        handlerDioErrorTypeResponse: (dioError) {
          final data = dioError.response?.data;
          return data == null
              ? dioError
              : dioError.copyWith(error: data["message"]);
        }),
    interceptors: []).get();

final clientRefresh = APIClient.publish(config: BuildConfig()).get();
