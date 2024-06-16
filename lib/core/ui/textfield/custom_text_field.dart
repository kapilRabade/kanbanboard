// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kanban_board/core/ui/theme/theme_manager.dart';


class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.errorText,
    this.labelText,
    this.hintStyle,
    this.prefix,
    this.obscure,
    this.suffixIcon,
    this.keyboardType,
    this.style,
    this.contentPadding,
    this.onChange,
    this.ontap,
    this.readOnly = false,
    this.validator,
    this.autovalidateMode,
    this.suffixText,
    this.initialValue,
    this.alignLabelWithHint,
    this.maxLines,
    this.minLines,
    this.inputFormatter,
    this.textCapitalization
  });

  final TextEditingController? controller;
  final String? suffixText;
  final bool? alignLabelWithHint;
  final String? initialValue;
  final String? hintText;
  String? errorText;
  String? labelText;
  Widget? suffixIcon;
  Widget? prefix;
  bool? obscure;
  final AutovalidateMode? autovalidateMode;
  TextStyle? hintStyle;
  TextInputType? keyboardType;
  TextStyle? style;
  Function(String)? onChange;
  final String? Function(String?)? validator;
  EdgeInsetsGeometry? contentPadding;
  final VoidCallback? ontap;
  bool readOnly;
  int? maxLines;
  int? minLines;
  List<TextInputFormatter>? inputFormatter;
  TextCapitalization? textCapitalization;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      autocorrect: false,
      initialValue: widget.initialValue,
      autovalidateMode: widget.autovalidateMode,
      controller: widget.controller,
      validator: widget.validator,
      style: widget.style,
      readOnly: widget.readOnly,
      onTap: widget.ontap,
      obscureText: widget.obscure ?? false,
      onChanged: widget.onChange,
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines ?? 1,
      minLines: widget.minLines ?? 1,
      inputFormatters: widget.inputFormatter,
      decoration: InputDecoration(
        prefix: widget.prefix,
        suffixText: widget.suffixText,
        labelText: widget.labelText,
        labelStyle: widget.style,
        hintText: widget.hintText,
        alignLabelWithHint: widget.alignLabelWithHint,
        hintStyle: widget.style,
        isDense: true,
        contentPadding: widget.contentPadding,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 0.5, color:AppColors.grey),
        ),  border:
      UnderlineInputBorder(borderSide: BorderSide(width:0.5, color:AppColors.grey)),
        suffixIcon: widget.suffixIcon,
      ),
    );
  }
}
