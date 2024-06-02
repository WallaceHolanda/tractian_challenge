import 'package:flutter/material.dart';
import 'package:tractian_challenge/features/core/utils/enums/app_colors_enum.dart';
import 'package:tractian_challenge/features/core/utils/enums/app_strings_enum.dart';

class AssetTextFormField extends StatelessWidget {
  final int maxLength;
  final FocusNode focusNode;
  final TextEditingController controller;
  final Function(String) onChanged;
  final Function(PointerDownEvent) onTapOutside;
  final Widget? prefixIcon;
  final String? hintText;

  const AssetTextFormField({
    super.key,
    required this.maxLength,
    required this.focusNode,
    required this.controller,
    required this.onChanged,
    required this.onTapOutside,
    this.prefixIcon,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      onTapOutside: onTapOutside,
      onChanged: onChanged,
      maxLength: maxLength,
      decoration: InputDecoration(
        filled: true,
        counterText: AppStringsEnum.vazio.texto,
        fillColor: AppColorsEnum.neutralGray.cor,
        contentPadding: const EdgeInsets.only(
          left: 14.0,
          bottom: 8.0,
          top: 8.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: AppColorsEnum.white.cor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: AppColorsEnum.white.cor,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColorsEnum.gray.cor,
        ),
        prefixIcon: prefixIcon,
      ),
    );
  }
}
