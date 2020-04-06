import 'package:division/division.dart';
import 'package:dribbble_clone/core/theme/dimens.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/placeholder_network_image.dart';
import 'package:flutter/material.dart';
import '../../../model/tukar_shift/tukar_shift_item.dart';

class ListTukarShiftItem extends StatelessWidget {

  ListTukarShiftItem({Key key, @required this.item, @required this.isFirst, @required this.isLast}): super(key: key);

  final TukarShiftItem item;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Parent(
      gesture: Gestures()..onTap(() {}),
      style: ParentStyle()..margin(top: isFirst ? 0 : 15, bottom: isLast ? 15 : 0)..background.color(Colors.white)..ripple(true)
        ..padding(all: 18)..borderRadius(all: 20),
      child: Row(
        children: <Widget>[
          PlaceholderNetworkImage(url: item.image, size: Size(size.width * 0.13, size.width * 0.13), borderRadius: Dimens.half_circle),
          SizedBox(width: 15,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(item.date, style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.027, color: ThemeColor.brownGrey),),
                SizedBox(height: 2,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text(item.content, style: ThemeTextStyle.poppinsSemiBold.apply(fontSizeDelta: size.width * 0.03),),
                    ),
                    SizedBox(width: !item.isRead ? 10 : 0,),
                    Visibility(
                      visible: !item.isRead,
                      child: Parent(
                        style: ParentStyle()..width(7)..height(7)..borderRadius(all: Dimens.half_circle)..background.color(ThemeColor.coral)
                          ..margin(top: 5),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
