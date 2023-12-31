// File utils
// @project flutter-base-bloc-localization-dio
// @author dainq on 8/2/2022

import 'package:example/style/font_colors.dart';
import 'package:example/style/font_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

Future<bool?> showToast(message) {
  return Fluttertoast.showToast(
      msg: message.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black45,
      textColor: Colors.white,
      fontSize: 14.0);
}

String parserTime(String time) {
  return '${time.replaceRange(5, 8, '')}';
}

String statusStationString(int status) {
  if (status == 1) {
    return "Đang hoạt động";
  }
  return "Đang đóng cửa";
}

String statusProductString(int status) {
  if (status == 1) {
    return "Sẵn sàng";
  } else if (status == 2) {
    return "Đang cho thuê";
  } else if (status == 3) {
    return "Bảo trì";
  }
  return "Dừng hoạt động";
}

String convertMoney(value) {
  final numberFormat = NumberFormat("###,###,###", "en_US");
  return numberFormat.format(value);
}

showDialogMessage(BuildContext context, String? mess) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        alignment: Alignment.center,
        backgroundColor: ColorsApp.color_ffffff,
        insetPadding: EdgeInsets.only(
          left: 36,
          right: 36,
        ),
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Thông báo',
                    style: TextStyle(
                        fontSize: FontSize.TEXTSIZE_18,
                        fontWeight: FontWeight.w500)),
                Padding(
                    padding: EdgeInsets.only(top: 8), child: Text(mess ?? '')),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          'Xác nhận',
                          textAlign: TextAlign.end,
                          style: TextStyle(color: ColorsApp.color_17A63F),
                        ))),
              ],
            )),
      );
    },
  );
}

showDialogConfirm(BuildContext context, String? mess, onClick,
    {checkCancel = true}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
          alignment: Alignment.center,
          backgroundColor: ColorsApp.color_ffffff,
          insetPadding: EdgeInsets.only(
            left: 36,
            right: 36,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Thông báo',
                    style: TextStyle(
                        fontSize: FontSize.TEXTSIZE_20,
                        fontWeight: FontWeight.w500)),
                Padding(
                    padding: EdgeInsets.only(top: 8), child: Text(mess ?? '')),
                Row(
                  children: [
                    Expanded(child: SizedBox()),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          onClick();
                        },
                        child: Container(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'Xác nhận',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: ColorsApp.color_17A63F,
                                  fontSize: FontSize.TEXTSIZE_16),
                            ))),
                    checkCancel
                        ? GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Hủy',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: ColorsApp.color_D11A1A,
                                    fontSize: FontSize.TEXTSIZE_16),
                              ),
                            ))
                        : SizedBox(),
                  ],
                ),
              ],
            ),
          ));
    },
  );
}

Future showLoading(BuildContext context) async {
  return showDialog(
    routeSettings: const RouteSettings(name: "showDialog"),
    barrierDismissible: false,
    context: context,
    useRootNavigator: true,
    builder: (context) => WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Center(
          child: Container(
            color: Colors.black12,
            padding: const EdgeInsets.all(15.0),
            child: Theme(
                data: ThemeData(
                    cupertinoOverrideTheme:
                        const CupertinoThemeData(brightness: Brightness.dark)),
                child: const CupertinoActivityIndicator(
                  radius: 14.5,
                )),
          ),
        ),
      ),
    ),
  );
}

closeLoading(BuildContext context) {
  if (context != null) {
    Navigator.of(context, rootNavigator: true)
        .popUntil((route) => route.settings.name != "showDialog");
  }
}
