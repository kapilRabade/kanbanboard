import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban_board/core/ui/theme/theme_manager.dart';


class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key? key,
    required this.child,
    this.showPadding = false,
  }) : super(key: key);

  final Widget child;
  final bool showPadding;

  @override
  Widget build(BuildContext context) {
    var _child = child;

    if (showPadding) {
      _child = Padding(
        padding:  EdgeInsets.symmetric(
            vertical: Dimens.padding_32dp, horizontal: Dimens.padding_16dp),
        child: child,
      );
    } else {
      _child = Padding(
        padding: const EdgeInsets.symmetric(
            vertical: Dimens.padding_24dp, horizontal: Dimens.padding_16dp),
        child: child,
      );
    }

    return Dialog(
      elevation: Dimens.elevation_8dp,
      insetAnimationCurve: Curves.easeInOut,
      backgroundColor: context.theme.scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(Dimens.radius_16dp))),
      child: _child,
    );
  }
}

class CloseIcon extends StatelessWidget {
  const CloseIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.only(
              top: Dimens.padding_16dp, right: Dimens.padding_16dp),
          child: Icon(
            Icons.close,
            size: Dimens.icon_size_16,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        onTap: () => Navigator.of(context).pop(),
      ),
    );
  }
}
