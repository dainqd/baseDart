import 'package:bloc/bloc.dart';
import 'package:common/common.dart';
import 'package:example/network/network_manager.dart';
import 'package:example/src/account/model/User.dart';
import 'package:example/src/account/repository/account_repository.dart';
import 'package:example/utils/utils.dart';
import 'package:meta/meta.dart';

part 'user_menu_state.dart';

class UserMenuCubit extends Cubit<UserMenuState> {
  final userRegisterResponse = AccountRepositoryImpl(apiProvider);

  UserMenuCubit() : super(UserMenuInitial()) {
    callApiUser();
  }

  void callApiUser() async {
    try {
      final dataUser = await userRegisterResponse.userInfo();
      emit(UserMenuSuccess(dataUser['data']));
    } catch (e) {
      if (e is DioError) {
        showToast((onError as DioError).message.toString());
      } else {
        showToast(e.toString());
      }
    }
  }
}
