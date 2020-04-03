import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  CustomTextField({Key key, @required this.onEditingComplete, @required this.onChanged, @required this.focusNode,
    @required this.inputType, @required this.textInputAction, @required this.isObsecure, @required this.borderRadius,
    this.isCenter, this.maxLength, this.hint, this.hintStyle, this.isEnabled, this.fillColor, this.textColor, this.horizontalPadding}): super(key: key);

  final Function(String) onChanged;
  final FocusNode focusNode;
  final Function() onEditingComplete;
  final TextInputType inputType;
  final TextInputAction textInputAction;
  final bool isObsecure;
  final double borderRadius;
  final bool isCenter;
  final int maxLength;
  final bool isEnabled;
  final String hint;
  final TextStyle hintStyle;
  final Color fillColor;
  final Color textColor;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      keyboardType: inputType,
      maxLines: 1,
      enabled: isEnabled == null ? true : false,
      maxLength: maxLength,
      textInputAction: textInputAction,
      style: ThemeTextStyle.poppinsMedium.apply(color: textColor == null ? Color(0xFF253644) : textColor, fontSizeDelta: MediaQuery.of(context).size.width * 0.04),
      obscureText: isObsecure,
      textAlign: isCenter == null ? TextAlign.left : TextAlign.center,
      decoration: InputDecoration(
        filled: true,
        counterText: '',
        hintText: hint,
        hintStyle: hintStyle,
        fillColor: fillColor == null ? Colors.white : fillColor,
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 0,),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 0,),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: horizontalPadding == null ? 14 : horizontalPadding, vertical: 0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 0),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
      ),
    );
  }
}
