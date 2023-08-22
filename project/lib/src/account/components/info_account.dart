// File info_account
// @project flutter-base-bloc-localization-dio
// @author dainq on 9/28/2022
import 'package:example/generated/l10n.dart';
import 'package:example/style/font_colors.dart';
import 'package:example/style/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoAccount extends StatelessWidget {
  final data;

  const InfoAccount({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              width: 84,
              height: 84,
              child: ClipOval(
                  child: Image.asset(
                'assets/icon/ic_avatar_menu.png',
                fit: BoxFit.cover,
                color: ColorsApp.color_C7C7C7,
              ))),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${data?['first_name'] ?? 'Mobile'} ${data?['last_name'] ?? 'Developer'}',
                  style: TextStyle(
                      color: ColorsApp.color_424242,
                      fontSize: FontSize.TEXTSIZE_18,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icon/ic_verify_menu.svg'),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 4),
                          child: Text(
                            Translate.of(context).verified,
                            style: TextStyle(
                                color: ColorsApp.color_424242,
                                fontSize: FontSize.TEXTSIZE_14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icon/ic_new_member.svg'),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 4),
                          child: Text(
                            Translate.of(context).new_member,
                            style: TextStyle(
                                color: ColorsApp.color_424242,
                                fontSize: FontSize.TEXTSIZE_14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
