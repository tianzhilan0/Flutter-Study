
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void appLoadingConfig() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..loadingStyle = EasyLoadingStyle.custom
    ..maskType = EasyLoadingMaskType.black
    ..indicatorType = EasyLoadingIndicatorType.ring
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.orange
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false;
}


// /// loading的样式, 默认[EasyLoadingStyle.dark].
// EasyLoadingStyle loadingStyle;

// /// loading的指示器类型, 默认[EasyLoadingIndicatorType.fadingCircle].
// EasyLoadingIndicatorType indicatorType;

// /// loading的遮罩类型, 默认[EasyLoadingMaskType.none].
// EasyLoadingMaskType maskType;

// /// 文本的对齐方式 , 默认[TextAlign.center].
// TextAlign textAlign;

// /// loading内容区域的内边距.
// EdgeInsets contentPadding;

// /// 文本的内边距.
// EdgeInsets textPadding;

// /// 指示器的大小, 默认40.0.
// double indicatorSize;

// /// loading的圆角大小, 默认5.0.
// double radius;

// /// 文本大小, 默认15.0.
// double fontSize;

// /// 进度条指示器的宽度, 默认2.0.
// double progressWidth;

// /// [showSuccess] [showError] [showInfo]的展示时间, 默认2000ms.
// Duration displayDuration;

// /// 文本的颜色, 仅对[EasyLoadingStyle.custom]有效.
// Color textColor;

// /// 指示器的颜色, 仅对[EasyLoadingStyle.custom]有效.
// Color indicatorColor;

// /// 进度条指示器的颜色, 仅对[EasyLoadingStyle.custom]有效.
// Color progressColor;

// /// loading的背景色, 仅对[EasyLoadingStyle.custom]有效.
// Color backgroundColor;

// /// 遮罩的背景色, 仅对[EasyLoadingMaskType.custom]有效.
// Color maskColor;

// /// 当loading展示的时候，是否允许用户操作.
// bool userInteractions;

// /// 展示成功状态的自定义组件
// Widget successWidget;

// /// 展示失败状态的自定义组件
// Widget errorWidget;

// /// 展示信息状态的自定义组件
// Widget infoWidget;