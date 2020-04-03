import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:flutter/material.dart';

class PengaturanMenuItem extends StatelessWidget {
  
  PengaturanMenuItem({Key key, @required this.onClick, @required this.image, @required this.isFirst, @required this.content, @required this.title}): super(key: key);

  final Function() onClick;
  final bool isFirst;
  final String image;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Parent(
      gesture: Gestures()..onTap(onClick),
      style: ParentStyle()..ripple(true)..padding(horizontal: 17, vertical: 10)..background.color(Colors.white)..borderRadius(all: 10)
        ..margin(top: isFirst ? 50 : 10, horizontal: 32),
      child: Row(
        children: <Widget>[
          Image.asset(image, width: size.width * 0.05, height: size.width * 0.05,),
          SizedBox(width: 15,),
          Expanded(
            child: Text(buildTranslate(context, title), maxLines: 1, overflow: TextOverflow.ellipsis, style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.03, color: Color(0xFF253644)),)
          ),
          SizedBox(width: 10,),
          Text(content == null ? '' : content, style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.03, color: Color(0xFFdadada)),),
          Image.asset('assets/images/next_button_circle.png', width: size.width * 0.08, height: size.width * 0.08,)
        ],
      ),
    );
  }
}
