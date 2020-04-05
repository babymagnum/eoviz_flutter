import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:flutter/material.dart';
import '../../../model/shift/shift_item.dart';

class ListShiftItem extends StatelessWidget {
  
  ListShiftItem({Key key, @required this.onClick, @required this.isFirst, @required this.item}): super(key: key);

  final Function() onClick;
  final ShiftItem item;
  final bool isFirst;

  Widget _dateInOut(context, String title, String content, size) {
    return RichText(
      maxLines: 1,
      text: TextSpan(
        style: ThemeTextStyle.poppinsSemiBold.apply(fontSizeDelta: size.width * 0.03, color: item.selected ? Colors.white : ThemeColor.dark),
        text: buildTranslate(context, title),
        children: [
          TextSpan(
            style: ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: size.width * 0.03, color: item.selected ? Colors.white : ThemeColor.dark),
            text: '   - $content'
          )
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: isFirst ? 0 : 11, left: 18, right: 18),
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: onClick,
            child: AnimatedContainer(
              margin: EdgeInsets.all(5), padding: EdgeInsets.symmetric(horizontal: 17, vertical: 11),
              width: double.infinity, duration: Duration(milliseconds: 250),
              decoration: BoxDecoration(
                color: item.selected ? ThemeColor.windowsBlue : ThemeColor.paleGreyTwo,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all(color: ThemeColor.windowsBlue, width: 1)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(item.name, style: ThemeTextStyle.poppinsSemiBold.apply(fontSizeDelta: size.width * 0.03, color: item.selected ? Colors.white : ThemeColor.dark),),
                  SizedBox(height: 2,),
                  Text('${item.unit} (${item.shift})', style: ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: size.width * 0.03, color: item.selected ? Colors.white : ThemeColor.dark),),
                  SizedBox(height: 2,),
                  _dateInOut(context, 'in', item.dateMasuk, size),
                  SizedBox(height: 2,),
                  _dateInOut(context, 'out', item.dateKeluar, size),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 250),
              opacity: item.selected ? 1 : 0,
              child: Image.asset('assets/images/ic_selected.png', width: size.width * 0.062, height: size.width * 0.062,)
            ),
          )
        ],
      ),
    );
  }
}
