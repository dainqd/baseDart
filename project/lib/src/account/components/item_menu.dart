// File item_menu
// @project flutter-base-bloc-localization-dio
// @author dainq on 8/19/2022
import 'package:example/style/font_colors.dart';
import 'package:example/style/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemMenu extends StatelessWidget {
  final iconSVG;
  final title;
  final topRemoveBorder;
  final logout;
  final onTap;

  const ItemMenu(
      {Key? key,
      this.iconSVG,
      this.title,
      this.onTap,
      this.logout = false,
      this.topRemoveBorder = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 15, bottom: 15, left: 24, right: 24),
        decoration: topRemoveBorder
            ? BoxDecoration()
            : BoxDecoration(
                border: Border(
                    top: BorderSide(color: ColorsApp.color_D9D9D9, width: 1))),
        child: Row(
          children: [
            SvgPicture.asset(
              iconSVG,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: FontSize.TEXTSIZE_14,
                      color: logout
                          ? ColorsApp.color_D11A1A
                          : ColorsApp.color_424242),
                ),
              ),
            ),
            logout ? SizedBox() : SvgPicture.asset('assets/icon/ic_next_right.svg'),
          ],
        ),
      ),
    );
  }
}
