import 'package:flutter/material.dart';
import 'package:kanban_board/core/ui/theme/theme_manager.dart';


class AppCircularProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildUI();
  }

  Widget buildUI() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.secondary),
            backgroundColor: AppColors.transparent,
          ),
          SizedBox(height: Dimens.margin_8dp),
          //Text('Loading...', style: Styles.body1TextStyle)
        ],
      ),
    );
  }
}
