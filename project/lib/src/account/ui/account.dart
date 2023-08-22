import 'package:common/common.dart';
import 'package:example/generated/l10n.dart';
import 'package:example/src/account/bloc/user_menu_cubit.dart';
import 'package:example/src/account/components/info_account.dart';
import 'package:example/src/account/components/item_menu.dart';
import 'package:example/style/font_colors.dart';
import 'package:flutter/material.dart';

// File account
// @project flutter-base-bloc-localization-dio
// @author dainq on 16-07-2021
class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserMenuCubit(),
      child: Scaffold(
        backgroundColor: ColorsApp.color_ffffff,
        appBar: AppBar(
          backgroundColor: ColorsApp.color_17A63F,
          title: Text(Translate.of(context).account,
              style: TextStyle(color: ColorsApp.color_ffffff)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<UserMenuCubit, UserMenuState>(
                builder: (context, state) {
                  if (state is UserMenuSuccess) {
                    return InfoAccount(
                      data: state.data,
                    );
                  }
                  return const InfoAccount();
                },
              ),
              TextButton(
                  onPressed: () {
                    if (Translate.delegate
                            .getLocaleCurrent(context)
                            ?.languageCode ==
                        "vi") {
                      Translate.delegate.loadAndSave(
                          const Locale.fromSubtags(languageCode: 'en'));
                    } else {
                      Translate.delegate.loadAndSave(
                          const Locale.fromSubtags(languageCode: 'vi'));
                    }
                  },
                  child: Center(child: Text(Translate.of(context).language))),
              ItemMenu(
                  iconSVG: 'assets/icon/ic_user_menu.svg',
                  title: Translate.of(context).personal_information,
                  topRemoveBorder: true),
              ItemMenu(
                  iconSVG: 'assets/icon/ic_guide.svg',
                  title: Translate.of(context).user_manual),
              ItemMenu(
                  iconSVG: 'assets/icon/ic_support_center.svg',
                  title: Translate.of(context).information_support_center),
              // ItemMenu(
              //     iconSVG: 'assets/icon/ic_translate.svg',
              //     title: 'Cài đặt ngôn ngữ'),
              ItemMenu(
                  iconSVG: 'assets/icon/ic_contact.svg',
                  title: Translate.of(context).contact_for_cooperation),
              ItemMenu(
                  iconSVG: 'assets/icon/ic_feedback.svg',
                  title: Translate.of(context).feedback),
              ItemMenu(
                iconSVG: 'assets/icon/ic_logout.svg',
                title: Translate.of(context).logout,
                logout: true,
                onTap: () {
                  context.read<AuthenticationBloc>().add(AppLogoutEvent());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
