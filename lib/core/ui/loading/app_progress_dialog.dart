import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban_board/core/ui/loading/app_circular_progress_indicator.dart';
import 'package:kanban_board/core/ui/theme/theme_manager.dart';
import 'package:kanban_board/core/utils/helper.dart';



String _dialogMessage = "Loading...";
enum ProgressDialogType { Normal, Download }

ProgressDialogType _progressDialogType = ProgressDialogType.Normal;
double _progress = 0.0;

bool _isShowing = false;

class AppProgressDialog {
  _MyDialog? _dialog;

  BuildContext? _buildContext, _context;

  AppProgressDialog(
      BuildContext buildContext, ProgressDialogType progressDialogtype) {
    _buildContext = buildContext;

    _progressDialogType = progressDialogtype;
  }

  void setMessage(String mess) {
    _dialogMessage = mess;
    printWrapped("AppProgressDialog message changed: $mess");
  }

  void update({double? progress, String? message}) {
    printWrapped("AppProgressDialog message changed: ");
    if (_progressDialogType == ProgressDialogType.Download) {
      printWrapped("Old Progress: $_progress, New Progress: $progress");
      _progress = progress!;
    }
    printWrapped("Old message: $_dialogMessage, New Message: $message");
    _dialogMessage = message!;
    _dialog!.update();
  }

  bool isShowing() {
    return _isShowing;
  }

  void hide(BuildContext context) {
    if (_isShowing) {
      _isShowing = false;
      Navigator.of(context).pop();
      printWrapped('AppProgressDialog dismissed');
    }
  }

  void show() {
    if (!_isShowing) {
      _dialog = new _MyDialog();
      _isShowing = true;
      printWrapped('AppProgressDialog shown');
      showDialog<dynamic>(
        context: _buildContext!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          _context = context;
          return Dialog(
              insetAnimationCurve: Curves.easeInOut,
              insetAnimationDuration: Duration(milliseconds: 100),
              elevation: Dimens.elevation_8dp,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(Dimens.radius_8dp))),
              child: _dialog);
        },
      );
    }
  }

  void showLoadingDialog(String message) {
    if (!_isShowing) {
      _isShowing = true;
      printWrapped('AppProgressDialog shown');
      showDialog<dynamic>(
        context: _buildContext!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          _context = context;
          return Dialog(
            insetAnimationCurve: Curves.easeInOut,
            insetAnimationDuration: Duration(milliseconds: 100),
            elevation: Dimens.elevation_8dp,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimens.radius_16dp))),
            child: Container(
              width: 100,
              height: 100,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    AppCircularProgressIndicator(),
                    SizedBox(height: Dimens.margin_8dp),
                    //Text(strings.loading, style: Styles.body1TextStyle)
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: context.textTheme.headline5,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }
}

// ignore: must_be_immutable
class _MyDialog extends StatefulWidget {
  var _dialog = new _MyDialogState();

  update() {
    _dialog.changeState();
  }

  @override
  // ignore: must_be_immutable
  State<StatefulWidget> createState() {
    return _dialog;
  }
}

class _MyDialogState extends State<_MyDialog> {
  changeState() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _isShowing = false;
    printWrapped('AppProgressDialog dismissed by back button');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Row(
        children: <Widget>[
          const SizedBox(width: Dimens.margin_16dp),
          /*SizedBox(
            width: 60.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.colorPrimary),
              backgroundColor: AppColors.colorAccent,
            ),
          ),
          const SizedBox(width: 15.0),*/
          Expanded(
            child: _progressDialogType == ProgressDialogType.Normal
                ? buildNormalDialog()
                : Stack(
                    children: <Widget>[
                      Positioned(
                        child: Text(_dialogMessage,
                            style: context.textTheme.headline4),
                        top: 35.0,
                      ),
                      Positioned(
                        child: Text("$_progress/100",
                            style: context.textTheme.headline4),
                        bottom: 15.0,
                        right: 15.0,
                      ),
                    ],
                  ),
          )
        ],
      ),
    );
  }

  Widget buildNormalDialog() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AppCircularProgressIndicator(),
          SizedBox(height: Dimens.margin_8dp),
          //Text(strings.loading, style: Styles.body1TextStyle)
          Text(
            _dialogMessage,
            textAlign: TextAlign.center,
            style: context.textTheme.headline5,
          )
        ],
      ),
    );
  }
}

class MessageBox {
  BuildContext buildContext;
  String message = " ", title = " ";

  MessageBox(this.buildContext, this.message, this.title);

  void show() {
    _showDialog();
  }

  Future? _showDialog() {
    showDialog(
      context: buildContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('$title'),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
          content: SizedBox(
            height: 45.0,
            child: Center(
              child: Row(
                children: <Widget>[
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: context.textTheme.headline5,
                    ),
                  ),
                  SizedBox(width: 10.0),
                ],
              ),
            ),
          ),
        );
      },
    );
    return null;
  }
}
