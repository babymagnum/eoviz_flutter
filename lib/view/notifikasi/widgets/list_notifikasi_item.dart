import 'package:division/division.dart';
import 'package:dribbble_clone/core/theme/dimens.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:flutter/material.dart';
import '../../../model/notifikasi/item_notifikasi.dart';

class ListNotifikasiItem extends StatelessWidget {

  ListNotifikasiItem({Key key, @required this.isLast, @required this.item, @required this.isFirst}): super(key: key);

  final ItemNotifikasi item;
  final bool isLast;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Parent(
      gesture: Gestures()..onTap(() {}),
      style: ParentStyle()..borderRadius(all: 20)..background.color(Colors.white)..padding(horizontal: 17, vertical: 15)..ripple(true)
        ..margin(top: isFirst ? 20 : 15, bottom: isLast ? 15 : 0, horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(item.date, style: ThemeTextStyle.robotoM.apply(fontSizeDelta: size.width * 0.027, color: Color(0xFF888888)),),
          SizedBox(height: 2,),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(item.title, style: item.isRead == '0' ? ThemeTextStyle.poppinsSemiBold.apply(fontSizeDelta: size.width * 0.03, color: Color(0xFF347eb2)) : ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: size.width * 0.03, color: Color(0xFF347eb2)),)
              ),
              SizedBox(width: item.isRead == '0' ? 0 : 10,),
              Visibility(
                visible: item.isRead == '0',
                child: Parent(
                  style: ParentStyle()..width(size.width * 0.02)..height(size.width * 0.02)..borderRadius(all: Dimens.half_circle)..background.color(Color(0xFFf4584e)),
                ),
              )
            ],
          ),
          SizedBox(height: 2,),
          Text(item.title, style: item.isRead == '0' ? ThemeTextStyle.poppinsSemiBold.apply(fontSizeDelta: size.width * 0.03, color: Color(0xFF253644)) : ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: size.width * 0.03, color: Color(0xFF253644)),)
        ],
      ),
    );
  }
}
