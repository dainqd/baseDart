import 'package:common/common.dart';
import 'package:example/generated/l10n.dart';
import 'package:example/src/account/ui/account.dart';
import 'package:example/style/font_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

// File home
// @project example
// @author dainq on 16-07-2021
class AppHome extends StatefulWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  @override
  Widget build(BuildContext context) {
    return MainBottomNavigationBar(
      wantKeepAliveChildren: [true, false, false, false, false],
      bottomNavigatorItemBuilder:
          (BuildContext contextNavigation, int currentIndex) {
        return BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              contextNavigation.read<TabBarController>().tabIndex = index;
            },
            selectedItemColor: ColorsApp.color_17A63F,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            unselectedFontSize: 11,
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icon/ic_home.svg',
                    height: 25,
                    color: ColorsApp.color_C7C7C7,
                  ),
                  activeIcon: SvgPicture.asset(
                    'assets/icon/ic_home.svg',
                    height: 25,
                    color: ColorsApp.color_17A63F,
                  ),
                  label: Translate.of(context).home),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icon/ic_history.svg',
                    height: 25,
                    color: ColorsApp.color_C7C7C7,
                  ),
                  activeIcon: SvgPicture.asset(
                    'assets/icon/ic_history.svg',
                    height: 25,
                    color: ColorsApp.color_17A63F,
                  ),
                  label: Translate.of(context).history),
              BottomNavigationBarItem(
                icon: Container(
                  padding: EdgeInsets.only(top: 5),
                  child: SvgPicture.asset(
                    'assets/icon/ic_qr_scan_home.svg',
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icon/ic_wallet.svg',
                    height: 25,
                    color: ColorsApp.color_C7C7C7,
                  ),
                  activeIcon: SvgPicture.asset(
                    'assets/icon/ic_wallet.svg',
                    height: 25,
                    color: ColorsApp.color_17A63F,
                  ),
                  label: Translate.of(context).wallet),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icon/ic_user.svg',
                    height: 25,
                    color: ColorsApp.color_C7C7C7,
                  ),
                  activeIcon: SvgPicture.asset(
                    'assets/icon/ic_user.svg',
                    height: 25,
                    color: ColorsApp.color_17A63F,
                  ),
                  label: Translate.of(context).account),
            ]);
      },
      children: [
        Scaffold(
            body: Center(
          child: Text(Translate.of(context).home),
        )),
        Scaffold(
            body: Center(
          child: Text(Translate.of(context).history),
        )),
        Scaffold(
            body: Center(
          child: Text(Translate.of(context).scan_qr_code),
        )),
        Scaffold(
            body: Center(
          child: Text(Translate.of(context).wallet),
        )),
        Account()
      ],
    );
  }
}
