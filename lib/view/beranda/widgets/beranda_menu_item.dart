import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:flutter/material.dart';

class BerandaMenuItem extends StatelessWidget {

  BerandaMenuItem({Key key, @required this.title, @required this.image, @required this.onClick}): super(key: key);

  final Function() onClick;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Parent(
          gesture: Gestures()..onTap(onClick),
          style: ParentStyle()..borderRadius(all: 10)..background.color(Colors.white)..boxShadow(color: Colors.black.withOpacity(0.1), offset: Offset(1, 4), blur: 6)
            ..ripple(true)..width(57)..height(54),
          child: Center(
            child: Image.asset(image, width: 36, height: 36,),
          ),
        ),
        SizedBox(height: 9,),
        Text(buildTranslate(context, title), textAlign: TextAlign.center, style: ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: -5, color: Color(0xFF253644)),)
      ],
    );
  }
}
