import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/theme/dimens.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:flutter/material.dart';

class PersetujuanTabItem extends StatelessWidget {

  PersetujuanTabItem({Key key, @required this.title, @required this.selected, @required this.onClick}): super(key: key);

  final bool selected;
  final Function() onClick;
  final String title;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onClick,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(Dimens.half_circle)),
          color: selected ? ThemeColor.windowsBlue : ThemeColor.veryLightPinkSix
        ),
        child: Text(buildTranslate(context, title), style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.03, color: selected ? Colors.white : ThemeColor.slateGrey),),
      ),
    );
  }
}
