import 'package:flutter/material.dart';


InputDecoration inputDecoration(
    {String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? labelText,
    bool isDense = true,
    Color fillColor = Colors.white,
    Color? borderColor,
    TextStyle? hintStyle,
    double radius = 4.0,
    bool addVPadding = false}) {
  return InputDecoration(
    alignLabelWithHint: true,
    hintStyle: hintStyle ?? const TextStyle(color: Colors.white),
    contentPadding: EdgeInsets.symmetric(
        horizontal: 16, vertical: addVPadding ? 12.0 : 0.0),
    filled: true,
    fillColor: fillColor,

    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    //  isDense: isDense,
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
          color: borderColor ?? Colors.grey.shade200,
        )),
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
          color: borderColor ??Colors.grey.shade200,
        )),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
          color: borderColor ??Colors.grey.shade200,
        )),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: const BorderSide(
          color: Colors.red,
        )),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: const BorderSide(
          color: Colors.red,
        )),
    hintText: hintText,
    labelText: labelText,
  );
}
