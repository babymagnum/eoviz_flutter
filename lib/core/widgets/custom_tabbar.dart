import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:flutter/material.dart';

class CustomTabbar extends StatelessWidget {

  CustomTabbar({Key key, this.titleColor, @required this.title, @required this.onItemClick, @required this.image}): super(key: key);

  final Function() onItemClick;
  final String image;
  final String title;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Image.asset('assets/images/back_button_circle.png', width: size.width * 0.08, height: size.width * 0.08,),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Text(buildTranslate(context, title), maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.04, color: titleColor == null ? Colors.white : titleColor),)
          ),
          SizedBox(width: 10,),
          Opacity(
            opacity: image == '' ? 0 : 1,
            child: GestureDetector(
              onTap: onItemClick,
              child: Image.asset(image, width: size.width * 0.06, height: size.width * 0.06,)
            ),
          ),
        ],
      ),
    );
  }
}
