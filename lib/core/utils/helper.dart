import 'dart:io';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';
import 'package:kanban_board/core/ui/dialog/app_alert_dialog.dart';
import 'package:kanban_board/core/ui/loading/app_progress_dialog.dart';
import 'package:kanban_board/core/ui/theme/theme_manager.dart';
import 'package:path_provider/path_provider.dart';

import 'dart:io' show Platform;


enum ConfirmAction { CANCEL, OK }

void printWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}



extension CapExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  String dashAfter3() {
    String temp1 = this;
    String op = '';
    for (int i = 0; i < temp1.length; i++) {
      if (i % 3 == 0 && i != 0 && i + 3 <= temp1.length)
        op += '-' + temp1[i];
      else
        op += temp1[i];
    }
    return op;
  }
}

class Helper {
  static AppProgressDialog? pr;
  static String? tempPath ;
  static double getToolbarStatusBarHeightWithMarginTop(BuildContext context) {
    return Dimens.toolbar_height;
  }
  static void showAlertDialogWithOnTap(
      BuildContext context, String heading, Function() onTap,
      {String textOKBtn = 'OK'}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) =>
          AppAlertDialog(heading, onTap, textOKBtn),
    );
  }
  static double getToolbarStatusBarHeight(BuildContext context) {
    return Dimens.toolbar_height + 1;
  }
 static Future<String?> saveTempPath() async{
   final Directory directory = await getTemporaryDirectory();
    tempPath = directory.path;
    return tempPath ;
 }
  static double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }
 static File? getFileFromBase64(String base64)
  {
    final decodedBytes = base64Decode(base64);
    var file = File('$tempPath/photo${Random().nextInt(99999)+1000000}');
    file.writeAsBytesSync(decodedBytes);
    return file ;
   }

  static showLoadingDialog(BuildContext context, String message) {
    /*if (pr != null && pr.isShowing()) {
      pr.update(message: message);
    } else {
      pr = AppProgressDialog(context, ProgressDialogType.Normal);
      pr.setMessage(message);
      pr.show();
    }*/
    if (pr != null && pr!.isShowing()) {
    } else {
      pr = AppProgressDialog(context, ProgressDialogType.Normal);
      pr!.showLoadingDialog(message);
    }
  }

  static hideLoadingDialog(BuildContext context) {
    if (pr != null && pr!.isShowing()) {
      pr!.hide(context);
    }
  }

  static Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('$path');
    String fileName = path.split('/').last;
    final file = File('${(await getTemporaryDirectory()).path}/$fileName');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  static  showAlertDialog(BuildContext c, String heading,
      {String? body, String textOKBtn = 'OK'}) {
    if (body == null) {
      showDialog(
        context: c,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              heading,
              style:GoogleFonts.poppins(
                  color: AppColors.buttonBlue
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                child: Text(textOKBtn,style: GoogleFonts.poppins(
                    color: AppColors.buttonBlue,fontWeight: FontWeight.w300,fontSize: Dimens.padding_12dp
                ),),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: c,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(heading, style:GoogleFonts.poppins(
              color: AppColors.buttonBlue
            )),
            content: Text(body, style:GoogleFonts.poppins(
                color: AppColors.buttonBlue
            )),
            actions: <Widget>[
              TextButton(
                child: Text(textOKBtn),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }


  static void showAlertDialogForDoubleBack(BuildContext c, String heading,
      {String? body, String textOKBtn = 'OK'}) {
    if (body == null) {
      showDialog(
        context: c,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              heading,
              style:GoogleFonts.poppins(
                  color: AppColors.buttonBlue
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                child: Text(textOKBtn,style: GoogleFonts.poppins(
                    color: AppColors.buttonBlue,fontWeight: FontWeight.w300,fontSize: Dimens.padding_12dp
                ),),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: c,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(heading, style:GoogleFonts.poppins(
                color: AppColors.buttonBlue
            )),
            content: Text(body, style:GoogleFonts.poppins(
                color: AppColors.buttonBlue
            )),
            actions: <Widget>[
              TextButton(
                child: Text(textOKBtn),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
  // static void showAlertDialogWithOnTap(
  //     BuildContext context, String heading, Function onTap,
  //     {String textOKBtn = 'OK'}) {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) =>
  //         AppAlertDialog(heading, onTap, textOKBtn),
  //   );
  // }


  static Future<ConfirmAction?> asyncConfirmDialog(
      BuildContext context, String body,Function() onTap,
      {String heading = 'Alert',
        String textOKBtn = 'Ok',
        String textCancelBtn = 'CANCEL'}) async {
    return showDialog<ConfirmAction?>(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(heading, style: context.textTheme.bodyText1!.copyWith(fontSize: Dimens.font_18sp)),
          content: Text(body, style: context.textTheme.bodyText1!.copyWith(fontSize: Dimens.font_16sp)),
          actions: <Widget>[
            TextButton(
              child: Text(textCancelBtn,style: context.textTheme.bodyText1!.copyWith(fontSize: Dimens.font_14sp,color: AppColors.primaryVariant)),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.CANCEL);
              },
            ),
            TextButton(
              child: Text(textOKBtn,style: context.textTheme.bodyText1!.copyWith(fontSize: Dimens.font_14sp,color: AppColors.primaryVariant)),
              onPressed: onTap,
            )
          ],
        );
      },
    );
  }

  static void showSnackBar(String message, {int seconds = 2}) {
    Get.snackbar('', message,duration: Duration(seconds: seconds),colorText: AppColors.white,backgroundColor: AppColors.buttonBlue);
  }




  static void showSnackBarWithAction(
      final GlobalKey<ScaffoldState> _scaffoldKey,
      String message,
      String actionLabel,
      Function() onTap, {
        int duration = 3,
      }) {
    // _scaffoldKey.currentState!.showSnackBar(SnackBar(
    //   content: Text(message),
    //   duration: Duration(seconds: duration),
    //   action: SnackBarAction(label: actionLabel, onPressed: onTap),
    // ));
  }

  static String minutesToHHmm(int minutes) {
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    var hhmm = '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
    if (hhmm.contains("-")) {
      hhmm = hhmm.substring(1);
    }
    return hhmm;
  }

  static bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    try {
      var num = double.parse(s);
      return true;
    } catch (e) {
      return false;
    }
    //return double.parse(s, (e) => null) != null;
  }

  /*static String getFirstDayOfMonth() {
    String strDate;
    try {
      var now = DateTime.now();
      var firstDate = DateTime(now.year, now.month, 1, now.hour, now.minute,
          now.second, now.millisecond, now.microsecond);
      strDate = DateFormat("yyyy-MM-ddTHH:mm:ss").format(firstDate);
    } catch (e) {
      printWrapped(e.toString());
    }
    return strDate;
  }

  static String getLastDateOfMonth() {
    String strDate;
    try {
      var now = DateTime.now();
      // Find the last day of the month.
      var lastDayDateTime = (now.month < 12)
          ? new DateTime(now.year, now.month + 1, 0)
          : new DateTime(now.year + 1, 1, 0);
      strDate = DateFormat("yyyy-MM-ddTHH:mm:ss").format(lastDayDateTime);
    } catch (e) {
      printWrapped(e.toString());
    }
    return strDate;
  }*/

  static String roundDecimalValue(String value) {
    printWrapped('before.........$value');
    var doubleValue = double.parse(value);
    var roundValue = doubleValue.toStringAsFixed(2);
    printWrapped('after.........$roundValue');
    //return double.parse(roundValue);
    return roundValue;
  }

  static hideKeyBoard(BuildContext context) {
    /*FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }*/
    FocusScope.of(context).requestFocus(FocusNode());
  }

  /*static convertToDdMmYyyy(BuildContext context, String inputDate) {
    var inputFormat = DateFormat("yyyy-MM-dd");
    var date1 = inputFormat.parse(inputDate);

    var outputFormat = DateFormat("dd-MM-yyyy");
    var date2String = outputFormat.format(date1);
    return date2String;
  }*/

  static String timeAgoSinceDate(String dateString,
      {bool numericDates = true}) {
    //DateTime date = this.createdTime.toLocal();
    DateTime date = DateTime.parse(dateString);
    final date2 = DateTime.now().toLocal();
    final difference = date2.difference(date);

    if (difference.inSeconds < 5) {
      return 'Just now';
    } else if (difference.inSeconds < 60) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inMinutes <= 1) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours <= 1) {
      return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inHours < 60) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays <= 1) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inDays < 6) {
      return '${difference.inDays} days ago';
    } else if ((difference.inDays / 7).ceil() <= 1) {
      return (numericDates) ? '1 week ago' : 'Last week';
    } else if ((difference.inDays / 7).ceil() < 4) {
      return '${(difference.inDays / 7).ceil()} weeks ago';
    } else if ((difference.inDays / 30).ceil() <= 1) {
      return (numericDates) ? '1 month ago' : 'Last month';
    } else if ((difference.inDays / 30).ceil() < 30) {
      return '${(difference.inDays / 30).ceil()} months ago';
    } else if ((difference.inDays / 365).ceil() <= 1) {
      return (numericDates) ? '1 year ago' : 'Last year';
    }
    return '${(difference.inDays / 365).floor()} years ago';
  }

  static String addCountryCodeInContactNumber(String number) {
    if (number != null && number.startsWith('+44')) {
      return number;
    } else if (number != null && number.startsWith('0')) {
      var result = number.replaceFirst('0', '+44');
      return result;
    } else if (number != null) {
      return '+44$number';
    } else {
      return '';
    }
  }
}

extension FileExtention on FileSystemEntity {
  String? get name {
    return this.path.split("/").last;
  }
}
