import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maya_pay/widgets/extensions/colors_extensions.dart';
import 'package:maya_pay/widgets/extensions/textstyles_extensions.dart';
import 'package:sizer/sizer.dart';

class CommonTextField extends StatefulWidget {
  final String? label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? maxLine;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscure;
  final Widget? titleSuffix;
  final Widget? suffix;
  final double suffixIconSize;
  final TextInputType? inputType;
  final Function(String?)? onChanged;
  final bool? isInputFormatter;
  final bool? isIntegerFormatter;
  final bool? isPhoneFormatter;
  final bool? isDoubleFormatter;
  final bool? maxLength;
  final bool? prefixText;
  final bool? textCapitalization;
  final bool? readOnly;
  final Function()? onTap;
  final Function(PointerDownEvent)? onTabOutside;

  const CommonTextField({
    Key? key,
    this.label,
    this.controller,
    this.validator,
    this.maxLine = 1,
    this.inputType,
    this.suffix,
    this.onChanged,
    this.isInputFormatter,
    this.isIntegerFormatter,
    this.isPhoneFormatter,
    this.isDoubleFormatter,
    this.onTap,
    this.prefixText = false,
    this.maxLength = false,
    this.onTabOutside,
    this.textCapitalization,
    this.suffixIcon,
    this.prefixIcon,
    this.obscure,
    this.titleSuffix,
    this.suffixIconSize = 16,
    this.readOnly,
  }) : super(key: key);

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLine,
      cursorColor: color.whiteColor,
      key: widget.key,
      onTapOutside: widget.onTabOutside,
      onTap: widget.onTap,
      obscureText: widget.obscure ?? false,
      textCapitalization: widget.textCapitalization == true
          ? TextCapitalization.sentences
          : TextCapitalization.none,
      controller: widget.controller,
      readOnly: widget.readOnly ?? false,
      validator: widget.validator,
      style: TextStyle().textFieldLabel,
      maxLength: widget.maxLength == true ? 10 : null,
      inputFormatters: widget.isInputFormatter == true
          ? [
              FilteringTextInputFormatter.allow(
                  RegExp("[a-z A-Z. \u0600-\u06FF]")),
            ]
          : widget.isIntegerFormatter == true
              ? [
                  FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                ]
              : widget.isPhoneFormatter == true
                  ? [
                      FilteringTextInputFormatter.allow(RegExp("[+0-9]")),
                    ]
                  : widget.isDoubleFormatter == true
                      ? [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^(?!\.?$)\d{0,6}(\.\d{0,2})?')),
                        ]
                      : null,
      keyboardType: widget.inputType ?? TextInputType.text,
      onChanged: widget.onChanged ?? (val) {},
      decoration: InputDecoration(
        counter: SizedBox(),
        suffix: widget.suffix,
        alignLabelWithHint: true,
        prefixText: widget.prefixText == true ? '+92  ' : null,
        prefixStyle: TextStyle().textFieldLabel,
        errorStyle: TextStyle(
            color: Colors.red,
            fontFamily: 'nationalMedium',
            fontSize: 13,
            height: 1.5),
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 10.sp),
          child: widget.suffixIcon,
        ),
        prefixIcon: widget.prefixIcon == null
            ? null
            : Padding(
                padding: EdgeInsets.only(left: 0.sp),
                child: widget.prefixIcon,
              ),
        label: Text(widget.label!),
        contentPadding: EdgeInsets.all(10.sp),
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder: underLineBorder(false),
        errorBorder: underLineBorder(true),
        focusedBorder: underLineBorder(false, isFocused: true),
        focusedErrorBorder: underLineBorder(false, isFocused: true),
        disabledBorder: underLineBorder(false),
      ),
    );
  }
}

OutlineInputBorder underLineBorder(bool isErrorBorder,
    {bool isFocused = false}) {
  Color c;
  if (isErrorBorder) {
    c = Colors.red;
  } else {
    if (isFocused) {
      c = Color.fromRGBO(255, 255, 255, 1);
    } else {
      c = Colors.white;
    }
  }
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: c,
    ),
    borderRadius: BorderRadius.circular(10),
  );
}
