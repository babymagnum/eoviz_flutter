import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/theme/dimens.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:flutter/material.dart';
import '../../../model/daftar_presensi/daftar_presensi_item.dart';

class ListPresensiItem extends StatelessWidget {

  ListPresensiItem({Key key, @required this.isFirst, @required this.isLast, @required this.item}): super(key: key);

  final DaftarPresensiItem item;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Parent(
      style: ParentStyle()..background.color(Colors.white)..borderRadius(all: 15)..padding(horizontal: 12, top: 15, bottom: 19)
        ..margin(top: isFirst ? 30 : 16, bottom: isLast ? 30 : 0, horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(item.date, style: ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: size.width * 0.03, color: Color(0xFF888888)),),
          SizedBox(height: 7,),
          Parent(
            style: ParentStyle()..padding(horizontal: 8, vertical: 1)..background.color(Color(int.parse('0xFF${item.statusColor}')))..borderRadius(all: Dimens.half_circle),
            child: Text(item.status, style: ThemeTextStyle.poppinsMedium.apply(color: Colors.white, fontSizeDelta: size.width * 0.025),),
          ),
          SizedBox(height: 11,),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(buildTranslate(context, 'entry_time'), maxLines: 1, overflow: TextOverflow.ellipsis, style: ThemeTextStyle.poppinsRegular.apply(color: Color(0xFF347eb2), fontSizeDelta: size.width * 0.03),),
                        SizedBox(width: 7,),
                        Text(item.jamMasuk, maxLines: 1, overflow: TextOverflow.ellipsis, style: ThemeTextStyle.poppinsMedium.apply(color: ThemeColor.dark, fontSizeDelta: size.width * 0.03),),
                      ],
                    ),
                    SizedBox(height: 3,),
                    Row(
                      children: <Widget>[
                        Text(buildTranslate(context, 'out_time'), maxLines: 1, overflow: TextOverflow.ellipsis, style: ThemeTextStyle.poppinsRegular.apply(color: ThemeColor.pastelRed, fontSizeDelta: size.width * 0.03),),
                        SizedBox(width: 7,),
                        Text(item.jamKeluar, maxLines: 1, overflow: TextOverflow.ellipsis, style: ThemeTextStyle.poppinsMedium.apply(color: ThemeColor.dark, fontSizeDelta: size.width * 0.03),),
                      ],
                    )
                  ],
                )
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(buildTranslate(context, 'entry_time'), maxLines: 1, overflow: TextOverflow.ellipsis, style: ThemeTextStyle.poppinsRegular.apply(color: Color(0xFF347eb2), fontSizeDelta: size.width * 0.03),),
                        SizedBox(width: 7,),
                        Text(item.jamMasukReal, maxLines: 1, overflow: TextOverflow.ellipsis, style: ThemeTextStyle.poppinsMedium.apply(color: ThemeColor.dark, fontSizeDelta: size.width * 0.03),),
                      ],
                    ),
                    SizedBox(height: 3,),
                    Row(
                      children: <Widget>[
                        Text(buildTranslate(context, 'out_time'), maxLines: 1, overflow: TextOverflow.ellipsis, style: ThemeTextStyle.poppinsRegular.apply(color: ThemeColor.pastelRed, fontSizeDelta: size.width * 0.03),),
                        SizedBox(width: 7,),
                        Text(item.jamKeluarReal, maxLines: 1, overflow: TextOverflow.ellipsis, style: ThemeTextStyle.poppinsMedium.apply(color: ThemeColor.dark, fontSizeDelta: size.width * 0.03),),
                      ],
                    )
                  ],
                )
              )
            ],
          )
        ],
      ),
    );
  }
}
