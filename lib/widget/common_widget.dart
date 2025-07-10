import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flash_coffe/constant/color_constant.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class CommonWidget {
  static AppBar appBar(
    String title, {
    List<Widget> actions = const [],
    bool isBack = true,
    Color? bgColor,
    Color? color,
    Function()? onBack,
    bool centerTitle = false,
    double fontSize = 20, // Added fontSize parameter
  }) {
    return AppBar(
      surfaceTintColor: ColorConstant.grey0,
      backgroundColor: bgColor,
      automaticallyImplyLeading: false,
      leading:
          isBack
              ? IconButton(
                icon: Icon(Icons.arrow_back_ios, color: color),
                onPressed: onBack ?? () => Get.back(),
                iconSize: 20,
              )
              : null,
      title: textPrimaryWidget(
        title,
        fontWeight: FontWeight.w500,
        fontSize: fontSize, // Use fontSize parameter
        color: color ?? ColorConstant.grey90,
      ),
      actions: actions,
      centerTitle: centerTitle,
      elevation: 0.0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
      ),
    );
  }

  static Text textPrimaryWidget(
    String text, {
    FontWeight? fontWeight,
    double? fontSize,
    Color? color,
    TextOverflow? overflow,
    TextAlign align = TextAlign.left,
    FontStyle? fontStyle,
    int? maxLines,
  }) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: align,
      style: textStyleFiraSans(
        fontWeight: fontWeight ?? FontWeight.w600,
        fontSize: SizeUtil.f(fontSize ?? 14),
        color: color ?? ColorConstant.grey40,
        fontStyle: fontStyle,
      ),
    );
  }

  static TextStyle textStyleNunito({
    FontWeight? fontWeight,
    double? fontSize,
    Color? color,
    FontStyle? fontStyle,
    TextDecoration? decoration,
  }) {
    return GoogleFonts.nunito(
      fontWeight: fontWeight ?? FontWeight.w600,
      fontSize: SizeUtil.f(fontSize ?? 14),
      color: color ?? ColorConstant.grey90,
      fontStyle: fontStyle,
      decoration: decoration,
    );
  }

  static TextStyle textStyleFiraSans({
    FontWeight? fontWeight,
    double? fontSize,
    Color? color,
    FontStyle? fontStyle,
    TextDecoration? decoration,
  }) {
    return GoogleFonts.firaSans(
      fontWeight: fontWeight ?? FontWeight.w600,
      fontSize: SizeUtil.f(fontSize ?? 14),
      color: color ?? ColorConstant.grey90,
      fontStyle: fontStyle,
      decoration: decoration,
    );
  }

  static TextStyle textStyleMontserrat({
    FontWeight? fontWeight,
    double? fontSize,
    Color? color,
    FontStyle? fontStyle,
  }) {
    return GoogleFonts.montserrat(
      fontWeight: fontWeight ?? FontWeight.w600,
      fontSize: SizeUtil.f(fontSize ?? 14),
      color: color ?? ColorConstant.grey90,
      fontStyle: fontStyle,
    );
  }

  static Container textLoadingWidget({
    double height = 24,
    double? width,
    Color? color,
    double radius = 12,
  }) {
    return Container(
      height: SizeUtil.f(height),
      width: width ?? (Get.width * .35),
      decoration: BoxDecoration(
        color: color ?? ColorConstant.grey0.withOpacity(.5),
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

  static Container circleLoadingWidget({double? size, Color? color}) {
    return Container(
      height: SizeUtil.f(
        size ?? 50,
      ), //size != null ? SizeUtil.f(size) : SizeUtil.sr(.15),
      width: SizeUtil.f(
        size ?? 50,
      ), //size != null ? SizeUtil.f(size) : SizeUtil.sr(.15),
      decoration: BoxDecoration(
        color: color ?? ColorConstant.grey40,
        shape: BoxShape.circle,
      ),
    );
  }

  static Widget groupListWidget<T, E>({
    required List<T> elements,
    required E Function(T e) groupBy,
    required Widget Function(T data) header,
    required Widget Function(T data) content,
    int Function(T a, T b)? compare,
  }) {
    final dataHeader = elements.map(groupBy).toList();
    return ListView(
      children: [
        ...dataHeader.map((e) {
          return Column(
            children: [
              elements
                  .where((e1) => e == groupBy(e1))
                  .map((e) => header(e))
                  .first,
              ...elements
                  .where((e1) => e == groupBy(e1))
                  .map((e1) => content(e1)),
            ],
          );
        }),
      ],
    );
  }

  static BoxDecoration defBoxDecoration({
    double radius = 8,
    Color? bgColor,
    BoxShape? shape,
    double blurRadius = 8,
  }) {
    return BoxDecoration(
      color: bgColor ?? Colors.white,
      borderRadius:
          shape == null ? BorderRadius.all(Radius.circular(radius)) : null,
      shape: shape ?? BoxShape.rectangle,
      boxShadow: [
        BoxShadow(
          color: const Color.fromRGBO(0, 0, 0, 0.1),
          blurRadius: blurRadius,
          spreadRadius: 0,
          offset: const Offset(0, 0),
        ),
      ],
    );
  }

  static Widget bottomSummaryButtonWidget({
    Color? bgColor,
    String? title,
    String? actionTitle,
    String? btCaption,
    IconData? btSuffixIcon,
    Color? btCaptionColor,
    Color? btBgColor,
    Function()? onTap,
    bool isLoading = false,
    IconData? prefixIcon,
    double iconSize = 20,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: defBoxDecoration(radius: 0, bgColor: bgColor),
          child: Column(
            children: [
              if (title != null || actionTitle != null) ...[
                Row(
                  children: [
                    textPrimaryWidget(
                      title ?? '',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: ColorConstant.grey90,
                    ),
                    const Spacer(),
                    textPrimaryWidget(
                      actionTitle ?? '',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: ColorConstant.grey90,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
              const SizedBox(height: 12),
              primaryButtonWidget(
                caption: btCaption,
                onTap: onTap,
                prefixIcon: prefixIcon,
                bgColor: btBgColor,
                captionColor: btCaptionColor,
                suffixIcon: btSuffixIcon,
                isLoading: isLoading,
                iconSize: iconSize,
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ],
    );
  }

  static textFieldWidget({
    TextStyle? textStyle,
    TextInputType? keyboardType,
    TextCapitalization? textCapitalization,
    TextInputAction? textInputAction,
    Function(String value)? onSubmit,
    String? placeholder,
    TextStyle? placeholderStyle,
    double? placeholderFontSize,
    TextEditingController? controller,
    Widget? prefix,
    int? maxLines = 1,
    int? minLines,
    Widget? suffix,
    bool obscureText = false,
    List<TextInputFormatter>? inputFormatters,
    bool? isDense,
    EdgeInsetsGeometry? padding,
    ValueChanged<String>? onChanged,
    int? maxLength,
    bool counterText = false,
    Color? bgColor,
    bool? useBgColor,
    bool useBorder = true,
    Function()? onEditingComplete,
    bool? enabled,
    TextAlign textAlign = TextAlign.start,
    String? initialValue,
    bool readOnly = false,
    Color? borderColor,
    Color? focusedBorderColor,
  }) {
    return TextFormField(
      initialValue: initialValue,
      textAlign: textAlign,
      onFieldSubmitted: onSubmit,
      onEditingComplete: onEditingComplete,
      enabled: enabled,
      maxLength: maxLength,
      onChanged: onChanged,
      obscureText: obscureText,
      textCapitalization: textCapitalization ?? TextCapitalization.sentences,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      controller: controller,
      style:
          textStyle ??
          textStyleFiraSans(
            fontWeight: FontWeight.w400,
            fontSize: SizeUtil.f(16),
            color: ColorConstant.grey90,
          ),
      readOnly: readOnly,
      minLines: minLines,
      maxLines: maxLines,
      decoration: inputDecoration(
        placeholder: placeholder,
        placeholderStyle:
            placeholderStyle ??
            textStyleFiraSans(
              fontWeight: FontWeight.w400,
              fontSize: SizeUtil.f(placeholderFontSize ?? 16),
              color: ColorConstant.grey60,
            ),
        prefix: prefix,
        suffix: suffix,
        isDense: isDense,
        padding: padding,
        counterText: counterText,
        bgColor: bgColor,
        useBgColor: useBgColor,
        useBorder: useBorder,
      ).copyWith(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? ColorConstant.grey30,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: focusedBorderColor ?? ColorConstant.primary,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      inputFormatters: inputFormatters,
    );
  }

  static InputDecoration inputDecoration({
    String? placeholder,
    TextStyle? placeholderStyle,
    Widget? prefix,
    Widget? suffix,
    bool? isDense,
    EdgeInsetsGeometry? padding,
    bool counterText = false,
    Color? bgColor,
    bool? useBgColor,
    bool useBorder = true,
    Color? borderColor,
  }) {
    return InputDecoration(
      fillColor: bgColor,
      filled: useBgColor,
      counterText: counterText ? null : '',
      isDense: isDense,
      contentPadding: padding,
      prefixIcon: prefix,
      hintText: placeholder,
      hintStyle:
          placeholderStyle ??
          textStyleFiraSans(
            fontWeight: FontWeight.w400,
            fontSize: SizeUtil.f(16),
            color: ColorConstant.grey60,
          ),
      border: OutlineInputBorder(
        borderSide:
            useBorder
                ? BorderSide(
                  color: borderColor ?? ColorConstant.grey70,
                  width: 1,
                )
                : BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            useBorder
                ? BorderSide(
                  color: borderColor ?? ColorConstant.primary,
                  width: 1,
                )
                : BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide:
            useBorder
                ? BorderSide(
                  color: borderColor ?? ColorConstant.grey70,
                  width: 1,
                )
                : BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide:
            useBorder
                ? BorderSide(
                  color: borderColor ?? ColorConstant.grey70,
                  width: 1,
                )
                : BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
      suffixIcon: suffix,
    );
  }

  static Widget primaryButtonWidget({
    Color? backgroundColor,
    Color? bgColor,
    String? caption,
    IconData? prefixIcon,
    IconData? suffixIcon,
    Color? captionColor,
    Color? textColor, // New parameter for text color
    Function()? onTap,
    double iconSize = 20,
    bool isLoading = false,
    double padV = 16,
    FontWeight? fontWeight,
    double fontSize = 16,
    Color? borderColor,
    double borderWidth = 1,
    bool isEnabled = true, // New parameter for enabled state
  }) {
    final border =
        borderColor != null
            ? Border.all(color: borderColor, width: borderWidth)
            : null;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backgroundColor ?? (bgColor ?? ColorConstant.primary),
        border: border,
      ),
      child: ElevatedButton(
        onPressed: (!isLoading && isEnabled) ? onTap : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isLoading)
                  SizedBox(
                    height: SizeUtil.f(20),
                    width: SizeUtil.f(20),
                    child: CircularProgressIndicator.adaptive(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        ColorConstant.grey0,
                      ),
                      strokeWidth: 2,
                    ),
                  ),
                if (!isLoading && prefixIcon != null) ...[
                  Icon(
                    prefixIcon,
                    color: captionColor ?? Colors.white,
                    size: SizeUtil.f(iconSize),
                  ),
                  const SizedBox(width: 4),
                ],
                if (!isLoading)
                  textPrimaryWidget(
                    caption ?? 'Selanjutnya',
                    fontWeight: fontWeight ?? FontWeight.w500,
                    fontSize: fontSize,
                    color:
                        textColor ??
                        captionColor ??
                        ColorConstant.grey0, // Updated to use textColor
                  ),
                if (!isLoading && suffixIcon != null) ...[
                  const SizedBox(width: 4),
                  Icon(
                    suffixIcon,
                    color: captionColor ?? Colors.white,
                    size: SizeUtil.f(iconSize),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  static TextButton textButtonWidget({
    String? caption,
    Function()? onTap,
    Color? captionColor,
    Color? borderColor,
    bool isLoading = false,
  }) {
    return TextButton(
      onPressed: !isLoading ? onTap : () {},
      child: Text(
        caption ?? 'Selanjutnya',
        style: TextStyle(
          color: captionColor ?? ColorConstant.grey80,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }

  static ElevatedButton secondaryButtonWidget({
    Color? backgroundColor,
    Color? borderColor,
    String? caption,
    IconData? prefixIcon,
    IconData? suffixIcon,
    Color? captionColor,
    FontWeight? fontWeight,
    double? fontSize,
    int? maxLines,
    Function()? onTap,
    bool isLoading = false,
  }) {
    return ElevatedButton(
      onPressed: !isLoading ? onTap : () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        side: BorderSide(color: borderColor ?? ColorConstant.primary, width: 1),
        shadowColor: Colors.transparent,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isLoading)
                SizedBox(
                  height: SizeUtil.f(20),
                  width: SizeUtil.f(20),
                  child: CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      ColorConstant.primaryDark,
                    ),
                    strokeWidth: 2,
                  ),
                ),
              if (!isLoading && prefixIcon != null) ...[
                Icon(prefixIcon, color: captionColor ?? ColorConstant.primary),
                const SizedBox(width: 4),
              ],
              if (!isLoading)
                textPrimaryWidget(
                  caption ?? 'Selanjutnya',
                  fontWeight: fontWeight ?? FontWeight.w700,
                  fontSize: fontSize ?? 16,
                  color: captionColor ?? ColorConstant.primary,
                  maxLines: maxLines,
                ),
              if (!isLoading && suffixIcon != null) ...[
                const SizedBox(width: 4),
                Icon(suffixIcon, color: captionColor ?? ColorConstant.primary),
              ],
            ],
          ),
        ),
      ),
    );
  }

  static Widget expandedScrollWidget({
    List<Widget> top = const [],
    List<Widget> bottom = const [],
    CrossAxisAlignment crossAlign = CrossAxisAlignment.start,
    ScrollPhysics? physics,
    bool overscroll = true,
  }) {
    return CustomScrollView(
      scrollBehavior:
          overscroll
              ? null
              : const ScrollBehavior().copyWith(overscroll: false),
      physics: physics,
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            crossAxisAlignment: crossAlign,
            children: [...top, const Spacer(), ...bottom],
          ),
        ),
      ],
    );
  }

  static void bottomModalWidget({
    Widget? widget,
    double? height,
    bool isDismissible = true,
    bool dragClose = true,
    bool isScrollControlled = false,
  }) {
    Get.bottomSheet(
      Container(
        height:
            !isScrollControlled
                ? SizeUtil.f(height ?? (Get.height * .33))
                : null,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
          color: ColorConstant.grey0,
        ),
        child: widget ?? const SizedBox(),
      ),
      isDismissible: isDismissible,
      enableDrag: dragClose,
      isScrollControlled: true,
    );
  }

  static void modalWidget({
    List<Widget> widgets = const [],
    bool withClose = true,
    bool dismissible = true,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  }) {
    var paddingHz = 24.0;
    final ar = Get.width / Get.height;
    if (ar > 1.3) {
      paddingHz = Get.width * .3;
    }

    Get.dialog(
      Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: paddingHz, vertical: 24),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: crossAxisAlignment,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (withClose)
                Row(
                  children: [
                    const Spacer(),
                    IconButton(
                      onPressed: Get.back,
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ...widgets,
            ],
          ),
        ),
      ),
      barrierDismissible: dismissible,
    );
  }

  static Widget shimmerBlock({
    double width = double.infinity,
    double height = 14,
    BorderRadiusGeometry? borderRadius,
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius ?? BorderRadius.circular(4),
        ),
      ),
    );
  }
}

class SizeUtil {
  /// flexible
  static double f(double size) {
    var width = Get.width;

    // phone
    if (width < 425) {
      return size;
    }
    // tab
    else if (width > 425 && width < 768) {
      var p = (width * 100) / 425;
      // print('percent screen=$p');

      p = p - (p / 3);
      // print('percent screen 1/3=$p');

      var r = (size * p) / 100;
      // print('result=$r');

      if (r < size) return size;
      return r;
    }
    // desktop
    else {
      return (size * 120) / 100;
    }
  }

  /// grid 4
  static double g4(double size) {
    if (Get.width > Get.height || Get.width > 500) {
      return f(100);
    }
    return size;
  }

  /// full width
  static double cfw() {
    var width = Get.width * .7;
    if (Get.width > Get.height) {
      width = Get.height * .4;
    }
    return width;
  }

  /// top space bar
  static double topSpaceBar() {
    var padding = MediaQuery.of(Get.context!).padding;
    return padding.top + (Get.height * .13);
  }
}
