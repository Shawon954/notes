import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,

    this.obscure = false,
    required this.textInputType,
    this.suffixIcon,
    required this.labelText,
    this.validator,
  });

  final TextEditingController controller;
  final String labelText;
  final Widget? suffixIcon;
  final bool? obscure;
  final TextInputType textInputType;
  final String? Function(String? value)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure!,
      keyboardType: textInputType,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        labelText: labelText,
        labelStyle: TextStyle(fontSize: 16, color: AppColors.textDark80),

        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
