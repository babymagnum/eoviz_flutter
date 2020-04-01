import 'package:dribbble_clone/core/theme/dimens.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  CustomTextField({Key key, @required this.onEditingComplete, @required this.onChanged, @required this.focusNode,
    @required this.inputType, @required this.textInputAction, @required this.isObsecure}): super(key: key);

  final Function(String) onChanged;
  final FocusNode focusNode;
  final Function() onEditingComplete;
  final TextInputType inputType;
  final TextInputAction textInputAction;
  final bool isObsecure;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      keyboardType: inputType,
      maxLines: 1,
      textInputAction: textInputAction,
      style: ThemeTextStyle.poppinsMedium.apply(color: Color(0xFF253644)),
      obscureText: isObsecure,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 0,),
          borderRadius: BorderRadius.all(Radius.circular(Dimens.half_circle)),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 0),
          borderRadius: BorderRadius.all(Radius.circular(Dimens.half_circle)),
        ),
      ),
    );
  }
}
