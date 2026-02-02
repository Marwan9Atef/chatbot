import 'dart:ui';
import 'package:chatbot/core/theme/resources/font_manager.dart';
import 'package:flutter/material.dart';
import 'app_color.dart';

abstract class AppStyles {
    static TextStyle styleMedium14() {
    return TextStyle(
      color: AppColor.grey,
      fontSize: getResponsiveFontSize(fontSize: 14),
      fontWeight: FontWeightManager.medium,
    );
  }

  static TextStyle styleMedium15() {
    return TextStyle(
      color: const Color(0xff757575),
      fontSize: getResponsiveFontSize(fontSize: 15),
      fontWeight: FontWeightManager.medium,
    );
  }
    static TextStyle styleMedium17() {
    return TextStyle(
      color: const Color(0xff3ABF38),
      fontSize: getResponsiveFontSize(fontSize: 17),
      fontWeight: FontWeightManager.medium,
    );
  }

 static TextStyle styleBold13() {
    return TextStyle(
      color:AppColor.white,
      fontSize: getResponsiveFontSize(fontSize: 13),
      fontWeight: FontWeightManager.bold,
    );
  }
 static TextStyle styleBold14() {
    return TextStyle(
      color:AppColor.grey,
      fontSize: getResponsiveFontSize(fontSize: 14),
      fontWeight: FontWeightManager.bold,
    );
  }
  static TextStyle styleBold19() {
    return TextStyle(
      color: AppColor.white,
      fontSize: getResponsiveFontSize(fontSize: 19),
      fontWeight: FontWeightManager.bold,
    );
  }

  static TextStyle styleBold20() {
    return TextStyle(
      color: AppColor.primaryColor,
      fontSize: getResponsiveFontSize(fontSize: 20),
      fontWeight: FontWeightManager.bold,
    );
  }
  static TextStyle styleBold23() {
    return TextStyle(
      color: AppColor.primaryColor,
      fontSize: getResponsiveFontSize(fontSize: 23),
      fontWeight: FontWeightManager.bold,
    );
  }


 
}

double getResponsiveFontSize({required double fontSize}) {
  double scaleFactor = getScaleFactor();
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor() {
  var dispatcher = PlatformDispatcher.instance;
  var physicalWidth = dispatcher.views.first.physicalSize.width;
  var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  double width = physicalWidth / devicePixelRatio;
  if (width < 800) {
    return width / 550;
  } else if (width < 1200) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}