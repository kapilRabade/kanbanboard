import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kanban_board/core/ui/theme/theme_manager.dart';


class RaisedRectButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final String? text;
  final double width;
  final double height;
  final double radius;
  final double textTBPadding;
  final VoidCallback? onPressed;

  RaisedRectButton({
    this.backgroundColor = AppColors.secondary,
    this.textColor = AppColors.white,
    this.borderColor = AppColors.transparent,
    this.text,
    this.width = double.infinity,
    this.height = Dimens.btn_height_48dp,
    this.radius = Dimens.radius_24dp,
    this.textTBPadding = Dimens.padding_8dp,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(radius),
        ),
        splashColor: this.backgroundColor,
        color: this.backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: textTBPadding,
              ),
              child: Text(
                text!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(color:textColor ,fontWeight: FontWeight.bold,fontSize: 15.0),
               // style: context.textTheme.headline5!.copyWith(color: textColor),
              ),
            ),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}
