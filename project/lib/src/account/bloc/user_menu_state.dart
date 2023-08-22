part of 'user_menu_cubit.dart';

@immutable
abstract class UserMenuState {}

class UserMenuInitial extends UserMenuState {}

class UserMenuSuccess extends UserMenuState {
  final data;

  UserMenuSuccess(this.data);
}

class UserMenuFailse extends UserMenuState {
  final String message;

  UserMenuFailse(this.message);
}
