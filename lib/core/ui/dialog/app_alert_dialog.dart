import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban_board/core/ui/buttons/raised_rect_button.dart';
import 'package:kanban_board/core/ui/dialog/custom_dialog.dart';
import 'package:kanban_board/core/ui/theme/theme_manager.dart';



class AppAlertDialog extends StatefulWidget {
  final String message;
  final tihsOkText;
  final Function() onOKTap;

  AppAlertDialog(this.message, this.onOKTap, this.tihsOkText);

  @override
  _AppAlertDialogState createState() => _AppAlertDialogState(message, onOKTap);
}

class _AppAlertDialogState extends State<AppAlertDialog> {
  final String message;
  final Function() onOKTap;

  _AppAlertDialogState(this.message, this.onOKTap);

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      showPadding: false,
      child: buildDialogContent(context),
    );
  }

  Widget buildDialogContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.padding_16dp),
      constraints: BoxConstraints(
        maxWidth: Dimens.alert_dialog_max_width,
      ),
      decoration: BoxDecoration(
        //color: AppColors.secondary,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(Dimens.radius_8dp),
        /*boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: Dimens.radius_8dp,
            offset: const Offset(0.0, 8.0),
          ),
        ],*/
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          //SizedBox(height: Dimens.margin_8dp),
          //Image.asset('assets/images/ns_logo_white.png'/*, height: 50*/),
          SizedBox(height: Dimens.margin_8dp),
          Text(
            message,
            textAlign: TextAlign.center,
            style: context.textTheme.headline5,
          ),

          SizedBox(height: Dimens.margin_16dp),
          //buildSaveButton(context),
          buildCancelButton(context),
          //SizedBox(height: Dimens.margin_8dp),
        ],
      ),
    );
  }

  /*Widget buildSaveButton(BuildContext context) {
    return RaisedRectButton(
      text: 'Save',
      textColor: AppColors.white,
      onPressed: () {},
      //backgroundColor: AppColors.white,
      //borderColor: AppColors.lightGrey,
    );
  }*/

  Widget buildCancelButton(BuildContext context) {
    return RaisedRectButton(
      text: widget.tihsOkText,
      textColor: AppColors.white,
      onPressed: onOKTap,
      //backgroundColor: AppColors.colorAccent,
      //borderColor: AppColors.lightGrey,
    );
  }
}
