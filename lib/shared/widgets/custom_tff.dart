import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final double? maxHeight;
  final Widget? suffix;
  final bool? obscureText;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final String? label;
  final String? hintText;
  final bool? readOnly;
  final bool? expands;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.suffix,
    this.obscureText,
    this.maxLength,
    this.label,
    this.validator,
    this.readOnly,
    this.keyboardType,
    this.hintText,
    this.textInputAction,
    this.expands,
    this.focusNode,
    this.inputFormatters,
    this.maxHeight,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onTapOutside: (val) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          inputFormatters: inputFormatters,
          focusNode: focusNode,
          autovalidateMode: AutovalidateMode.disabled,
          textInputAction: textInputAction ?? TextInputAction.done,
          keyboardType: keyboardType,
          readOnly: readOnly ?? false,
          validator: validator,
          maxLength: maxLength,
          maxLines: maxLength ?? 1,
          obscureText: obscureText ?? false,
          controller: controller,
          autofocus: false,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          expands: expands ?? false,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[100],
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              overflow: TextOverflow.ellipsis,
            ),
            isDense: true,
            contentPadding: EdgeInsets.only(
              bottom: 12.h,
              top: 12.h,
              left: 10.w,
              right: 2.w,
            ),
            constraints: BoxConstraints(
              maxHeight: maxHeight ?? height * 0.75,
              maxWidth: width,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: label,
            labelStyle: TextStyle(
              color: Colors.grey.shade200,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              overflow: TextOverflow.ellipsis,
            ),
            suffixIcon: suffix,
            border: border(),
            enabledBorder: border(),
            disabledBorder: border(),
            focusedBorder: border(),
            errorBorder: border(),
            focusedErrorBorder: border(),
            errorStyle: TextStyle(fontSize: 0),
            counterStyle: TextStyle(
              color: Colors.black,
              fontSize: 9.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          cursorHeight: 12.h,
          cursorColor: Colors.lightGreenAccent.shade700,
        ),
      ],
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.r),
      borderSide: BorderSide.none,
    );
  }
}
