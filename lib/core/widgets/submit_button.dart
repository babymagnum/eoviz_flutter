import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/theme/dimens.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {

  SubmitButton({Key key, this.customVerticalPadding, this.customButtonSize, this.customColors, @required this.onClick, @required this.title}): super(key: key);

  final Function() onClick;
  final String title;
  final List<Color> customColors;
  final double customButtonSize;
  final double customVerticalPadding;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Parent(
      gesture: Gestures()..onTap(onClick),
      style: ParentStyle()..linearGradient(colors: customColors == null ? [
        Color(0xFF005da0).withOpacity(0.8), Color(0xFF67c3ce).withOpacity(0.8),
      ] : customColors, begin: Alignment.topLeft, end: Alignment.bottomRight)..width(double.infinity)..padding(vertical: customVerticalPadding == null ? 13 : customVerticalPadding)
        ..ripple(true)..borderRadius(all: Dimens.half_circle),
      child: Center(
        child: Text(buildTranslate(context, title), style: ThemeTextStyle.poppinsMedium.apply(color: Colors.white, fontSizeDelta: customButtonSize == null ? size.width * 0.04 : customButtonSize),),
      ),
    );
  }
}
