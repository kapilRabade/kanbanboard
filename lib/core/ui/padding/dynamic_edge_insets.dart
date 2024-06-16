import 'package:flutter/material.dart';

import 'padding_utils.dart';
class DynamicEdgeInsets extends EdgeInsets {
  DynamicEdgeInsets.all(BuildContext context, double padding) : super.all(PaddingUtils.getPadding(context, padding: padding));

  DynamicEdgeInsets.symmetric(BuildContext context, {double horizontal = 0, double vertical = 0})
      : super.symmetric(
          horizontal: PaddingUtils.getPadding(context, padding: horizontal),
          vertical: PaddingUtils.getPadding(context, padding: vertical),
        );

  DynamicEdgeInsets.only(BuildContext context, {double top = 0, double bottom = 0, double right = 0, double left = 0})
      : super.only(
          top: PaddingUtils.getPadding(context, padding: top),
          bottom: PaddingUtils.getPadding(context, padding: bottom),
          right: PaddingUtils.getPadding(context, padding: right),
          left: PaddingUtils.getPadding(context, padding: left),
        );
}
