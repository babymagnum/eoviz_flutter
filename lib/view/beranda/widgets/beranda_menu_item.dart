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

    final size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        Parent(
          gesture: Gestures()..onTap(onClick),
          style: ParentStyle()..borderRadius(all: 10)..background.color(Colors.white)..boxShadow(color: Colors.black.withOpacity(0.1), offset: Offset(1, 4), blur: 6)
            ..ripple(true)..height(MediaQuery.of(context).size.width * 0.14),
          child: Center(
            child: Image.asset(image, width: size.width * 0.09, height: size.width * 0.09,),
          ),
        ),
        SizedBox(height: size.width * 0.024,),
        Text(buildTranslate(context, title), textAlign: TextAlign.center, style: ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: size.width * 0.027, color: Color(0xFF253644)),)
      ],
    );
  }
}
