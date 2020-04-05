import 'package:division/division.dart';
import 'package:dribbble_clone/core/theme/dimens.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:flutter/material.dart';

class ButtonDropdown extends StatelessWidget {

  ButtonDropdown({Key key, this.imageSize, this.backgroundColor, this.image, @required this.onClick, @required this.title}): super(key: key);

  final String title;
  final Function() onClick;
  final String image;
  final Color backgroundColor;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    
    return Parent(
      gesture: Gestures()..onTap(onClick),
      style: ParentStyle()..background.color(backgroundColor == null ? Colors.white : backgroundColor)..borderRadius(all: Dimens.half_circle)..padding(horizontal: 17, vertical: 14)
        ..ripple(true),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(title, style: ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: size.width * 0.035, color: Colors.black.withOpacity(0.5)),)
          ),
          SizedBox(width: 10),
          Image.asset(image == null ? 'assets/images/ic_expand.png' : image, width: imageSize == null ? size.width * 0.06 : imageSize, height: imageSize == null ? size.width * 0.06 : imageSize,)
        ],
      ),
    );
  }
}
