// ignore_for_file: unused_local_variable

import 'package:common/common.dart';
import 'package:example/src/login/repository/user_repository.dart';
import 'package:example/utils/utils.dart';
import 'package:flutter/cupertino.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final UserRepository _userRepository;

  LoginCubit(this._userRepository) : super(LoginInitial());

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login(BuildContext context) async {
    try {
      final data = await _userRepository.login(
          usernameController.text, passwordController.text);
      context.read<AuthenticationBloc>().add(AppLoginSuccessEvent({
            "accessToken": data['data']['token'],
            "refreshToken": data['data']['token']
          }));
      showToast('Đăng nhập thành công');
    } catch (error) {
      if (error is DioError) {
        showToast((error as DioError).message);
      }else{
        showToast(error.toString());
      }
    }
  }

  void disposeController(){
    usernameController.dispose();
    passwordController.dispose();
  }
}
