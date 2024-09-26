import 'package:flutter/material.dart';
import 'package:front_end_sih/globals/app.colors.dart';
import 'package:front_end_sih/globals/app_text_styles.dart';

class AppButton {
  static MaterialButton buildMaterialButton({
    required String buttonName,
    required VoidCallback onTap,
  }) {
    return MaterialButton(
      onPressed: onTap,
      color: AppColors.themeColor,
      splashColor: AppColors.lawGreen,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
      hoverColor: AppColors.aqua,
      elevation: 6,
      height: 55,
      minWidth: 120,
      focusElevation: 12,
      child: Text(
        buttonName,
        style: AppTextStyles.headerTextStyle(),
      ),
    );
  }
}
