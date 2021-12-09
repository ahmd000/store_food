import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {

  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final String hint;
  final bool obscureText;
  final Color textColor;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final String? errorText;

  AppTextField({
    required this.textEditingController,
    required this.hint,
    required this.prefixIcon,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.textColor = Colors.black,
    this.suffixIcon,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(

      textDirection: TextDirection.ltr,
      textCapitalization: TextCapitalization.none,
      keyboardType: textInputType,
      style: TextStyle(color: textColor),
      obscureText: obscureText,
      controller: textEditingController,
      decoration: InputDecoration(
        contentPadding: EdgeInsetsDirectional.zero,

        hintText: hint,
        hintMaxLines: 1,
        hintTextDirection: TextDirection.ltr,
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(suffixIcon),
        enabled: true,
        disabledBorder: getBorder(borderColor: Colors.red.shade200),
        enabledBorder: getBorder(),
        focusedBorder: getBorder(borderColor: Colors.blue),
        errorText: errorText,
        errorMaxLines: 1,
        errorBorder: getBorder(borderColor: Colors.red),
        focusedErrorBorder: getBorder(borderColor: Colors.red.shade800),
      ),
    );
  }

  OutlineInputBorder getBorder({Color borderColor = Colors.grey}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: borderColor,
        width: 1,
      ),
    );
  }
}
