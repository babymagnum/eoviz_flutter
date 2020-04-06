import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:flutter/material.dart';

class NoImageContent extends StatelessWidget {

  NoImageContent({Key key, @required this.content}): super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Positioned(
      left: 0, right: 0, top: 0, bottom: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/ic_empty_notif.png', width: size.width * 0.62, height: size.width * 0.49,),
          SizedBox(height: size.width * 0.11,),
          Text(buildTranslate(context, content), style: ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: size.width * 0.035, color: Color(0xFF636569)),)
        ],
      )
    );
  }
}
