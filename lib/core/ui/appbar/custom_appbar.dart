import 'package:flutter/material.dart';
import 'package:kanban_board/core/ui/theme/theme_manager.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Color? appBarColor;
  final Color? backIconColor;
  final Function()? onBackPressed;
  final TextStyle? textStyle;


  CustomAppBar({
    super.key,
    required this.title,
    this.appBarColor = AppColors.white,
    this.backIconColor = AppColors.black,
    this.onBackPressed,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
            elevation: 0,
            title: Text(title.toUpperCase(),
                style: textStyle ??
                    const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    )),
            backgroundColor: appBarColor != null ? appBarColor : AppColors.grey,
            titleSpacing: 0,
            centerTitle: true));
  }
}
