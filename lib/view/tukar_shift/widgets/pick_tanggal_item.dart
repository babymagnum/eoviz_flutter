import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:flutter/material.dart';

class PickTanggalItem extends StatelessWidget {

  PickTanggalItem({Key key, @required this.image, @required this.title, @required this.onClick}): super(key: key);

  final String title;
  final Function() onClick;
  final String image;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onClick,
      child: Row(
        children: <Widget>[
          Image.asset(image, width: size.width * 0.06, height: size.width * 0.06,),
          SizedBox(width: 16,),
          Expanded(
            child: Text(buildTranslate(context, title), style: ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: size.width * 0.035),)
          )
        ],
      ),
    );
  }
}
