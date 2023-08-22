import 'package:common/common.dart';
import 'package:example/generated/l10n.dart';
import 'package:example/network/network_manager.dart';
import 'package:example/src/login/bloc/login_cubit.dart';
import 'package:example/src/login/components/input_login.dart';
import 'package:example/src/login/repository/user_repository.dart';
import 'package:example/style/font_colors.dart';
import 'package:example/style/font_size.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// File Login
// @project example
// @author dainq on 14-07-2021
class Login extends StatefulWidget {
  final AuthenticationStatus? openLogin;

  const Login({Key? key, this.openLogin}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginCubit = LoginCubit(UserRepositoryImpl(apiProvider));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: SafeArea(
        top: false,
        bottom: true,
        child: BlocProvider<LoginCubit>(
          create: (context) => loginCubit,
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 36),
                  child: Text(
                    Translate.of(context).login,
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: ColorsApp.color_000000),
                  ),
                ),
                InputLogin(
                  controller: loginCubit.usernameController,
                  textInputType: TextInputType.text,
                  hintText: Translate.of(context).username,
                  // labelText: Translate.of(context).phone_number,
                ),
                const SizedBox(
                  height: 24,
                ),
                InputLogin(
                  controller: loginCubit.passwordController,
                  hintText: Translate.of(context).password,
                  // labelText: Translate.of(context).password,
                  fieldPassword: true,
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 37),
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      "${Translate.of(context).forgot_password}?",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: ColorsApp.color_4CBD6C,
                          fontSize: FontSize.TEXTSIZE_12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                BlocListener<AuthenticationBloc, AuthenticationState>(
                  listener: (BuildContext context, state) {
                    if (state.status == AuthenticationStatus.authenticated) {
                      Navigator.of(context).maybePop();
                    }
                  },
                  child: GestureDetector(
                    onTap: () {
                      loginCubit.login(context);
                    },
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 37),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: ColorsApp.color_17A63F,
                      ),
                      child: Text(
                        Translate.of(context).login,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorsApp.color_ffffff,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: Translate.of(context).no_account,
                        style: TextStyle(
                            fontSize: 12,
                            letterSpacing: 1,
                            color: ColorsApp.color_818181),
                      ),
                      TextSpan(
                          text: Translate.of(context).register,
                          style: TextStyle(
                              fontSize: 12,
                              letterSpacing: 1,
                              color: ColorsApp.color_0086AE),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('aaaaaaaaaaaaaaa');
                            }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  @override
  void dispose() {
    loginCubit.disposeController();
    super.dispose();
  }
}
